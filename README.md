---
maintainer: lakruzz
---
# code-maturity

To avoid strugling with Jekyll setup, use our praqma/gh-pages Docker image doing:

* cd into your code-maturity git repository
* run the following command, where <customername> is obviously the customers name without spaces etc. It often matches the long lived branch names in the repository for that customer.


**Serve to the network - non-local hosts**:

`docker run -i -t --rm --name code-maturity-gh-pages -v $(pwd):/home/jenkins -p 4444:4000 praqma/gh-pages ./pserve <customername>`

**Serve locally**:

`docker run -i -t --rm --name code-maturity-gh-pages -v $(pwd):/home/jenkins -p 4444:4000 praqma/gh-pages ./serve <customername>`

*Note the slightly difference in using `pserve` script instead of `serve` script, as `pserve` run jekyll command with --host=0.0.0.0 which makes jekyll serve the website to non-localhosts.*

Our gh-pages Docker image:

* https://github.com/Praqma/docker-gh-pages
* https://hub.docker.com/r/praqma/gh-pages/

## PLEASE SAVE FINAL REPORTS

When sending a customer the report in pdf-format, it should saves in several ways for references.

* save the pdf-file with the customer folder in our `praqma.customers` Google Drive
* tag the final customer version with `<CUSTOMER>.DELIVERED` so we can always find the final version
* add the pdf report version to the `gh-pages` as well under the `res` folders

## Report for print and admin link

You can add an `/admin` to your url, e.g. `http://localhost:4444/admin/` to printable formats and other views.

## Compatibility issues and backwards Compatibility

The `gh-pages` are always the latest version of the "engine" part, and where new reports branch of (yes, long-lived product variant branches used pr. customer) so this means that newest features described in this README are not always available on old customer branches.

It also means you should not merge latest master branch (`gh-pages`) to customer branches, as it might break their models.

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
