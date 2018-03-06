---
layout: front
title: Lakruzz Front
---
# Lars Kruse

This is my personal blog. Here on these pages I write about my various personal interests that maybe not fit that well into the context of Praqma - Where [I'm also blogging quite frequently](https://www.praqma.com/stories/#lakruzz){: target="_blank"} - about software and Continuous Delivery.
{: .kicker}

_Most resent blogs on top_

<categories>

{% for category in site.categories %}
    {% for catname in site.data.catnames %}
      {% if catname.dir == category.first %}
        <div style="padding-bottom:15px;">
          <h3 title="{{catname.description}}">{{ catname.name}}</h3>
          {% for posts in category %}
            {% for post in posts %}
                <div class="list"><a title="{{ post.date | date: "%A %B %-d. %Y" }}" href="{{ post.url }}">{{ post.title }}</a> <span style="font-size:small;font-style:italic;">{{ post.date | date: "%A %B %-d. %Y" }}</span></div>
            {% endfor %}
          {% endfor %}
        </div>
      {% endif %}
    {% endfor %}
{% endfor %}


</categories>
