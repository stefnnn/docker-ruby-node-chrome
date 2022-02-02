# docker-ruby-node-chrome
A docker image using the ruby base image and adding a current node version

We use this for the Bitbucket build pipeline only, so that we do not have to install node and chrome on every CI run. This is not used for staging or producion builds (we don't need chrome there).

## How to build & push a new image

```
docker login
git clone https://github.com/stefnnn/docker-ruby-node-chrome
cd docker-ruby-node-chrome
docker build -t stefannn/docker-ruby-node-chrome:latest ./
docker push stefannn/docker-ruby-node-chrome:latest
```
