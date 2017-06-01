---
title: NSF SBIR UI style guide
subpage: Colors
permalink: /styleguide/colors/
---

### Primary colors

<ul class="palette">
  <li>
    <span class="block background-primary"></span>
    <p>
      Primary
    </p>
    <p>
      0071BC
    </p>
  </li>
  <li>
    <span class="block background-primary-darker"></span>
    <p>
      Primary darker
    </p>
    <p>
      205493
    </p>
  </li>
  <li>
    <span class="block background-primary-darkest"></span>
    <p>
      Primary darkest
    </p>
    <p>
      112E51
    </p>
  </li>
  <li>
    <span class="block background-base"></span>
    <p>
      Base
    </p>
    <p>
      212121
    </p>
  </li>
  <li>
    <span class="block background-gray-dark"></span>
    <p>
      Gray dark
    </p>
    <p>
      323A45
    </p>
  </li>
  <li>
    <span class="block background-gray-light"></span>
    <p>
      Gray light
    </p>
    <p>
      AEB0B5
    </p>
  </li>
  <li>
    <span class="block background-white"></span>
    <p>
      White
    </p>
    <p>
      FFFFFF
    </p>
  </li>
</ul>
### Secondary colors
<ul class="palette">
  <li>
    <span class="block background-primary-alt"></span>
    <p>
      Primary alt
    </p>
    <p>
      02BFE7
    </p>
  </li>
  <li>
    <span class="block background-primary-alt-darkest"></span>
    <p>
      Primary alt darkest
    </p>
    <p>
      046B99
    </p>
  </li>
  <li>
    <span class="block background-primary-alt-dark"></span>
    <p>
      Primary alt dark
    </p>
    <p>
      00A6D2
    </p>
  </li>
  <li>
    <span class="block background-primary-alt-light"></span>
    <p>
      Primary alt light
    </p>
    <p>
      9BDAF1
    </p>
  </li>
  <li>
    <span class="block background-primary-alt-lightest"></span>
    <p>
      Primary alt lightest
    </p>
    <p>
      E1F3F8
    </p>
  </li>
  <li>
    <span class="block background-secondary"></span>
    <p>
      Secondary
    </p>
    <p>
      FFF039
    </p>
  </li>
  <li>
    <span class="block background-secondary-darkest"></span>
    <p>
      Secondary darkest
    </p>
    <p>
      F1E235
    </p>
  </li>
  <li>
    <span class="block background-secondary-dark"></span>
    <p>
      Secondary dark
    </p>
    <p>
      FFE61A
    </p>
  </li>
  <li>
    <span class="block background-secondary-light"></span>
    <p>
      Secondary light
    </p>
    <p>
      FFF79C
    </p>
  </li>
  <li>
    <span class="block background-secondary-lightest"></span>
    <p>
      Secondary lightest
    </p>
    <p>
      FFFAC3
    </p>
  </li>
</ul>
### Background colors
<ul class="palette">
  <li>
    <span class="block background-light-neutral"></span>
    <p>
      Light neutral
    </p>
    <p>
      F5FBFC
    </p>
  </li>
  <li>
    <span class="block background-light-blue"></span>
    <p>
      Light blue
    </p>
    <p>
      E0F3F8
    </p>
  </li>
  <li>
    <span class="block background-gray-warm-light"></span>
    <p>
      Gray warm light
    </p>
    <p>
      E4E2E0
    </p>
  </li>
</ul>
### Tertiary colors
<ul class="palette">
  <li>
    <span class="block background-tertiary"></span>
    <p>
      Tertiary
    </p>
    <p>
      E31C3D
    </p>
  </li>
  <li>
    <span class="block background-tertiary-darkest"></span>
    <p>
      Tertiary darkest
    </p>
    <p>
      981B1E
    </p>
  </li>
  <li>
    <span class="block background-tertiary-dark"></span>
    <p>
      Tertiary dark
    </p>
    <p>
      CD2026
    </p>
  </li>
  <li>
    <span class="block background-tertiary-light"></span>
    <p>
      Tertiary light
    </p>
    <p>
      E59393
    </p>
  </li>
  <li>
    <span class="block background-tertiary-lightest"></span>
    <p>
      Tertiary lightest
    </p>
    <p>
      F9DEDE
    </p>
  </li>
</ul>

{% capture colors_description %}
We are primarily using [18F Brand colors](https://pages.18f.gov/brand/color-palette/).

Site-specific colors, `$color-medium-hover` and `$color-bright-hover` were created as web-specific extensions of the 18F Brand.

U.S. Web Design standards colors, `$color-gray` and `$color-gray-lightest`, were pulled for utility use.
{% endcapture %}

{% include /styleguide/details-code.html
   title='colors'
   description=colors_description
   scss_ref='https://github.com/18F/18f.gsa.gov/blob/master/_sass/_core/variables.scss#L25-L35'
   uswds_ref='https://github.com/18F/18f.gsa.gov/blob/master/_sass/_libs/wds/stylesheets/core/_variables.scss#L24-L74'
%}

---

### Backgrounds
{% capture styleguide_background %}{% raw %}
<section class="usa-grid-full">
  <div class="usa-width-one-half">
    <div class="background-dark styleguide-bg-box">
      <div class="p-bold">
        <p>$color-dark
          <br>Hero, Header</p>
      </div>
      <p class="section-heading">Highlight: $color-bright</p>
      <p>Text: $color-inverse</p>
    </div>
    <div class="background-medium styleguide-bg-box">
      <div class="p-bold">
        <p>$color-medium
          <br>Navigation, Fields, Page</p>
      </div>
      <p>Text: $color-inverse</p>
    </div>
  </div>
  <div class="usa-width-one-half">
    <div class="background-gray styleguide-bg-box">
      <div class="p-bold">
        <p>$color-gray-lightest
        <br>Banner & Footer</p>
      </div>
      <p>Text: $color-black</p>
    </div>
    <div class="background-white styleguide-bg-box">
      <div class="p-bold">
        <p>$color-inverse
        <br>Navigation, Fields, Page</p>
      </div>
      <p>Text: $color-black</p>
    </div>
  </div>
</section>
{% endraw %}{% endcapture %}

{% capture backgrounds_description %}
We are using the [18F Brand](https://pages.18f.gov/brand/color-palette/) color palette for our background colors.

Instead of overriding the SCSS classes and variables used by the U.S. Web Design Standards, we have created a parallel set of background color classes and variables.

CSS class | SCSS variable
--- | ---
`background-dark` | `$color-dark`
`background-medium` | `$color-medium`
`background-gray` | `$color-gray`
`background-white` | `$color-inverse`
{% endcapture %}
{% include /styleguide/details-code.html
   title='backgrounds'
   content=styleguide_background
   lang='html'
   description=backgrounds_description
   scss_ref='https://github.com/18F/18f.gsa.gov/blob/master/_sass/_components/layout.scss#L121-L189'
%}
