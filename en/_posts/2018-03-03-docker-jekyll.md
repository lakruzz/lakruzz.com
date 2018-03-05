---
layout: post
title:  Docker Jekyll
author: Lars Kruse
tags:
  - Docker
  - Docker machine
  - Jekyll
  - MacOS
---

Jekyll is a static web page generator made in Ruby. It's the engine that runs GitHub Pages. In the following you will get four easy steps to run jekyll locally, without even installing it, but simply through a docker image.
{: .kicker}

The following instructions expect that you are on a Mac, but it's even easier if you are on Linux.

## 1. Get Docker on your machine
If you already have Docker installed and knows that it's working for you - you are already onto [step 2](#2-create-a-default-docker-machine).

The easiest way to install Docker on Mac is to use the Homebrew package manager. If you don't have it setup already you must do it straight away, it's an absolute must.

```shell
ruby -e "$(curl -fsSL \
  https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Once Homebrew is installed on your Mac, Docker installation has become as easy as:

```shell
brew cask install virtualbox
brew install docker
brew install docker-machine
```

## 2. Create a "default" Docker Machine

You must have a docker-machine available, I'll use the name "default" in my example, but if you want to call it something else, go ahead, just replace my instances of `default` with you own name in the following instructions.

I you already have a "default" docker machine running then you can move directly onto the next step. If not this is what you need to do:

```shell
docker-machine create --driver virtualbox default
```
You need to start the "default" Docker Machine.

If you just created it, it will be running. But if you created it earlier, and you have rebooted your machine, you need to start it again.

You can run

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

You need to do this every time you open a new terminal. If you find that slightly annoying, then it's highly recommended that you just add the command to your environment file (`~/.zshrc`, `~/.bashrc` or what ever you are using.)


## 4. Define a "jekyll" alias

We want Jekyll to be available as a native command, without actually installing it, so now when I have Docker working for me, I can use a docker container (**lakruzz/jekyll-plus**[^jekyll-plus]) that I've made available from the public Docker registry. So all we need is an alias, it looks like this:

```shell
alias jekyll='docker run --interactive --tty --rm \
  --volume $(pwd):/website:rw --workdir /website \
  --publish 80:4000 --entrypoint jekyll lakruzz/jekyll-plus'
```

[^jekyll-plus]: The [lakruzz/jekyll-plus](https://hub.docker.com/r/lakruzz/jekyll-plus/){: target="_blank"} Docker image is an image that installs the stack used for GitHub Pages, using the Ruby gem that is maintained by GitHub. In addition is added a few jekyll plugins that are really neat but unsupported by GitHub pages, so if you use them, you will have to become self-hosted.

Like in the previous step, this is not something you want to type, every time you open a new terminal, so to make this alias permanent, simply open your environment resource file (`~/.zshrc`, `~/.bashrc` ...) again and add it there.

I have another useful alias that I use, which you can add too while you have your resource file open:


```shell
alias stage="open http://`docker-machine ip default`"
```

It defines an alias `stage`. When you run it, it will open a web browser, pointing to the "default" Docker machine you have running.

## 5. Create a local config file in you jekyll website

To serve a Jekyll site you could simply run

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

# How much to render? These all default to false - But I want them all.
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
