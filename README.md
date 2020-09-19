# Love2Droid, make .apk from .love "on" github

**After some setup, you will just upload your game.love file, do some configuration, wait a minute or two and download the generated signed or unsigned apk!**

## Step by step guide :
* Generate a repository from this repo with "Use this template" (See [Creating repos from a template repo](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-from-a-template)) <br/>
**All the steps below should be done in your generated repo**
* Goto actions and enable actions if they are not enabled
* Replace the game.love file in buildData with your own (it must be named game.love).
* [OPTIONAL] Replace the love.png files in the folders in buildData/res with your app icons, they must be named 'love.png' and have the same size.
* Edit the config.lua file in buildData (the file itself contains info on how to edit it).
* Goto actions tab and click on the topmost action.
* Wait until it finishes.
* Now from the artifacts download the signed or unsigned apk.

## Signed vs Unsigned
* Unsigned : This apk is not signed, aka in debug mode, you can't install this without signing.
* Signed : It was created by signing the unsigned apk with uber.

**If anything breaks or you have an suggestion then please raise an issue**

**This uses the [apktool method](https://love2d.org/wiki/Game_Distribution/APKTool) of distributing love games to android and uses [uber apk signer](https://github.com/patrickfav/uber-apk-signer) to sign the apk**
