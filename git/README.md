# Git

A guide for programming within version control.

## Best Practices

- Avoid merge commits by using a [rebase workflow].
- Squash multiple trivial commits into a single commit.
- Write a [good commit message].

[rebase workflow]: https://github.com/thoughtbot/guides/blob/main/git/README.md#merge
[good commit message]: http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html

## Maintain a Repo

- Avoid including files in source control that are specific to your development
  machine or process.
- Delete local and remote feature branches after merging.
- Perform work in a feature branch.
- Rebase frequently to incorporate upstream changes.
- Use a [pull request] for code reviews.

[pull request]: https://help.github.com/articles/using-pull-requests/

## Write a Feature

Create a local feature branch based off `main`.

```console
git checkout main
git pull
git checkout -b <branch-name>
```

Rebase frequently to incorporate upstream changes.

```console
git fetch origin
git rebase origin/main
```

Resolve conflicts. When feature is complete and tests pass, stage the changes.

```console
git add --all
```

When you've staged the changes, commit them.

```console
git status
git commit --verbose
```

Write a [good commit message]. Example format:

    Present-tense summary under 50 characters

    - More information about commit (under 72 characters).
    - More information about commit (under 72 characters).

    http://project.management-system.com/ticket/123

If you've created more than one commit, [use `git rebase` interactively] to squash them into cohesive commits with good
messages:

```console
git rebase -i origin/main
```

Share your branch.

```console
git push origin <branch-name>
```

Submit a [GitHub pull request].

Ask for a code review in the project's chat room.

[good commit message]: http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html
[use `git rebase` interactively]: https://help.github.com/articles/about-git-rebase/
[github pull request]: https://help.github.com/articles/using-pull-requests/

## Review Code

A team member other than the author reviews the pull request. They follow [Code
Review](/code-review/) guidelines to avoid miscommunication.

They make comments and ask questions directly on lines of code in the GitHub web
interface or in the project's chat room.

For changes which they can make themselves, they check out the branch.

```console
git checkout <branch-name>
./bin/setup
git diff staging/main..HEAD
```

They make small changes right in the branch, test the feature on their machine,
run tests, commit, and push.

When satisfied, they comment on the pull request `Ready to merge.`

## Merge

Rebase interactively. Squash commits like "Fix whitespace" into one or a small
number of valuable commit(s). Edit commit messages to reveal intent. Run tests.

```console
git fetch origin
git rebase -i origin/main
```

Force push your branch. This allows GitHub to automatically close your pull
request and mark it as merged when your commit(s) are pushed to `main`. It also
makes it possible to [find the pull request] that brought in your changes.

```console
git push --force-with-lease origin <branch-name>
```

View a list of new commits. View changed files. Merge branch into `main`.

```console
git log origin/main..<branch-name>
git diff --stat origin/main
git checkout main
git merge <branch-name> --ff-only
git push
```

Delete your remote feature branch.

```console
git push origin --delete <branch-name>
```

Delete your local feature branch.

```console
git branch --delete <branch-name>
```

[find the pull request]: http://stackoverflow.com/a/17819027
