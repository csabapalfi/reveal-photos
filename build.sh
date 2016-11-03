#!/bin/bash

# not nice but works
function build {
  sed -n -e '/PHOTOS/,$!p' index.html.template
  for photo in $(find ./photos -name '*.jpg'); do
    id=$(echo $(basename $photo) | cut -d '.' -f1)
    echo "      <section id=\"photo-${id: -4}\" data-background=\"$photo\" data-background-size=\"contain\"></section>"
  done
  sed -n -e '1,/PHOTOS/!p' index.html.template
}

build > index.html
