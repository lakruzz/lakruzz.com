# Giscus

Enable it in the `_config.yml` file.

[minimal mistakes instructions](https://mmistakes.github.io/minimal-mistakes/docs/configuration/#giscus-comments)

- Turn on public discussions in the repo that should host the discussions
- Install the [giscus app](https://github.com/apps/giscus). If your discussions are in a different repo than the one that host your pages, you must enable both.
- Goto the website [giscus.app](https://giscus.app/) to generate the configuration. you will get it in html:

```html
<!--   generated from https://giscus.app/ -->
<script src="https://giscus.app/client.js"
        data-repo="lakruzz/giscussions"
        data-repo-id="R_kgDOPNVyKw"
        data-category="Lakruzz.com"
        data-category-id="DIC_kwDOPNVyK84CtA9_"
        data-mapping="pathname"
        data-strict="0"
        data-reactions-enabled="1"
        data-emit-metadata="0"
        data-input-position="top"
        data-theme="catppuccin_latte"
        data-lang="en"
        data-loading="lazy"
        crossorigin="anonymous"
        async>
</script>
```

- Transform it to yml and put it in the `_config.yml``

```yml
comments:
  provider               : giscus 
  giscus:
    repo                  : "lakruzz/giscussions"
    repo_id               : "R_kgDOPNVyKw"
    category              : "Lakruzz.com"
    category_id           : "DIC_kwDOPNVyK84CtA9_"
    mapping               : "pathname"
    strict                : "0"
    reactions_enabled     : "1"
    emit_metadata         : "0"
    input_position        : "top"
    theme                 : "catppuccin_latte"
    lang                  : "en"
    loading               : "lazy"
```

note that the `<script>` keys uses dashes while the `_config.yml` keys uses underscores.

## The include needed fixing

In relation to [#66](https://github.com/lakruzz/codememo/issues/66) the `giscus.html` include as completely off.

## Test during development

Comments are disabled by default in `development` environment.

To enable when testing/building locally start your server like this:

```shell
JEKYLL_ENV=production bundle exec jekyll serve
```
