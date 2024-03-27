---
maintainer: lakruzz
---
# Continuous Delivery Metric Model

## Development environment

To avoid struggling with Jekyll setup, use the "Ruby" devcontainer. When you (re)build the container be sure to wait for the `postcreate.sh` script to finish.

Build and serve the model (default) site like this

```shell
bundle exec jekyll serve
````

To run a customer specific site include the customer specific `_config.yml` like this:

```shell
CUSTOMER=ttc         # Folder name in /_customer_details 
bundle exec jekyll serve --config _config.yml,_customer_details/$CUSTOMER/_config.yml
```

## Changing the model

The Model is defined by the content in the following folders:

```
/
  _levels
  _areas
  _cards
  _gauges
``` 

### Areas and levels
If you plan to change the model or want to create your own here's what you need to know

👉 The file names in areas are relevant to cards (explained next)but most important for Laying out the matrix the `title`and then `weight` that defines the order in both levels and areas files:

```yaml
---
title: "Architecture & Design"
weight: 40
...
---
```

### Cards

Cards are ordered in a similar way - only now the weight is called level. And the cards are defined to belong to a certain area by the areas filenames

```yaml
---
title:      Access to production-like environment
level:      65
area:       qa
...
---
```

## Adding customer specifc findings

For a customer designed model use create a new dedicated folder under _customer_details

The folder should contain the following

```
_customer_details
  customer
    _config.yml
    score.md
    report-parts
      content.md
      findings.md
      front.md
      score.md
      summary.md
      toc.md
      tools.md
    snippets
      arch
        # md files with file names matching the card filenames
      build
      ...
      # create a folder for each file-name in _areas
```

In the snippets files you can add findes in header level 3 and sugested mitigation in header level 4

The file names must match _exactly_ the file name of the cards

### Gauges
The gauges are currently semi-hardcoded 🤷‍♂️ - sorry.

## Admin

The compiled site insludes and admin page `/admin/` than has links to the printable cards, the report and other stuff

## Know issues

### Printing to PDF

Described by Jan Krag:

> Printing to PDF is still a bit of a complicated story. Basically, you can view the web version and use the browser print to print to pdf. It will apply a special print media css.
> Behaviour and effectiveness varies a bit by platform. It works reasonably on Mac as long as you use “print with system print dialog” feature instead of Chrome’s rendering. It might not work on Linux - i don’t know.

> The second problem then is that it does not (can’t reliably) add page numbers and clean footers, so we usually do that after the fact in the pdf. I have previously used “pdfpaginate” on mac to make this easier.

## Generating a json file for Jira import
Note: Groovy is required to run this utility.

To generate a json file ready for import to the customers Jira instance use the Groovy script `jirajson.groovy`

* cd into you code-maturity git respository
* Update the properties inside the script to match the relevant Jira project: `ProjectName, ProjectKey`
* run the following command

  `groovy jira-json [customername] > [customername]-tasks.json`


The script is stil a POC and there are some fixmes and todo's in the code.
Note: The script us quite sensitive to missing findings. There has to be
at least one `####` section for each `###` section.

The will typically also fail if you have left
personal markdown note-files in the snippets folders.

When debugging, just run without the redirect to a file, then it will print out the generated output, and you can see the text of the last
processed section. This is probably where there is a missing `###`.

We investigated three ideas to acheive the goal of being able to export to json:

* Hook into the Jekyll generator or convert phase, with a plugin.
* transform the html, to xhtml and then to xml
* use a stand-alone script (just like the above we did)

The real problems is that when we can get "hold on" the content in Liquid,
which would be the obvious place and choice here to do the export as we already traverses it there,
the markdown is already converted, so we don't have plain markdown available. Further we don't either
have a representive model of the observations and recommendations.
Thus the above three approaches was considered. The Jekyll plugin seems to be quite an extensive solution
but would benefit from our existing model and allowing us to re-use the logic there.
The transformation to xhtml and using XSLT schema was also obvious, but ended in a flat structure that was
hard to re-use.
E.g. transformation command: `curl --silent http://localhost:4444/jira-json/ | sed "/^ *$/d" | xmllint --html --format - > exported-findings.html`

So the chosen solution was to use a stand-alone script, that is really simple. Drawback it that is relies on our
existing model and snippets/file structure (but easy to change though).

More details can be found on [issue #218](https://github.com/Praqma/code-maturity/issues/218).

## Mappings to Jira issues

Each recommendation (those must-have, should have, and could have) becomes one issue without linking to anything.
The observation related to the recommendation is added to the issue as section in the description.
This mapping was chosen to make each issue independable from other, and plan projects easier. They can always be linked.

Labels are applied to the issues explaing the arey and card it relates to. Project key is prefixed to label, as labels in Jira a global, so we
think it is good practice to seperate them like this.

## Troubleshooting

* You can't import if the Jira project doesn't have a default issue type in the configuration on the Jira server
* We only set the bare minimum on the issues when exporting, so if there are constraints on transition, issue types, field required etc. in Jira you have to extend the json.
