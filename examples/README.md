# Examples

This directory contains runnable examples showing common use cases of this module.

## Available examples

- `basic`: Minimal required inputs only.
- `custom-node-and-settings`: Custom Node.js runtime, plan SKU, startup command, and app settings.
- `production`: Production-oriented settings with premium SKU and conservative runtime flags.

## How to run an example

From an example directory:

```bash
terraform init
terraform plan
```

Before applying, review and adjust:

- `location`
- `env`
- `app`

You can also use environment variables for Azure authentication, for example:

```bash
export ARM_SUBSCRIPTION_ID="..."
export ARM_TENANT_ID="..."
export ARM_CLIENT_ID="..."
export ARM_CLIENT_SECRET="..."
```
