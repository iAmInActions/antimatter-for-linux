# antimatter-for-linux

## DISCLAIMER: This Application is inofficial. It is not being maintained by IvarK so please dont bother them about bugs found here.

### About

This project is a fan-made port of the Antimatter Dimensions game to linux.

It was created by me for a friend who wants to play the game on his linux machine. **ALL CREDIT FOR THE GAME GOES TO** [IvarK](https://github.com/IvarK/IvarK.github.io/)!

The current version of this project is very hacky and uses electron meaning it may not be very memory efficient. I have kept the external libraries to a minimum, only including one in the build and using two while building. There however are plans for making a better version in the future. You will be able to keep your progress when upgrading once it releases thanks to txt exports.

### Where are the Downloads?

Prebuild binaries for x86_64, aarch64 and armhf can be found in the releases section.

### Future plans:

These are my plans going forwards:
- Switch to an embedded WebKit based approach for better memory efficiency
- Add a display settings menu
- Add mod support
- Add rich presense
- SteamVR overlay (not prioritised)

### Building it yourself:

You will have to clone the repository first:

`git clone https://github.com/iAmInActions/antimatter-for-linux`

You also need to have node.js and npm installed.

Now simply run

`chmod +x build.sh && ./build.sh`

to build the game.

**Note:**

If you only want the binaries and do not want to keep any of the other files, pass the `-clean` argument.
