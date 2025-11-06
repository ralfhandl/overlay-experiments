# Overlay Experiments

Apply example overlays to example inputs with

- [Apigee Go Gen](https://apigee.github.io/apigee-go-gen/transform/commands/oas-overlay/)
- [bump-cli](https://www.npmjs.com/package/bump-cli#the-overlay-command)
- [BinkyLabs.OpenApi.Overlays - dotnet](https://github.com/BinkyLabs/openapi-overlays-dotnet)
- [OAS Patcher](https://github.com/mcroissant/oas_patcher)
- [openapi-format](https://github.com/thim81/openapi-format)
- [speakeasy](https://www.speakeasy.com/docs/speakeasy-reference/cli/overlay).

## Results

| Example \ Tool               | apigee-go-gen | bump | clio | oas-patch | openapi-format | speakeasy |
| ---------------------------- | :-----------: | :--: | :--: | :-------: | :------------: | :-------: |
| array-remove-object          |      ✔️       |  ✔️  |  ✔️  |    ✔️     |       ✔️       |    ✔️     |
| array-remove-primitive (1.1) |      ✔️       |  ✔️  |  ✔️  |    ✔️     |       ✔️       |    ✔️     |
| array-update-w-object        |      ✔️       |  ❌  |  ✔️  |    ✔️     |       ❌       |    ❌     |
| array-update-w-primitive     |      ✔️       |  ❌  |  ✔️  |    ❌     |       ❌       |    ❌     |
| object-remove-property       |      ✔️       |  ✔️  |  ✔️  |    ✔️     |       ✔️       |    ✔️     |
| object-update                |      ✔️       |  ✔️  |  ✔️  |    ✔️     |       ✔️       |    ✔️     |
| object-update-w-condition    |      ✔️       |  ✔️  |  ✔️  |    ❌     |       ✔️       |    ✔️     |
| overlay-issue-38             |      ❌       |  ❌  |  ✔️  |    ✔️     |       ❌       |    ❌     |
| primitive-item-update (1.1)  |      ✔️       |  ✔️  |  ✔️  |    ❌     |       ✔️       |    ✔️     |
| primitive-value-update (1.1) |      ✔️       |  ✔️  |  ✔️  |    ✔️     |       ❌       |    ✔️     |
| traits                       |      ❌       |  ❌  |  ✔️  |    ✔️     |       ❌       |    ❌     |
| update-non-existing-target   |      ✔️       |  ✔️  |  ✔️  |    ✔️     |       ✔️       |    ✔️     |
| **Compliance Sets**          |
| array-remove                 |      ✔️       |  ✔️  |  ✔️  |    ✔️     |       ✔️       |    ✔️     |
| description-and-summary      |      ✔️       |  ✔️  |  ✔️  |    ✔️     |       ✔️       |    ✔️     |
| remove-example               |      ✔️       |  ✔️  |  ✔️  |    ✔️     |       ✔️       |    ✔️     |
| remove-matching-responses    |      ✔️       |  ✔️  |  ✔️  |    ✔️     |       ✔️       |    ✔️     |
| remove-property              |      ❌       |  ❌  |  ✔️  |    ✔️     |       ✔️       |    ❌     |
| remove-server                |      ✔️       |  ✔️  |  ✔️  |    ✔️     |       ✔️       |    ✔️     |
| replace-servers-for-sandbox  |      ✔️       |  ✔️  |  ✔️  |    ✔️     |       ✔️       |    ✔️     |
| update-root                  |      ✔️       |  ✔️  |  ✔️  |    ✔️     |       ✔️       |    ✔️     |

## Installation

- Clone this repo
- [Install Apigee Go Gen](https://apigee.github.io/apigee-go-gen/installation/) globally
- [Install BinkyLabs OpenAPI Overlays CLI](https://github.com/BinkyLabs/openapi-overlays-dotnet/tree/main/src/tool) globally
- [Install speakeasy](https://www.speakeasy.com/docs/speakeasy-reference/cli/getting-started#install) globally
- `npm install`

## Playing Around

Script `npm run build` will loop over all `*-overlay.json` and `*-overlay.yaml` files in the `examples` folder and use all tools to apply the overlay to the corresponding `*-input.json` or `*-input.yaml` file. Overlay and input must have the same file extension.
