---
title: All pages
permalink: /allpages/
layout: secondary-narrow
---
<ol>
{% assign sorted = site.pages | sort: 'permalink' %}
{% for page in sorted %}
<li style="border-bottom:1px solid #02BFE7;Padding-bottom: 1rem;">
Permalink: {{ page.permalink }}<br>
Link to page: <a href="{{ page.url }}">{{ page.title }}</a>
</li>
{% endfor %}
</ol>
