# Vybor
[Click here to use the helper!](https://jerold.github.io/Vybor/)

A fair and random way for friends to make up their minds.

# Deployment with github.io

```bash
git checkout gh-pages
git rebase master
pub get
pub build
git add -f build/web && git commit -m "build commit"
git push origin --delete gh-pages
git subtree push --prefix build/web origin gh-pages
```
