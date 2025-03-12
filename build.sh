echo bump
npx bump overlay examples/array-update-input.json examples/array-update-overlay.json 
echo

echo speakeasy
speakeasy overlay apply -s examples/array-update-input.json -o examples/array-update-overlay.json 
echo
