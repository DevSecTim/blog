# DevSecTim Blog

This is the source for [DevSecTim.pro](https://devsectim.pro), a Hugo static site using the [PaperMod](https://github.com/adityatelange/hugo-PaperMod) theme.

## Project Structure

- **config.yml** — Main Hugo site configuration
- **content/** — Site content (posts, profiles, etc.)
- **layouts/partials/** — Local theme overrides (do not edit theme submodule directly)
- **static/** — Static files (images, icons, etc.)
- **assets/** — Custom CSS/JS for Hugo asset pipeline
- **themes/PaperMod/** — PaperMod theme (as a submodule)
- **public/** — Generated site output (after build)
- **.github/workflows/** — CI/CD for Azure Static Web Apps deployment

## Key Conventions

- **Theme Overrides:**
  - Do not edit files in `themes/PaperMod/` directly.
  - To override a theme partial, copy it to `layouts/partials/` and edit there.
- **Content Organization:**
  - Posts, profiles, and writings are under `content/`.
  - New posts: create a folder in `content/writings/YYYY-MM_slug/` with `index.md` and any images.
  - Cover images are referenced in frontmatter and stored with the post.
- **Images:**
  - Use standard Markdown syntax for images in content: `![Description](screencap.png)`
  - Medium Zoom is enabled for images (see `layouts/partials/extend_head.html` and `extend_footer.html`).
- **Custom CSS:**
  - Add custom styles in `assets/css/extended/custom.css`.


## Build & Deployment

- **Local Build:**
  ```sh
  hugo --minify
  ```
  Output is generated in `public/`.
- **Deployment:**
  - Automated via GitHub Actions to Azure Static Web Apps.
  - See `.github/workflows/azure-static-web-apps-*.yml` for details.
  - The workflow checks out submodules and runs the Azure deploy action.

## Local Development

To run a local development server with live reload:

```sh
hugo server
```

This will start a local server (default: http://localhost:1313) and watch for changes in your content, layouts, and assets. The site will automatically reload in your browser when you make edits.

## Integration Points

- [PaperMod Theme Docs](https://github.com/adityatelange/hugo-PaperMod/wiki)
- [Azure Static Web Apps Docs](https://docs.microsoft.com/azure/static-web-apps/)

## License

See `themes/PaperMod/LICENSE` for theme license. Site content © Tim Jones.
