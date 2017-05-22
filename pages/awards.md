---
title: Awards
permalink: /awards/

layout: docs
sidenav: awards
subnav:
  - text: Sublink one
    href: '#section-one'
  - text: Sublink two
    href: '#section-two'
api_awards:
  - awards_1
  - awards_2
  - awards_3
  - awards_4
  - awards_5
---

{% assign awards_summary = site.data.awards_summary %}

<h2>Awards Summary</h2>

---

<h3>Applications since {{ site.data.awards_meta.date_start }}</h3>
<p><strong>{{ awards_summary.applications_total | intcomma }}</strong> applications</p>
<p><strong>{{ awards_summary.states_total }}</strong> states funded (including D.C., Puerto Rico, and the Virgin Islands</p>
<p><strong>{{ awards_summary.funding_total | round | intcomma_dollar }}</strong> in total funding</p>
<p><strong>{{ awards_summary.funding_per_company | round | intcomma_dollar }}</strong> per company</p>

---

<h3>Applications (active) in date range: {{ site.data.awards_meta.active_date_range }}</h3>
<p><strong>{{ awards_summary.applications_active_total | intcomma }}</strong> total active applications</p>
<p><strong>{{ awards_summary.funding_applications_active_total | round | intcomma_dollar }}</strong> in total funding for active applications</p>
<p><strong>{{ awards_summary.funding_per_active_company | round | intcomma_dollar }}</strong> per active application</p>

---

<h2>Awards (first 10, *can show more if we want)</h2>
{% for release in site.data.awards limit:10 %}

<h3>{{ release.title }}</h3>
<p>Date: {{ release.date }}</p>
<h4>{{ release.awardeeName }}</h4>
<p>{{ release.awardeeCity | titlecase }}, {{ release.awardeeStateCode }}</p>
<p>{{ release.piFirstName }} {{ release.piLastName }}</p>
<p>Funds Received: {{ release.fundsObligatedAmt | round | intcomma_dollar }}</p>
<hr>
{% endfor %}
