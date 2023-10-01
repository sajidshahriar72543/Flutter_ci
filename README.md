<div style="text-align: justify">

# Flutter CI

### A very basic continuous integration and automated release of any flutter project using github actions and linux build system.

<br>

## How to use?
- Fork this repo
- Add secret to your repo. For that you need to make a secret in github named ```TOKEN``` and add your github token as key to that secret. 
- Make necessary changes to your files
- Save and commit with proper commit message
- As soon as you push to remote repo, it will start the build automatically and after completing it'll release the apks with source code under a proper release tag

## Notes
- It compiles for only android by default. For ios, you'll need to add it's corresponding run command to the build_app job.
- It uses Java 12.x by default.
- Probably all fixes are done already. Any other additions from you guys are always welcomed :)

<br>

```
Hope you like my work.
Cheers!
``` 
---

---

# Want to contribute?

# 🎃 HacktoberFest 2023 ACCEPTED 🎃

This is a beginner-friendly repository made specifically for Hacktoberfest.

## What is Hacktoberfest?

A month-long celebration from October 1st - 31st sponsored by [Digital Ocean](https://hacktoberfest.digitalocean.com/) and [GitHub](https://github.com/blog/2433-celebrate-open-source-this-october-with-hacktoberfest) to get people involved in [Open Source](https://github.com/open-source). Create your very first pull request to any public repository on GitHub and contribute to the open source developer community.

[https://hacktoberfest.digitalocean.com/](https://hacktoberfest.digitalocean.com/)

## Getting started

- Fork this repository
- Make your changes
- Commit and push with proper commit msg

```markdown
git add .
git commit -m 'commit msg'
git push origin branch-name
```

## How to Participate

- Create a new valid pull request from your forked repository (Click the `New Pull Request` button located at the top of your repo)
- Wait for your PR review and merge approval!