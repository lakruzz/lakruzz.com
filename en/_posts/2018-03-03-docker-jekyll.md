---
layout: post
title:  Docker Jekyll - 5 easy steps
author: lakruzz
image: /images/blog/docker-jekyll.some.png
tags:
  - Docker
  - Docker machine
  - Jekyll
  - MacOS
---

Jekyll is a static web page generator made in Ruby. It's the engine that runs GitHub Pages. In the following you will get five easy steps to run jekyll locally, without even installing it, but simply through running a docker image.
{: .kicker}

The following instructions assumes that you are on a Mac, but it's even easier if you are on Linux. On linux you can simply skip steps 2+3, since you don't need a virtual host machine for your Docker.

![Docker Jekyll](/images/blog/docker-jekyll.png){: .pic .right .small}
## 1. Get Docker on your machine
If you already have Docker installed and knows that it's working for you - you are already onto the next step.

The easiest way to install Docker on Mac is to use the [Homebrew package manager](https://docs.brew.sh/){: target="_blank"}. If you don't have it setup already you must do it straight away, it's an absolute must.

Run this:

```shell
ruby -e "$(curl -fsSL \
  https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Once Homebrew is installed on your Mac, Docker installation is as easy as:

```shell
brew cask install virtualbox
brew install docker
brew install docker-machine
```

## 2. Create a "default" Docker Machine

Since your Mac isn't running Linux natively and your Docker container depends on it, you must have a _docker-machine_ available. This is simply how Docker works on non-linux OS, including MacOS and Windows. I'll use the name "default" in my example, but if you want to call it something else, go ahead, just replace my instances of "default" with you own name in the following instructions.

I you already have a "default" docker machine running then you can move directly onto the next step. If not this is what you need to do:

```shell
docker-machine create --driver virtualbox default
```
OK that was easy - "default" docker-machine created! Now you need to start it.

If you just created it, then it will be running. To be sure you can run `docker-machine ls`. If your "default" machine isn't running, you need to start it again.

Like this:

```shell
docker-machine start default
```
But it's even more convenient to configure your Mac to start it up automatically at each reboot.

[The way to do that](https://docs.docker.com/machine/get-started/#start-local-machines-on-startup) is to configure a launcher. Create a file called `com.docker.machine.default.plist` in the `~/Library/LaunchAgents/` directory, with the following content:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
  "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
    <dict>
        <key>EnvironmentVariables</key>
        <dict>
            <key>PATH</key>
            <string>/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin</string>
        </dict>
        <key>Label</key>
        <string>com.docker.machine.default</string>
        <key>ProgramArguments</key>
        <array>
            <string>/usr/local/bin/docker-machine</string>
            <string>start</string>
            <string>default</string>
        </array>
        <key>RunAtLoad</key>
        <true/>
    </dict>
</plist>
```

Next time you reboot your Mac, the Docker-machine will start automatically.

## 3. Prepare your shell to use the "default" docker-machine

Before you can use the `docker run` command you will need to configure your environment. You just simply have to run:

```shell
eval "$(docker-machine env default)"
```

Unfortunately you need to do this every time you open a new terminal. If you find that slightly annoying, then it's highly recommended that you just add the command to your environment file (`~/.zshrc`, `~/.bashrc` or what ever you are using.)

## 4. Define a "jekyll" alias

We want jekyll to be available as a native command, without actually installing it, so now when I have Docker working for me, I can use a docker container (**lakruzz/jekyll-plus**[^jekyll-plus]) that I've made available from the public Docker registry. So all we need is an alias, it looks like this:

```shell
alias jekyll="docker run -i -t --rm \
  -v $(pwd):/app:rw --workdir /app \
  -p 80:4000 --entrypoint jekyll lakruzz/jekyll-plus"
```

[^jekyll-plus]: The [lakruzz/jekyll-plus](https://hub.docker.com/r/lakruzz/jekyll-plus/){: target="_blank"} Docker image is an image that installs the stack used for GitHub Pages, It relies on the Ruby gem that is maintained by GitHub. In addition I've added a few jekyll plugins that are really neat but unsupported by GitHub pages. Most prominent is the [jekyll-responsive-image](https://github.com/wildlyinaccurate/jekyll-responsive-image){: target="_blank"} plugin, but if you use it, you will have to become self-hosted. I'll get back to that in another blog later.

Like in the previous step, this alias is not one you want to define every time you open a new terminal, so to make the alias permanent, simply open your environment resource file (`~/.zshrc`, `~/.bashrc` ...) again and add it there.

And while you have your resource file open I have another useful alias that I use frequently:

```shell
alias stage="open http://`docker-machine ip default`"
```

It defines an alias `stage`. When you run it, it will open a web browser, pointing to the jekyll site hosted from your "default" Docker machine.

## 5. Create a local config file in you jekyll website

To serve a Jekyll site you could simply run:

```shell
jekyll serve
```

However, when you run `jekyll serve` from a docker container, there are a few additional settings that needs to be applied as switches. Typically you would need to define `--host 0.0.0.0` and since you are mounting the local disk into the docker container, you will typically also have to force the watch to poll with `--force_polling`.

But there is more: Often when I run Jekyll in development mode I also want to build all unpublished pages, build incremental, run in verbose mode etc.

So the command I should use look like this

```shell
jekyll serve --host 0.0.0.0 --force_polling \
   --incremental --drafts --future --unpublished --verbose
```
It starts to get kinda lengthy.

So instead of stacking all these switches on top of the `jekyll serve` command, I've created an extra jekyll configuration file, alongside the default `_config.yml`. I've called it `_dev_config.yml` and it contains the following:

```yaml
# Required when running from a Docker container
host: 0.0.0.0
force_polling: true

# Speed it up a bit
incremental: true

# How much to render? These all default to false - But I want them all when I develop.
show_drafts: true
future: true
unpublished: true

# Make the machine talk to you
verbose: true
```

Now, with everything set up, I can change directory into the folder that contains my jekyll site and build and serve is like this:

```shell
jekyll serve --config _config.yml,_dev_config.yml
```

I've even created an alias for that as well. The things I end up adding to my `.zshrc` (... or `.bashrc`) file sums up to:

```shell
# Docker-machine env setup
eval $(docker-machine env default)

# Docker Jekyll aliases
alias stage="open http://`docker-machine ip default`"
alias jekyll="docker run -i -t --rm -v $(pwd):/app:rw --workdir /app \
  -p 80:4000 --entrypoint jekyll lakruzz/jekyll-plus"
alias dev-jekyll='docker run -i -t --rm -v $(pwd):/app:rw --workdir /app \
  -p 80:4000 --entrypoint jekyll lakruzz/jekyll-plus \
  serve --config _config.yml,_dev_config.yml'
```

## Docker Jekyll - anything as code

The approached described here, for running Jekyll locally, without actually installing it taps perfectly into the contemporary _anything as code_ buzz; If you build your web site for production using the same image as you use for development it's game over for all the _snowflake_ servers - I'll touch on this topic in a future blog.
