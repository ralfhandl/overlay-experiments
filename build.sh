for overlay in examples/*-overlay.*; do
  extension="${overlay##*.}"
  filestem="${overlay%-*}"
  input="${filestem}-input.${extension}"

  echo "Applying overlay: $overlay"
  echo "--- bump ---"
  npx bump overlay "$input" "$overlay"
  echo "------------"

  echo "--- speakeasy ---"
  speakeasy overlay apply -s "$input" -o "$overlay"
  echo "-----------------"
  
  echo
done
