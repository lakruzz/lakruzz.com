---
layout: default
title: Browse by tags
---

Would you rather <a href="/posts">browse by categories</a>?

<h2>Articles by Tags:</h2>
{% for tag in site.tags %}
  <div>
    <a name="{{ tag.first }}"></a><h4>{{ tag.first }}</h4>
    {% for posts in tag %}
      {% for post in posts %}
        <div class="list"><a title="{{ post.date | date: "%A %B %-d. %Y" }}" href="{{ post.url }}">{{ post.title }}</a></div>
      {% endfor %}
    {% endfor %}
  </div>
{% endfor %}
