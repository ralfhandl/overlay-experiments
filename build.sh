for overlay in examples/*-overlay.*; do
  extension="${overlay##*.}"
  filestem="${overlay%-*}"
  input="${filestem}-input.${extension}"

  echo "Applying overlay: $overlay"
  echo "--- bump ---"
  npx bump overlay "$input" "$overlay" > "${filestem}-result-bump.${extension}"
  echo "------------"

  echo "--- speakeasy ---"
  speakeasy overlay apply -s "$input" --overlay "$overlay" --out "${filestem}-result-speakeasy.${extension}"
  echo "-----------------"
  
  echo "--- openapi-format ---"
  npx openapi-format "$input" --no-sort --overlayFile "$overlay" --output "${filestem}-result-openapi-format.${extension}"
  echo "----------------------"

  echo
done
