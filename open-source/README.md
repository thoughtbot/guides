# Open Source Protocol

A guide for releasing and maintaining open source projects.

## Accepting a GitHub Pull Request

Given you have this in your `~/.gitconfig`:

```text
[alias]
  co-pr = !sh -c 'git fetch origin pull/$1/head:pr/$1 && git checkout pr/$1' -
```

Check out the code by its GitHub pull request number:

```console
git co-pr 123
```

Rebase interactively, squash, and potentially improve commit messages:

```console
git rebase -i main
```

Look at changes:

```console
git diff origin/main
```

Run the code and tests. For example, on a Ruby project:

```console
bundle
rake
```

Merge code into main:

```console
git checkout main
git merge pr/123 --ff-only
```

Push:

```console
git push origin main
```

Clean up:

```console
git branch -D pr/123
```
