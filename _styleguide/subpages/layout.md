---
title: NSF SBIR UI style guide
subpage: Layouts
permalink: /styleguide/layouts/
---

### Landing page layout

The layout on the site used for the landing page.

Located at [`_layouts/primary.html`](https://github.com/18F/18f.gsa.gov/tree/master/_layouts/primary.html), this is the template that is most frequently used in 18f.gsa.gov. It is responsible for creating content pages like [/code-of-conduct/]({{ site.baseurl }}/code-of-conduct/) to guides-style pages such as [/join/]({{ site.baseurl }}/join/).


#### Landing page front matter

The primary template uses [Jekyll front matter](https://jekyllrb.com/docs/frontmatter/) heavily to account for variations within the site. Below are the the potential front matter attributes that you can use. Some are listed as _(optional)_. These can be used to alter the appearance of a page.

Attribute | Type | What it does
--- | --- | ---
`title` | String | Title for the page visible in blue banner at the top of the page
`permalink` | String |Path that the page renders relative to the site's `baseurl`
`layout` | String | Should be set to `primary`
`lead` | String | _(optional)_ Large white text that renders on the top blue banner
`banner_cta` | Boolean | _(optional)_ Set to `false` by default. Generates a light blue call to action banner when set to `true`.
`subnav_items` | Object | _(optional)_ Navigation items object that contains a list of subnavigation items that contain a `permalink` and `text`. Renders a [sticky subnav]({{ site.baseurl }}/styleguide/components/#sticky-subnavigation) on the left side of the page.
`subnav_title` | String| _(optional)_ Set if you want the subnav title or breadcumb text to differ from the page `title`.
`hero` | Boolean | _(optional)_ Enables a hero image in the banner. Defaults to `true`, so set to `false` to hide the image
`image` | String | _(optional)_ Path to hero image. This image will also display on blog post preview cards
`image_alt` | String | _(optional)_ Accessibility text for the image
`image_figcaption` | String | _(optional)_ A caption that will be displayed on top of the image
`breadcrumb` | Boolean | _(optional)_ Set to `false` by default. Specify `true` to enable the breadcrumb. If set to `true`, set `subnav_title` if the breadcrumb text differs from the page `title`. [View breadcrumb component]({{ site.baseurl }}/styleguide/components/#breadcumbs)

---

### Secondary page layout

The most common layout on the site. Used for sub pages.

Located at [`_layouts/project-page.html`](https://github.com/18F/18f.gsa.gov/tree/master/_layouts/project-page.html), this is the template for creating new project pages as well as [project cards]({{ site.baseurl }}/styleguide/components/#project-cards) that show up at [/what-we-deliver/]({{ site.baseurl }}/what-we-deliver/).

#### Secondary page front matter

The primary template uses [Jekyll front matter](https://jekyllrb.com/docs/frontmatter/) heavily to account for variations within the site. Below are the the potential front matter attributes that you can use. Some are listed as _(optional)_. These can be used to alter the appearance of a page.

Attribute | Type | What it does
--- | --- | ---
`title` | String | Title for the page visible in blue banner at the top of the page
`permalink` | String |Path that the page renders relative to the site's `baseurl`
`layout` | String | Should be set to `primary`
`lead` | String | _(optional)_ Large white text that renders on the top blue banner
`banner_cta` | Boolean | _(optional)_ Set to `false` by default. Generates a light blue call to action banner when set to `true`.
`subnav_items` | Object | _(optional)_ Navigation items object that contains a list of subnavigation items that contain a `permalink` and `text`. Renders a [sticky subnav]({{ site.baseurl }}/styleguide/components/#sticky-subnavigation) on the left side of the page.
`subnav_title` | String| _(optional)_ Set if you want the subnav title or breadcumb text to differ from the page `title`.
`hero` | Boolean | _(optional)_ Enables a hero image in the banner. Defaults to `true`, so set to `false` to hide the image
`image` | String | _(optional)_ Path to hero image. This image will also display on blog post preview cards
`image_alt` | String | _(optional)_ Accessibility text for the image
`image_figcaption` | String | _(optional)_ A caption that will be displayed on top of the image
`breadcrumb` | Boolean | _(optional)_ Set to `false` by default. Specify `true` to enable the breadcrumb. If set to `true`, set `subnav_title` if the breadcrumb text differs from the page `title`. [View breadcrumb component]({{ site.baseurl }}/styleguide/components/#breadcumbs)

---

### Grid

The layout and grid structure inherits from the U.S. Web Design Standards and makes some slight adjustments. Layout changes are not overrides of the standards, but a handful of CSS classes have been added to compliment the Standards.

Class name | What it does
--- | ---
[`usa-width-tablet`](https://github.com/18F/18f.gsa.gov/blob/master/_sass/_core/grid.scss) | A class that allows certain content, namely the [project cards]({{ site.baseurl }}/styleguide/project-cards/), and the [blog previews]({{ site.baseurl }}/styleguide/blog-components/#post-previews) to respond at a different breakpoint, [`$tablet-screen`](https://github.com/18F/18f.gsa.gov/blob/master/_sass/_core/variables.scss) (768px).
[`usa-flex`](https://github.com/18F/18f.gsa.gov/blob/master/_sass/_components/layout.scss) | Wrapper class that sets `display: flex`, and can be used to create more flexible layouts.
Classes used with `usa-flex` | `usa-flex-baseline`, `usa-flex-end`, `usa-flex-pull-right`, `usa-flex-always`, `usa-flex-wrap`, `usa-flex-vertically-top`, `usa-flex-pull-right`, and `usa-flex-vertically-bottom`.
[`usa-grid-reversed`](https://github.com/18F/18f.gsa.gov/blob/master/_sass/_core/grid.scss) | This class can be used to alternate the order that content appears in mobile vs desktop screen widths.
`content-wide` | In the Standards, the primary way to improve readability is via the `usa-content` class, which [limits content to 75 characters](https://standards.usa.gov/components/typography/#typesetting). Instead of relying on this mechanism, the site wraps site content with the `content-focus` class, [limiting the entire grid to roughly 100 characters](https://github.com/18F/18f.gsa.gov/blob/master/_sass/_components/layout.scss).
`content-focus` | When the the grid needs to be wider, `content-wide` is used and the content width is controlled by using partial grid layouts.

---

### Sidebar

This attribute is found in the [contact]({{ site.baseurl }}/contact) and [project pages]({{ site.baseurl }}/what-we-deliver/federalist/) on the 18F site. This feature provides at-a-glance information.

{% capture sidebar %}{% raw %}
<div class="usa-grid-full usa-grid-reversed">
  <aside class="usa-grid usa-section usa-grid-reversed-right usa-width-one-third section-info section-info-gray">
    <ul>
      <li class="section-info-list-item">
        <div class="section-info-header">Section header</div>
        <p>Supporting subheader</p>
      </li>
      <li class="section-info-list-item">
        <div class="section-info-header">List of helpful reference links</div>
        <ul>
          <li>link to agency 1: <a href="">agency1.gov</a></li>
          <li>link to more info: <a href="">More info</a></li>
          <li>Twitter: <a href="">@agency</a></li>
          <li>GitHub: <a href="">link to repo</a></li>
        </ul>
      </li>
    </ul>
  </aside>
  <div class="usa-grid usa-section usa-width-two-thirds">
    <h3>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</h3>
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
  </div>
</div>
{% endraw %}{% endcapture %}

{% capture sidebar_description %}
- The sidebar should be placed first in the HTML before the main content on the left.
- In the `<aside>` tag we use the `usa-grid-reversed-right` class. This class reverses the order in which the HTML is displayed so that the content that would normally appear on the left will appear on the right instead. The order is not reversed in mobile.

{% endcapture %}
{% include /styleguide/details-code.html
   title='sidebar'
   description=sidebar_description
   content=sidebar
%}
