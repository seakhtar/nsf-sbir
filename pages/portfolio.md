---
title: Portfolio
permalink: /portfolio/
featuredCompanies:
layout: secondary
---
<section class="section-header">
<div class="usa-section usa-content usa-grid" markdown="1">

# Portfolio
<p class="text-medium">Since 1977, we’ve awarded funding for high-risk R&D to more than 11,000 startups and small businesses.</p>


<script type="text/javascript">
function currentAwards(a1) {
window.open('https://www.nsf.gov/awardsearch/advancedSearchResult?PIId=&PIFirstName=&PILastName=&PIOrganization=&PIState=&PIZip=&PICountry=&ProgOrganization=&ProgEleCode=5373%2C+1591%2C+5371%2C+1505&BooleanElement=Any&ProgRefCode=&BooleanRef=All&Program=&ProgOfficer=&Keyword=' + a1 + '&AwardNumberOperator=&AwardAmount=&AwardInstrument=&ActiveAwards=true&OriginalAwardDateOperator=&StartDateOperator=&ExpDateOperator=',   'a1window');
}
function allAwards(a1) {
window.open('https://www.nsf.gov/awardsearch/advancedSearchResult?PIId=&PIFirstName=&PILastName=&PIOrganization=&PIState=&PIZip=&PICountry=&ProgOrganization=&ProgEleCode=5373%2C+1591%2C+5371%2C+1505&BooleanElement=Any&ProgRefCode=&BooleanRef=All&Program=&ProgOfficer=&Keyword=' + a1 + '&AwardNumberOperator=&AwardAmount=&AwardInstrument=&ActiveAwards=true&OriginalAwardDateOperator=&StartDateOperator=&ExpDateOperator=',   'a1window');
}
</script>

<form onsubmit="currentAwards(this.a1.value); return false;">
 <input id="current" type="radio" name="awards-search" value="currentAwards">
 <label for="current">Current NSF SBIR/STTR Awards</label>

 <input id="all" type="radio" name="awards-search" value="currentAwards">
 <label for="all">All NSF SBIR/STTR Awards</label>

    <input type="text" class="awards-search-input" name="a1" size="20" placeholder="" />
    <input type="submit" class="usa-button usa-button-primary" value="Search" />
</form>

</div>
</section>
<section class="usa-section usa-content usa-grid usa-section-tight-top" markdown="1">
<h2 class="subhead text-small">Featured alumni and exits</h2>
{% include featured-companies.html %}
</section>
<section class="usa-section usa-content usa-grid usa-section-tight-top" markdown="1">
<h2 class="subhead text-small">Active and recent awardees</h2>
Our Recent Phase I awardees page highlights companies whose proposals were approved during the most recently closed solicitation period (mm/dd). Our Active Awardees pages feature information about Phase I and Phase II awardees who are still in the process of completing the R&D terms of their proposals and who haven't yet submitted their final reports.

- Phase I recent awardees
- Phase I active awardees
- Phase II active awardees
</section>
<section class="usa-section usa-content usa-grid usa-section-tight-top">
<h2 class="text-large">We fund varied tech sectors.</h2>

 <p class="text-medium">Each year, we fund roughly 400 companies across nearly all technology and market sectors.</p>

{% include tech-subtopics.html %}
</section>

 <section class="usa-section usa-content usa-grid usa-section-tight-top" markdown="1">
 <h2 class="subhead text-small">Current awardees</h2>

**View our current awardees,** who are still completing the research outlined in their proposals and who haven't yet reached the estimated ends of their award terms. [View current Phase I awardees](), [Current Phase II awardees](), or our [most recent (12/16) Phase I awardees]().

<!--
## Awardees pages

Our current awardees pages feature information about Phase I and Phase II awardees who are actively using their funding. Recent awardees pages highlight companies that received funding during the previous solicitation period.

### Current awardees / Phase I

Phase 1 funding (up to $225,000 over 6-12 months) covers R&D, including exploration of product-market fit, prototyping, and planning to scale your technology.

### Current awardees / Phase II

Phase II funding (up to an additional $750,000 over two years) helps you continue the research you started in Phase I.

### Recent awardees
Recent awardees received funding during the last solicitation period, which closed in (December 2016). These awards were announced in (February 2016). -->

</section>
