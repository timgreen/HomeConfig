---
name: commit
description: "Generates a git commit command with a proper message for staged changes."
disable-model-invocation: true
---

# Instructions
Based on the following staged changes

```diff
!{git diff --cached}
```

Don't add or remove any other changes.

Prepare a conventional commit message (https://www.conventionalcommits.org)

Run `git commit -m \"...\"` command with a concise and informative commit message.
