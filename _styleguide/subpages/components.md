---
title: 18F UI style guide
subpage: Components
permalink: /styleguide/components/
parent_permalink: /styleguide/
subnav_items:
- text: Heading one
  permalink: /styleguide/components/#heading-one
- text: Heading two
  permalink: /styleguide/components/#heading-two
---

### Buttons

{% capture styleguide_buttons %}
#### Style on white
<section class="usa-grid">
  <button class="usa-button">Normal</button>
  <button class="usa-button-hover">Hover</button>
  <button class="usa-button-active">Active</button>
  <button class="usa-button-focus">Focus</button>
  <button class="usa-button-disabled">Disabled</button>
</section>

#### Style on dark
<section class="background-dark usa-grid">
  <button class="usa-button usa-button-secondary">Normal</button>
  <button class="usa-button-hover usa-button-secondary">Hover</button>
  <button class="usa-button-active usa-button-secondary">Active</button>
  <button class="usa-button-focus usa-button-secondary">Focus</button>
  <button class="usa-button-disabled usa-button-secondary">Disabled</button>
</section>

#### Using anchor tags instead of buttons
<a class="usa-button usa-button-secondary" href="{{ dead_end_link }}">Normal</a>
{% endcapture %}


{% include /styleguide/details-code.html
   title='buttons'
   description='Our button styles closely resemble those defined by the U.S. Web Design Standards. We have overriden them in places to more closely align the look and feel with the 18F Brand.'
   scss_ref='https://github.com/18F/18f.gsa.gov/blob/master/_sass/_components/buttons.scss'
   uswds_ref='https://github.com/18F/18f.gsa.gov/blob/master/_sass/_libs/wds/stylesheets/elements/_buttons.scss'
   content=styleguide_buttons
%}

---

### Project cards

The card component is used as a preview for project pages, but could be adapted to meet additional needs if necessary. The design is unique to [18f.gsa.gov](https://18f.gsa.gov), but leans heavily on the stylistic foundation of the U.S. Web Design Standards and 18F Brand guidelines.


{% capture styleguide_card %}{% raw %}
<div class="usa-grid-full">
  <section class="usa-flex usa-flex-wrap">
  STUFF HERE!
  </section>
</div>
{% endraw %}{% endcapture %}


{% capture card_description %}
To use cards, reference the file path slug in the _projects directory. Use another project as a template to fill in all of the necessary fields.

Each project card has a number of properties. The only required properties are:
* `image_src`: the project `image` field, and is the image portion of the card
* `image_alt`: the project `image_accessibility` field. Will be used to set the `alt` attribute on the provided image
* `agency`: the project `agency` field. This will be the uppercase text
* `tagline`: the project `subtitle` field and what appears to be the title of the card
* `description` the project `excerpt` and what appears as the body of the card
* `link`: the project `permalink`. This is where clicking on the card will take you
* `columns`: How many columns the cards should occupy. The only valid options are `2` and `3`. If nothing is specified, the cards will default to `3` columns
{% endcapture %}
{% include /styleguide/details-code.html
   title='cards'
   description=card_description
   content=styleguide_card
%}

---
