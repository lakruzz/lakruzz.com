---
title:      Continuous Delivery Assessment
caption:    Report based on workshop and interviews
date:     2016-11-24
author:
  name: Tim Harris, Claus Schneider
  co-authors: Thierry Lacour, Lars Kruse
  logo: /images/praqma-logo.png
weight:     1
published:  true
client_logo_margin: 0mm 0mm
client_logo_height: 30px
---

{% capture client_logo_style %}margin: {{ page.client_logo_margin }}; height: {{ page.client_logo_height }};{% endcapture %}
<!--<h1>{{ page.title }}</h1>-->
<!--<div class="caption">{{ page.caption }}</div>-->

{% include matrix.html %}

<div class="columns">
  <div class="column column-customer">
    <div class="logo"><img src="{{ site.client.logo }}" alt="{{ site.client.name }}" style="{{ client_logo_style }}"></div>
    <div class="name">{{ site.client.name }}</div>
    <div class="url">{{  site.client.url  }}</div>
  </div>
  <div class="column column-author">
    <div class="logo"><img src="{{ site.client.logo }}" style="{{ client_logo_style }}; visibility: hidden;"></div>
    <img src="{{ page.author.logo }}" class="author-logo">
    <div class="date">{{ page.date | date: '%B %d, %Y' }}</div>
    <div class="author">Author: <strong>{{ page.author.name }}</strong></div>
    <div class="author">Co-authors: <strong>{{ page.author.co-authors }}</strong></div>
  </div>
</div>

<script>
  $( document ).ready(function() {
    $( ".article-front .carousel" ).replaceWith(function() {
      return $(this).find( ".card_" ).first();
    });
  });
</script>
