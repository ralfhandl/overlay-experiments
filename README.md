# Overlay Experiments

Apply example overlays to example inputs with both [bump-cli](https://www.npmjs.com/package/bump-cli#the-overlay-command) and [speakeasy](https://www.speakeasy.com/docs/speakeasy-reference/cli/overlay).

## Installation

- Clone this repo
- [Install speakeasy](https://www.speakeasy.com/docs/speakeasy-reference/cli/getting-started#install) globally
- `npm install`

## Playing Around

Script `npm run build` will loop over all `*-overlay.json` and `*-overlay.yaml` files in the `examples` folder and use both tools to apply the overlay to the corresponding `*-input.json` or `*-input.yaml` file. Overlay and input must have the same file extension.
