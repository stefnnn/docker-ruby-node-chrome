# docker-ruby-node-chrome

A Docker image for running tests in the Bitbucket build pipeline. 
It builds on top of the Ruby image and adds current versions of both Node.js and Chrome, and some system libraries.

This custom pipeline image helps us save build minutes, because we don't have to install Node.js and Chrome on every CI run. 
This image is not used for staging or production builds (we don't need Chrome there).

## How to build & push a new image

Tag the image with both `latest` and a more specific identifier, e.g. `ruby-3.1.2_node-16.17_chrome-106` (in lieu of XXXXXX).

    docker login
    git clone https://github.com/stefnnn/docker-ruby-node-chrome
    cd docker-ruby-node-chrome
    docker build -t stefannn/docker-ruby-node-chrome:latest .
    docker tag stefannn/docker-ruby-node-chrome:latest stefannn/docker-ruby-node-chrome:XXXXXX
    docker push stefannn/docker-ruby-node-chrome:latest
    docker push stefannn/docker-ruby-node-chrome:XXXXXX

## How to list existing images

    wget -qO- https://registry.hub.docker.com/v2/repositories/stefannn/docker-ruby-node-chrome/tags |grep -oE '"name":"[^"]+"'
