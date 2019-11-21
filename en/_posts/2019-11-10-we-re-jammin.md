---
layout: post
title:  Forget Wordpress - The Future is Here
author: lakruzz
image: /images/blog/jeg-er-her-endnu/heart-before-and-after.jpg
tags:
  - JAM stack
  - LAMP stack
  - Static web site
---

Wordpress, Drupal, Joomla are all CMS that are running on _a LAMP stack_ The technology saw the light 25 years ago, created to support an internet with at completely different set of charatistices than what we see now. Todays modern stack is called _a JAM stack_ and it's different in every possibly thinkable way. Stay tuned to learn the difference between _LAMP_ and _JAM_ and then consider if you want to take a step into the future.
{:.kicker}

> _"We're jammin'. I want to jam it with you, we're jammin' and I hope you like jammin' too."_

_Quote: Bob Marley_

This blog is for you, who owns a website - or are about to get one - and who thinks that perhaps, the maintenance and development of it is a bit expensive, or error prune, or overly complex. The thing is, that most likely your website _stack[^stack]_ is a thing of the past. You need to stay tuned here and lean the differences between a classical LAMP stack and and contemporary JAM stack. This learning might prove valuable to you. Enabling you to be strategic about your choices in the future.

[^stack]: _Stack_ is IT jargon for the combined set of tools and technologies that are used to run your product - in this case your website.

_\- "Wait - hold on! JAM, LAMP you lost me there, I don't know what any of them means?"_

Alright, so let's look at it, as if you were comparing an electrical car to a conventional car with a classical combustion engine. They solve the same problem, to those who don't care much you could even argue that even the solution to the problem is the same. Only when you look under the hood is it obvious that they are indeed _very_ different. Some of you probably wonder if maybe combustion engines running on fossil fuel are a thing of the past and maybe electrical cars belong to the future?

For the same reason, you need to know the difference between a LAMP stack and a static JAM stack.

# A LAMP stack explained

LAMP is a contraction of the first letters of the names in one of the most popular tool stacks in IT history:

- **Linux** _Operating system_
- **Apache** _web server_
- **MySql** _Relational database_
- **PHP** _Domain specific programming language, designed specifically for server side scripting of web sites_

We owe this stack a lot. There's almost nothing that you can not do on this stack. It's like a Swiss army knife. I has been the pet stack since what seems to be _forever (roughly 1995)[^forever]_.

[^forever]: MySql, Apache and PHP are all from 1995. Linux itself is from 1991.

Back in 1995 the internet was slow, servers were expensive, CPU power was limited and so was RAM, storage was expensive, browsers and frontend technology were immature, client-side scripting such as JavaScript was non-existent. The cloud as we know it did not exist. These were the challenges of the time that gave birth to the LAMP stack. And boy, did it kick ass! The LAMP stack was to the development of the internet, what the Ford T was to human transportation.

All the tools in the LAMP stack are Open Source which means that it's completely free of charge - at least when it comes to license cost. However, like a combustion engine, it turns out that with so many moving parts in the equation things get's complicated quite fast. Syncing up, inter-compatibility, finding a server to host it on, upsizing when it runs out of resources etc. A LAMP stack has a relational database in the equation, which in many cases represents a system backdoor, so it's always under attack from hackers. To stay afloat you need almost weekly updates. At the end of the day it may be free, but the cost of ownership is not necessarily cheep.

## How a LAMP stack works

From the end-user's point of view, we're presented with a "website". We know websites as something that must be opened in a _web browser_ which is a client tool, that understands the protocols of the internet, of which `HTML` (_Hyper Text Markup Language_) is the king of 'em all. `HTML` is brought to the client using `HTTP` (_Hyper Text Transfer Protocol_). In modern world that protocol would be made secure (encrypted) and therefore it would most likely be `HTTPS` (an 'S' for 'Secure' is added to the end). If your website isn't using `HTTPS` yet you should get it fixed `ASAP` (_As Soon As Possible_ ...not necessarily internet related).

This `HTML` back and forth using `HTTP` and `HTTPS` is what **Apache** - the web server - is taking care of.

But on a LAMP stack it's most likely that the `HTML` page that your browser is displaying isn't really there - yet. It's more likely that your entry point on the server is actually a computer program  - written in **PHP**, that queries the database **MySql** for the content of the website and then merges it into the actual design template of the website, eventually generating the `HTML` that the the client browser requires.

This approach was really clever - separating _what_ from _how_ has always been an important principle in programming - divide and concur; Let PHP take care of the design and let MySql take care of the content. But hey - it's also quite complicated, so obviously we developed systems - content management systems (CMS) - that would make design more like playing with lego blocks and content nothing but text snippets back and forth - essentially hiding the PHP and MySql from the content managers.

As the internet became more and more complex with demands for SEO (_Search Engine Optimization_), AJAX, Client side scripting. CSS (Cascading Style Sheets) - and obviously caches, because these LAMP stacks are really slow, measured by modern standards - and instead of generating all this `HTML` over and over again, CMS systems optimize it by building up caches.

These CMS just grew and grew - they kept on offering internet technology as _clicky-clicky-pointy-pointy_ grapical user interfaces, essentially hiding the technology underneath, unless you are one of the chosen few web developers that were supposed to understand the bits and parts of how the internet was essentially constructed.


You may know these CMS as **Wordpress**, **Drupal**, **Joomla**, **SiteCore**, **Concrete5**, **Umbraco**, **Shopify** etc. The vast majority of these are based on a LAMP stack or a conceptually similar stack based on the holy trinity of:

- a webserver
- a server-side scripting language
- a database

# JAM stack explained

JAM is also a contraction of the first letters of the tools - _and generic technologies_ in the stack:

- **JavaScript** _also a domain specific language scripting, but this time designed specifically for client-side scripting of websites - only lated it expanded to include server-side scripting too_
- **APIs** _Application Programmer Interfaces_
- **MarkDown** _The World's simplest MarkUp language - A drilled down version - hence the name_

It's important to understand that LAMP vs JAM isn't just a battle of tool stacks. The underlying technologies are as different as combustion engines and electrical engines. They solve the same problem, through completely different means.

JAM stacks are also sometimes referred to as _static web sites_. Hereby indicating that the `HTML` on the web server is not generated on-thy-fly by a server-side programming language and a database in combination as it happens on a LAMP stack. Instead _all_ the `HTML` pages are statically generated through a compile process and then pushed to the web server simply as static done-and-ready-to-use files.

The content (_what_) is still separated from the design (_how_) but in this case it's stored in **MarkDown** files. MarkDown is a _MarkUp_ notation - like `HTML` itself, but where `HTML` is specifically designed to be read and parsed by machines, MarkDown is so simple, that anyone can learn it in 15 minutes, and it's easy readable to humans. I'm writing this blog post now in MarkDown.

There is no Database on the server, and there is no server-side scripting language available. All the dynamics of a website are handled by JavaScript on the client - the web browser - or through services on the internet integrated through APIs - most commonly `REST API` or `GraphQL API` communicating in `JSON` (_JavaScript Object Notation_).

JAM stacks are not a result of the technology that was available in 1995. JAM stacks are calved from cloud technologies. JAM stacks are made with the purpose of being run as  _services_, not _servers_. They are _serverless_.

It's _Infrastructure as a Code_. Like leasing a car instead of owning it!

## How a JAM stack works

In many ways the development processes are comparable. On both stacks we're creating content and design through different processes, one is meant for content managers the other is meant for web designers. In both stack we're trying to reuse as much as possible through means of plugin and extension technologies.

But where a LAMP stack is designed to build the `HTML` on-the-fly when someone needs it, the JAM stack generates _all possible_ `HTML` pages up front every time any of the content managers and or designers are done with a new snippet.

When a web browser on the client requests some `HTML` it's simply delivered instantly. The server is diminished to a simple _web service_; It can't really do anything in terms of computation, semantical logic, database queries or the like. If something like that is needed, it's expected to be available somewhere else on the internet, accessible to us through an API which communicates in `JSON` which is the de facto protocol JavaScript uses to stream data between systems. JavaScript runs on the client-side that means in the web browser.

Say that we actually need to provide something like what we traditionally known as _server capacity_. Say like an actual database that allows us to store data about our users, products, objects, entities or if we want to pull data from other systems like book keeping, user authentication with Facebook, Google or what have you. If that is the case, then we will use either existing services, or create our own _services_[^create-you-own-service] - not _servers_.

[^create-your-own-service]: An example could be a service on AWS (_Lambda_), Azure (_Azure functions_) or Google Cloud (_FireBase_), utilizing _node.js_ to expose and control a `REST` API communicating `JSON` directly to a _NoSql Document Database_ such as _MongoDB_ or _Firestore_. Easy as pie - and still _serverless!_

At the end of the day, we end up with the same Swiss army knife; There is nothing that this stack can not do for us, but we have magically removed the servers from the equation. We do no longer own any infrastructure. The infrastructure has been replaced with a snippet of computer program utilizing _services_.

The infrastructure is programmable and serverless.

There are quite many [different JAM stacks](https://jamstack.org/examples/){: target="_blank"}

# OK, so why do I care if it's one or the other?

First of all, there's the total cost of ownership. Staying with the car metaphor, we don't own the car, we're leasing it.

_"Hmmm!"_ You might argue that you can also lease a conventional car - or a Wordpress instance - _"so why do I care?"_.

 And that's true. But if you get an electrical car you'll learn that there isn't really any service interval on the engine; no plugs, no oil filter, not even any engine oil, there's no timing belt, no V-belt, no heat exchanger filled with fluid coolant. So even if you managed to get a service deal on your combustion engine, taking care of it all at a fixed price per interval. The fact remains that you wouldn't have these expenses at all on an electrical car.

 It's the same with a JAM stack compared to a LAMP stack. The number of moving parts are simply brought to an absolute minimum. Simply through use of contemporary technology as opposed to 25 year old technology.

## DevOps, Continuous Delivery ...and All That Jazz
Looking at what's novel and desirable in general in the current world of Software Development the JAM stack offers easy access to it all:

- **DevOps** Development and (System) Operations contracted into one word, meaning that there are no silos in team efforts, The infrastructure is also the team's responsibility Ops are not hidden away in the basements, they are first class team members. Making infrastructure programmable and immutable.
- **Continuous Delivery** as in lean; Build quality in, deliver feature directly to production.
- **Build Pipelines** Implement the product's definition of done as a pieces of code, and execute it automatically on even the smallest change committed.
- **GitOps** At the foundation of it all is the distributed version control system Git. When changes are added to git and as they are promoted using branches, pull requests and tags it automatically triggers various flows in the pipelines. No one needs to do anything, it's all automated.
- **Production-like environments** The developers, the testers, the stage users, the end-users should all use similar environments, therefore we need a way to spin up almost infinite numbers of production-like environments. What good is one or two LAMP stacks - when I, and all the automated processes need at least 10 to verify that we're truly done? Who's counting anyway? It's all just _services_ in the cloud.
- **Anything as code** "Anything" in this context being matters like _configuration_, _tests_, _infrastructure_, _pipelines_  etc. Having it "as code" means that it's persisted in mergeable files (as opposed to databases or binary files) so that it can be version controlled and immutably executed to yield the same result given the same conditions. Having "anything" as code means that "anything" can by automated.

All of these highly desirable and contemporary principles are available almost out of the box using a JAM stack.

### Let's walk through this webpage as an example

The entire code base for the website lives inside a git repository, given sufficient access rights all I need to do is to run `git clone` on my PC to get all the code and alter it. If I'm not a developer but a content manager, I'll just browse to the online MarkDown Content management system at `prose.io`.

When I've made a change I'll compile and see the result only seconds later in a `docker container` - If you are unfamiliar with Docker then think of it as a simple lightweight variant of a virtual machine. Given that I have Docker installed on my machine, in can use it to run _any_ program on my local computer, without actually installing that program. But simply by running it in a `container` So I don't even need to have the JAM stack installed, in order to run the JAM stack (_wow!_) I can simulate the full fledged behavior of my entire application of web site, without even being connected to the internet (_Woooooow!_). All this is true regardless if I'm working on Mac,Linux or Windows.

When I like what I see, I `commit` to git and `push` to GitHub.

I have `Circel CI` waiting and watching - if you don't know Circle CI, think of it as a host of robots sitting on the internet waiting for instructions from me. Circle CI is immediately notified that something has change in the code - and it starts the _build pipeline_ that corresponds to the context (could be _development_) in git. Circle CI executes the entire Definition of Done, and if - and only if - it is successful it will promote the code in Git (could be from _development_ to _master_ indicating that it's ready for release on stage).

The automated promotion triggeers a new event, that triggers Circle CI again. This time only to run the next level of Definition of Done, that corresponds to releasing to stage. If all is successful, the web site is automatically deployed to the stage environment. Now it's live and my stage users can see it.

The stage users is most likely the customer, sneak peaking. If they are satisfied then it is turned into a `release` in git, simply marking it with a [`semantic versioning`](semver.org){: target="_blank"} tag. As you have probably guessed by now, this triggers Circle CI again, this time to release it automatically into production. You see what happened? If the code that was submitted to the `development` context, prove to meet the various definitions of done on it's path to produktion, it's automtically delivered - to production.

# Can I try it?

Yes!

I know a small place, the home of the yipees, where they run a campaign: For the price of DKK 4.995 (≈ EUR 670) they offer to set up the whole shebang once and for all, based on Jekyll ( the JAM stack which GitHub created to run their _GitHub Pages_) and Liquid (The template language developed by Shopify) using a design template of your own choice (there are 100's to choose from on [`jekyllthemes.io`](https://jekyllthemes.io){: target="_blank"} and [`jekyllthemes.org`](http://jekyllthemes.org/){: target="_blank"}).

After that you are ready to add your own content.

### Examples of websites we built using JAM stacks:

- [prolike.io](https://www.prolike.io/){: target="_blank"}
- [copenhagencoaching.dk](https://www.copenhagencoaching.dk){target0"_blank}
- [code-conf.com](https://www.code-conf.com/){: target="_blank"}
- [praqma.com](https://www.praqma.com/){: target="_blank"}
- [dataintensity.com](https://www.dataintensity.com/){: target="_blank"}
- [republicdomain.dk](https://www.republicdomain.dk/){: target="_blank"}
- [wteam.dk](https://www.wteam.dk/){: target="_blank"}
