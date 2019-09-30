<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/ocular-d/md-linkcheck-action">
    <img src="assets/linkcheck-logo.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">GitHub Action - Markdown link check</h3>

  <p align="center">
    This GitHub action checks all Markdown files in your repository for broken links.
    <br />
    <a href="https://github.com/ocular-d/md-linkcheck-action"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/ocular-d/md-linkcheck-action/issues">Report Bug</a>
    ·
    <a href="https://github.com/ocular-d/md-linkcheck-action/issues">Request Feature</a>
  </p>
</p>

<!-- TABLE OF CONTENTS -->
## Table of Contents

- [About the Project](#about)
- [Contributing](#contributing)
- [License](#license)
- [Credits](#credits)

## About

A GitHub action based on [markdown-link-check](https://github.com/tcort/markdown-link-check "Link to markdown-link-check repository") for validating links in Markdown based files.

## Features

- Uses [fd](https://github.com/sharkdp/fd "Link to `fd` on GitHub") and not `find`

## Configuration Examples

### Run On Push

Create a new file in your repository `.github/workflows/linkcheck.yml`.

```yml
on:
  push:
    paths:
    - '*.md'
    - '/docs/*'
name: Testing linkcheck
jobs:
  markdown-link-check:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: md-linkcheck
      uses: ./
```

This will run this action every time you `push` Markdown files `.md` to the root of the repository
or do the top level of your `/docs` repository.

Run As Cron

```yml
on:
  schedule:
    # * is a special character in YAML so you have to quote this string
    - cron:  '*/15 * * * *'
    paths:
    - '*.md'
    - '/docs/*'
name: Testing linkcheck
jobs:
  markdown-link-check:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: md-linkcheck
      uses: ./
```

This will run this action every 15 minutes.

## Contributing

We are a community effort, and everybody is most welcome to participate!

Be it filing bugs, formulating enhancements, creating pull requests, or any other means of contribution, we encourage contributions from everyone.

## License

Distributed under the [GPLv2](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html "Link to license") license.

## Credits

- [Thomas Cort](https://github.com/tcort "Link to Thomas Cort on GitHub")
- [Gaurav Nelson](https://github.com/gaurav-nelson "Link to Gaurav Nelson on GitHub")
- [Plone Community](https://plone.org "Link to website of Plone")
