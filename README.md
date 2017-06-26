# National Science Foundation SBIR Phase II (Build) Project
This is the home of the NSF SBIR Phase II (Build) Project.

## Getting started
Most of our documentation can be found in the **[wiki](https://github.com/18F/nsf-sbir/wiki)**.

You can also find us in the #nsf-sbir Slack channel.


### Creating new pages

You can create a new page by running the following command:

```bash
./new-page [name-of-page]
```

It will then create a file in the pages directory with the essential Jekyll front matter needed to get the page up and running


## Accessibility

To check locally, we use [`pa11y-ci`](https://github.com/pa11y/ci).

To get it working, do the following:

1. Install `pa11y-ci` on the command line if you haven't already: `npm install pa11y-ci -g`
2. In one terminal tab, get the site running:
  a. `./serve` will create a local version of the site at http://localhost:4000/site/
  a. `bundle exec jekyll serve` will create a local version of the site at http://localhost:4000/
3. Then, in a new tab lint the site:
  a. If you used the `./serve` command:
    ```sh
    pa11y-ci --sitemap http://localhost:4000/site/sitemap.xml --sitemap-exclude ".pdf"
    ```
  b. If you used the `bundle exec jekyll serve` command:
    ```sh
    pa11y-ci --sitemap http://localhost:4000/sitemap.xml --sitemap-exclude ".pdf"
    ```
4. Alternatively, to check a single url:
  a. If you used the `./serve` command:
    ```sh
    pa11y-ci http://localhost:4000/site/[name of link]
    ```
  b. If you used the `bundle exec jekyll serve` command:
    ```sh
    pa11y-ci http://localhost:4000/[name of link]
    ```
