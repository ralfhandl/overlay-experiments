for overlay in examples/*-overlay.*; do
  extension="${overlay##*.}"
  filestem="${overlay%-*}"
  input="${filestem}-input.${extension}"

  echo "Applying overlay: $overlay"

  echo "--- Apigee Go Gen OAS Overlay ---"
  apigee-go-gen transform oas-overlay --spec "$input" --overlay "$overlay" --output "${filestem}-result-apigee.${extension}"
  echo "---------------------------------"

  echo "--- bump ---"
  npx bump overlay "$input" "$overlay" > "${filestem}-result-bump.${extension}"
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
