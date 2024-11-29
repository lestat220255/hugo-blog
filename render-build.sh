#!/bin/bash
# save as render-build.sh and make sure it's executable
hugo version # Output the OLD version

# Corrected line: added space after [[ and before ! 
if [[ ! -f $XDG_CACHE_HOME/hugo ]]; then 
  echo "...Downloading HUGO" 
  mkdir -p ~/tmp 
  wget -P ~/tmp https://github.com/gohugoio/hugo/releases/download/v0.139.2/hugo_0.139.2_Linux-64bit.tar.gz
  cd ~/tmp
  echo "...Extracting HUGO" 
  tar -xzvf hugo_0.139.2_Linux-64bit.tar.gz
  echo "...Moving HUGO"
  mv hugo $XDG_CACHE_HOME/hugo  
  cd $HOME/project/src # Make sure we return to where we were
else 
  echo "...Using HUGO from build cache"
fi

$XDG_CACHE_HOME/hugo version # Output the NEW version
$XDG_CACHE_HOME/hugo --gc --minify