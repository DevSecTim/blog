# Repository Guidelines

## Project Structure & Module Organization
This repository is a Hugo static site for `devsectim.pro` using the `PaperMod` theme as a submodule. Site config lives in `config.yml`. Content is under `content/`, with articles stored as bundles in `content/writings/YYYY-MM_slug/` containing `index.md` plus local images such as `cover.png`. Custom styling belongs in `assets/css/extended/custom.css`. Static files go in `static/`. Theme customizations should be added under `layouts/partials/`; do not edit `themes/PaperMod/` directly.

## Build, Test, and Development Commands
Use `hugo server` for local development with live reload at `http://localhost:1313`. Run `hugo --minify` to build the production site into `public/`. CI deploys with `hugo --gc --minify --destination public` through GitHub Actions in `.github/workflows/azure-static-web-apps-agreeable-tree-0f3c68903.yml`. There is no `Makefile` or package-based task runner here, so keep local workflows simple and Hugo-native.

## Coding Style & Naming Conventions
Write Markdown with concise front matter and clear headings. Follow the existing content bundle pattern: `YYYY-MM_slug` for article folders, `index.md` for the page body, and simple lowercase asset names like `cover.jpg` or `screencap.png`. Use YAML front matter keys already present in the repo, such as `title`, `date`, `draft`, and `cover.image`. For layout overrides and CSS, match Hugo and PaperMod conventions and keep indentation consistent with surrounding files.

## Testing Guidelines
There is no automated test suite in this repository. Validate changes by running `hugo server` while editing and `hugo --minify` before opening a pull request. Check that draft status, cover images, internal links, and search output still render correctly. If you change layouts or assets, verify the affected pages in the local site rather than relying on CI alone.

## Commit & Pull Request Guidelines
Recent history favors short, imperative commit messages such as `chore: undraft`, `blog: openclaw`, and `Draft article: The Paradigm Shift`. Keep commits focused and descriptive. Pull requests should summarize the content or layout change, note any new article path, and include screenshots when visual output changes. Link the related issue when one exists and mention any deployment or theme-override implications.
