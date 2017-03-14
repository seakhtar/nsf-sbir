---
title: Awards
permalink: /awards/

layout: docs
sidenav: docs
subnav:
  - text: Section one
    href: '#section-one'
  - text: Section two
    href: '#section-two'
---




<h2>Awards</h2>
{% for release in site.data.awards.response.award %}
<h3><!--{{release.title}}-->Collaborative Research: Identifying Controls on Weathering of Seafloor Massive Sulfides</h3>
<p>Date: <!--{{release.date}}-->03/13/2017</p>
<h4><!--{{release.awardeeName}}-->Woods Hole Oceanographic Institution</h4>
<p><!--{{release.awardeeCity}}--> WOODS HOLE, <!--{{release.awardeeStateCode}}-->MA</p>
<p><!--{{release.piFirstName}}-->Margaret <!--{{release.piFirstName}}-->Tivey</p>
<p>Funds Received: $362,632 <!--{{release.fundsObligatedAmt}}--></p>
<hr>
{% endfor %}
