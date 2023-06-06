#!/bin/bash
echo '    _____          __  .__                __    __                  
   /  _  \   _____/  |_|__| _____ _____ _/  |__/  |_  ___________   
  /  /_\  \ /    \   __\  |/     \\__  \\   __\   __\/ __ \_  __ \  
 /    |    \   |  \  | |  |  Y Y  \/ __ \|  |  |  | \  ___/|  | \/  
 \____|__  /___|  /__| |__|__|_|  (____  /__|  |__|  \___  >__|     
         \/     \/              \/     \/                \/         
 ________  .__                             .__                      
 \______ \ |__| _____   ____   ____   _____|__| ____   ____   ______
  |    |  \|  |/     \_/ __ \ /    \ /  ___/  |/  _ \ /    \ /  ___/
  |    |   \  |  Y Y  \  ___/|   |  \\___ \|  (  <_> )   |  \\___ \ 
 /_______  /__|__|_|  /\___  >___|  /____  >__|\____/|___|  /____  >
         \/         \/     \/     \/     \/               \/     \/ 
          ______           _      _                  
         |  ____|         | |    (_)                 
         | |__ ___  _ __  | |     _ _ __  _   ___  __
         |  __/ _ \| "__| | |    | | "_ \| | | \ \/ /
         | | | (_) | |    | |____| | | | | |_| |>  < 
         |_|  \___/|_|    |______|_|_| |_|\__,_/_/\_\

Made in 2023 by mueller_minki, MIT License; Feel free to modify & share.
This is an automated build script. It will gather all dependencies and
build the game for x86_64, aarch64 and armhf in the AppImage format.
'
sleep 1
echo "Starting build in 3 seconds... CTRL + C now to exit instead."

# Set up our directories
echo "Creating skeleton..."
mkdir src
mkdir build

# Get the original source:
echo "Cloning original repository..."
git clone https://github.com/IvarK/IvarK.github.io src

# Get the node modules:
echo "Downloading dependencies..."
npm install

# Make the actual AppImages using our custom configuration:
echo "Compiling x86_64 AppImage..."
./node_modules/.bin/electron-builder build -l --x64 -c electron-builder.json
echo "Compiling aarch64 AppImage..."
./node_modules/.bin/electron-builder build -l --arm64 -c electron-builder.json
echo "Compiling armhf AppImage..."
./node_modules/.bin/electron-builder build -l --armv7l -c electron-builder.json

# Move the binaries into our build folder:
mv dist/*.AppImage build/

# Clean up:
if [ -z "$1" ]
then
  echo "No -clean, not cleaning up."
else 
  if (( $1 == "-clean" ))
  then
    echo "Cleaning up..."
    rm -rf dist node_modules src
  fi
fi
