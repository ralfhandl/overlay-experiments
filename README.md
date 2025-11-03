# Overlay Experiments

Apply example overlays to example inputs with

- [Apigee Go Gen](https://apigee.github.io/apigee-go-gen/transform/commands/oas-overlay/)
- [bump-cli](https://www.npmjs.com/package/bump-cli#the-overlay-command)
- [OAS Patcher](https://github.com/mcroissant/oas_patcher)
- [openapi-format](https://github.com/thim81/openapi-format)
- [speakeasy](https://www.speakeasy.com/docs/speakeasy-reference/cli/overlay).

## Results

| Example \ Tool         | Apigee Go Gen      |        bump        |    OAS Patcher     |   openapi-format   |     speakeasy      |
| ---------------------- | :----------------- | :----------------: | :----------------: | :----------------: | :----------------: |
| array-remove           | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |
| array-update           | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |
| overlay-issue-38       | :heavy_check_mark: | :heavy_check_mark: |        :x:         |        :x:         | :heavy_check_mark: |
| primitive-array-update | :heavy_check_mark: | :heavy_check_mark: |        :x:         | :heavy_check_mark: | :heavy_check_mark: |
| primitive-update       | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |
| traits                 | :heavy_check_mark: | :heavy_check_mark: |        :x:         |        :x:         | :heavy_check_mark: |

## Installation

- Clone this repo
- [Install Apigee Go Gen](https://apigee.github.io/apigee-go-gen/installation/) globally
- [Install speakeasy](https://www.speakeasy.com/docs/speakeasy-reference/cli/getting-started#install) globally
- `npm install`

## Playing Around

Script `npm run build` will loop over all `*-overlay.json` and `*-overlay.yaml` files in the `examples` folder and use both tools to apply the overlay to the corresponding `*-input.json` or `*-input.yaml` file. Overlay and input must have the same file extension.
