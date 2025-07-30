# Copilot Instructions for DevSecTim/blog

## Project Overview
- This is a Hugo static site using the PaperMod theme (as a submodule in `themes/PaperMod`).
- Content is organized under `content/`, with posts, profiles, and writings in subfolders.
- Customizations and theme overrides are placed in `layouts/partials/` (e.g., to override theme partials like `head.html` or `footer.html`).
- Static assets (images, icons, etc.) are in `static/`.
- The site is deployed via Azure Static Web Apps (see `.github/workflows/azure-static-web-apps-*.yml`).

## Key Patterns & Conventions
- **Do not edit the theme submodule directly.** Instead, override theme files by copying them to `layouts/partials/` and editing there.
- Use [Medium Zoom](https://github.com/francoischalifour/medium-zoom) for image zoom: the script is included in the local `head.html` override, and initialization is in `footer.html`.
- Content images should be referenced with standard Markdown syntax. Example:
  ```markdown
  ![Description](screencap.png)
  ```
- Cover images for posts are referenced in frontmatter and stored alongside the post content.
- Custom CSS can be added in `assets/css/extended/custom.css` and will be bundled by Hugo's asset pipeline.

## Build & Deployment
- Build locally with:
  ```sh
  hugo --minify
  ```
- The public site is generated in `public/`.
- Deployment is handled by GitHub Actions (see `.github/workflows/azure-static-web-apps-*.yml`).
- The workflow checks out submodules and runs the Azure Static Web Apps deploy action.

## Integration Points
- PaperMod theme: [docs](https://github.com/adityatelange/hugo-PaperMod/wiki)
- Azure Static Web Apps: [docs](https://docs.microsoft.com/azure/static-web-apps/)

## Examples
- To override a theme partial:
  1. Copy `themes/PaperMod/layouts/partials/head.html` to `layouts/partials/head.html`.
  2. Edit the new file as needed (e.g., to add scripts or meta tags).
- To add a new post:
  1. Create a Markdown file in `content/writings/YYYY-MM_slug/index.md`.
  2. Add frontmatter and content. Place images in the same folder for easy reference.

## Notable Files & Directories
- `config.yml` — Hugo site configuration
- `layouts/partials/` — Local theme overrides
- `content/` — Site content (posts, profiles, etc.)
- `static/` — Static files (served as-is)
- `assets/` — Custom CSS/JS for asset pipeline
- `.github/workflows/` — CI/CD for Azure deployment

---
If you are unsure about a workflow or pattern, check for a local override in `layouts/partials/` before editing theme files, and prefer Hugo/PaperMod conventions for structure and naming.
