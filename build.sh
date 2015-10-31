#!/bin/bash

# not nice but works
function build {
  sed -n -e '/PHOTOS/,$!p' index.html.template
  for photo in $(find ./photos -name '*.jpg'); do
    echo "      <section data-background=\"$photo\"></section>"
  done
  sed -n -e '1,/PHOTOS/!p' index.html.template
}

build > index.html
