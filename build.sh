for overlay in examples/*-overlay.*; do
  extension="${overlay##*.}"
  filestem="${overlay%-*}"
  input="${filestem}-input.${extension}"

  echo "Applying overlay: $overlay"
  echo "--- bump ---"
  npx bump overlay "$input" "$overlay" > "${filestem}-result-bump.${extension}"
  echo "------------"

  echo "--- speakeasy ---"
  speakeasy overlay apply --logLevel error -s "$input" --overlay "$overlay" --out "${filestem}-result-speakeasy.${extension}"
  echo "-----------------"
  
  echo
done
