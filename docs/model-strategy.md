# Model Strategy

## Initial Defaults

- Primary: `opencode/deepseek-v4-flash-free`
- Lightweight tasks: `opencode/north-mini-code-free`

Both model IDs explicitly indicate free availability in the installed OpenCode model catalog. Free-model availability can change, so validate the catalog with:

```bash
opencode models opencode
```

## Provider Accounts

This computer currently has OpenCode and OpenAI credentials configured. The harness does not store or copy those credentials; OpenCode manages them separately under its local data directory.

ChatGPT subscriptions and OpenAI API billing are different products. OAuth-based access supported by OpenCode may use eligible subscription access, while API-key use can incur separate charges.

## Selection Policy

- Use a free model by default.
- Switch models manually when a task needs stronger reasoning or different capabilities.
- Do not hard-code provider secrets in this repository.
- Review quality and usage before adding any paid provider as a default.
