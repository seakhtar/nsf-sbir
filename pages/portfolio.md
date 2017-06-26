---
title: Portfolio
permalink: /portfolio/
featuredCompanies:
layout: secondary
section_image: "/assets/img/bg/bolt.png"
section_image_caption: |
  From lab to market - [Bolt Threads](#) genetically engineered yeast brew silk proteins that can be spun into fibers.
---

{% assign recent_date = site.data.awards_meta['recent_date'] | date: "%m/%Y" | default: 'DATE' %}

<section class="section-header background-light-neutral">
<div class="usa-section usa-content usa-grid" markdown="1">

# Portfolio
Since 2012, America’s Seed Fund powered by NSF has made nearly 2,500 awards to startups and small businesses. Since 2010, our awardees have had 62 exits and have received $3.2 billion in external funding. We encourage you to explore this list of assorted companies we've funded.

<p class="text-medium" markdown="1">



</p>


<form onsubmit="allAwards(this.a1.value); return false;" class="awards-search-form">
 {% comment %}
 <input id="current" type="radio" name="awards-search" value="currentAwards">
 <label for="current">Current NSF SBIR/STTR Awards</label>

 <input id="all" type="radio" name="awards-search" value="currentAwards">
 <label for="all">All NSF SBIR/STTR Awards</label>
 {% endcomment %}

    <input type="text" name="awards-search" id="awards-search" class="awards-search-input" size="20" placeholder="" />
    <label class="text-small" for="awards-search">Search America's Seed Fund awardees</label>
    <input type="submit" class="usa-button usa-button-primary usa-sr-only" value="Search" />
</form>

</div>
</section>

<section class="background-light-neutral" markdown="1">
<div class="usa-section-tight-top usa-section usa-content usa-grid" markdown="1">
<h2 class="subhead text-small">Featured alumni and exits</h2>
{% include featured-companies.html %}
</div>
</section>

<section class="background-light-neutral" markdown="1">
<div class="usa-section-tight-top usa-section usa-content usa-grid" markdown="1">
**View our current awardees,** who are still completing the research outlined in their proposals and who haven't yet reached the estimated ends of their award terms. [View current Phase I awardees]({{ site.baseurl }}/awardees/phase-1/), [Current Phase II awardees]({{ site.baseurl }}/awardees/phase-2/), or our [most recent ({{ recent_date }}) Phase I awardees]({{ site.baseurl }}/awardees/phase-1-recent/).
</div>
</section>
<section class="section-background-image">
  <div class="usa-grid">
    <div class="usa-width-one-third">
      <div class="caption">{{ page.section_image_caption | liquify | markdownify }}</div>
    </div>
  </div>
</section>
<section class="background-light-neutral">
<div class="usa-section usa-content usa-grid">
<h2 class="text-large">We fund varied tech sectors.</h2>
 <p class="text-medium">Each year, we fund roughly 400 companies across nearly all technology and market sectors.</p>

{% include tech-subtopics.html %}
</div>
</section>



{% comment %}
## Awardees pages

Our current awardees pages feature information about Phase I and Phase II awardees who are actively using their funding. Recent awardees pages highlight companies that received funding during the previous solicitation period.

### Current awardees / Phase I

Phase 1 funding (up to $225,000 over 6-12 months) covers R&D, including exploration of product-market fit, prototyping, and planning to scale your technology.

### Current awardees / Phase II

Phase II funding (up to an additional $750,000 over two years) helps you continue the research you started in Phase I.

### Recent awardees
Recent awardees received funding during the last solicitation period, which closed in (December 2016). These awards were announced in (February 2016).
{% endcomment %}
