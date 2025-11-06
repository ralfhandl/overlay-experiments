#!/usr/bin/env bash

if [ -z "$1" ]; then
  overlays=$(find examples -name '*overlay.*')
elif [ -f "$1" ]; then
  overlays="$1"
elif [ -f "$1overlay.yaml" ]; then
  overlays="$1overlay.yaml"
elif [ -f "$1overlay.json" ]; then
  overlays="$1overlay.json"
else
  echo "Overlay file not found: $1"
  echo
  echo "Usage: $0 [<path-to-overlay>]"
  exit 1
fi

for overlay in $overlays; do
  extension="${overlay##*.}"
  filestem="${overlay%-*}"
  input="${filestem}-input.${extension}"
  if [ ! -f "$input" ]; then
    echo "Input file not found: $input"
    exit 1
  fi

  echo "***************************************************************"
  echo "Applying overlay: $overlay"
  echo "***************************************************************"

  echo "--- Apigee Go Gen OAS Overlay ---"
  apigee-go-gen transform oas-overlay --spec "$input" --overlay "$overlay" --output "${filestem}-result-apigee.${extension}"
  echo "---------------------------------"

  echo "--- bump ---"
  npx bump overlay "$input" "$overlay" > "${filestem}-result-bump.${extension}"
  echo "------------"

  echo "--- clio ---"
  clio apply "$input" --overlay "$overlay" --output "${filestem}-result-clio.${extension}"
  echo "------------"

  echo "--- oas-patch ---"
  oas-patch overlay "$input" "$overlay" -o "${filestem}-result-oas-patch.${extension}"
  echo "-----------------"

  echo "--- openapi-format ---"
  npx openapi-format "$input" --no-sort --overlayFile "$overlay" --output "${filestem}-result-openapi-format.${extension}"
  echo "----------------------"

  echo "--- speakeasy ---"
  speakeasy overlay apply -s "$input" --overlay "$overlay" --out "${filestem}-result-speakeasy.${extension}"
  echo "-----------------"
  
  echo
done
