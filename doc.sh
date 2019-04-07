#!/bin/sh
echo '>>> Switching to project root dir.'
cd ~/code/ios/koshercocoa/;

echo '>>> Preparing Project'
echo '    - Copying source to temporary directory.'
cp -r KosherCocoa/ temp/;

echo '    - Switching to temporary directory.'
cd temp;


echo '    - Renaming `Library` to `KosherCocoa`, to match umbrella header.'
mv Library/ KosherCocoa/;
cd KosherCocoa;

echo '    - Flattening directory.'
find ./ -mindepth 2 -type f -exec mv '{}' ./ ';'

echo '    - Moving back up to parent directory.'
cd ~/code/ios/koshercocoa/temp;

echo '>>> Running Jazzy'
# export SOURCEKIT_LOGGING=3;
jazzy \
  --objc \
  --author "Moshe Berman" \
  --clean \
  --umbrella-header ./KosherCocoa.h \
  --framework-root ./ \
  --output ../docs \
  --readme ../README.md \
  --github_url https://github.com/mosheberman/KosherCocoa


echo ' >>> Cleaning up...'
echo '    - Moving back up to parent directory.'
cd ../; 
echo '    - Removing temporary directory.'
rm -rf ./temp;
echo 'Done!'
