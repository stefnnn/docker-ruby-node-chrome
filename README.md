# docker-ruby-node-chrome

A Docker image for running tests in the Bitbucket build pipeline. 
It builds on top of the Ruby image and adds current versions of both Node.js and Chrome, and some system libraries.

This custom pipeline image helps us save build minutes, because we don't have to install Node.js and Chrome on every CI run. 
This image is not used for staging or production builds (we don't need Chrome there).

## How to build & push a new image

Tag the image with a specific identifier, e.g. `ruby-3.1.2_node-16.17_chrome-106` (in lieu of XXXXXX below).

Note that using `latest` is not a good idea here, because different Git branches might  
depend on different Ruby versions and we don't want to break everyone's Bitbucket builds.

    docker login
    git clone https://github.com/stefnnn/docker-ruby-node-chrome
    cd docker-ruby-node-chrome
    docker build . # This will output the bundled Ruby, Node.js and Chrome versions for the tag
    docker tag <the sha of the image that was just built> stefannn/docker-ruby-node-chrome:XXXXXX
    docker push stefannn/docker-ruby-node-chrome:XXXXXX

## How to list existing images

    wget -qO- https://registry.hub.docker.com/v2/repositories/stefannn/docker-ruby-node-chrome/tags |grep -oE '"name":"[^"]+"'
