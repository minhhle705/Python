---
name: fork-and-pr
description: Branches, commits, pushes and opens a PR for a fix, ONLY against the user's fork. Use when asked to submit, push or open a PR.
allowed-tools: Bash, Read
---
1. Run `git remote get-url origin`. It must contain `<you>/Python`. If not, stop.
2. Run `python3 -m doctest -v <changed file>` and `ruff check <changed file>`. If doctests fail, stop.
3. Create branch `fix-binomial-overflow` (or `fix-<short-name>`) from master.
4. Commit only the files the fix needs, with a clear message.
5. `git push -u origin <branch>`
6. Open the PR with explicit repo and base (gh defaults to upstream on forks):
   `gh pr create --repo <you>/Python --base master --head <branch> --title "<title>" --body "<body>"`
7. PR body: problem, fix, tests added, a CONTRIBUTING.md checklist, and
   "Related upstream issue: binomial_distribution overflow" as plain text (no link, no #number).