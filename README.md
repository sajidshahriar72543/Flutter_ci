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
