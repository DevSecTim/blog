---
name: write-blog-post
description: >-
  Use this skill when the user asks to write, draft, or create a new blog post or article.
---

# Write a New Blog Post

This skill guides you through the process of creating a new blog post in this Hugo repository.

## Steps

1.  **Determine the Path**:
    Blog posts are stored as bundles in this repository. Calculate the current year and month, and format the new folder name as `YYYY-MM_slug` (e.g., `2026-08_my-new-post`).
    The full path will be `content/writings/<YYYY-MM_slug>/`.

2.  **Create the Content Directory and File**:
    Create the directory `content/writings/<YYYY-MM_slug>/` (if it does not exist) and create an `index.md` file inside it.

3.  **Add Front Matter**:
    Populate the `index.md` with the standard YAML front matter required by this repository. Include the following fields:
    ```markdown
    ---
    draft: true
    title: "<Post Title>"
    date: <YYYY-MM-DD>
    cover:
      image: "cover.png"
    ---
    ```
    *Note: Set `draft: true` initially unless the user specifies otherwise.*

4.  **Write the Content**:
    Draft the markdown body of the post below the front matter, based on the user's instructions. Use concise headings and keep the style consistent with other posts.
    Aim for approximately **1,550 words** for a standard article, with a practical target range of **1,400–1,700 words**. Treat this as a default based on the repository's preferred article length, not a hard limit: use a shorter or longer article when the subject genuinely requires it.

5.  **Generate and Handle Cover Image (Mandatory)**:
    Every blog post requires a cover image (`cover.png` or `cover.jpg`) referenced in the front matter `cover.image`.
    - Generate a suitable 16:9 cover image representing the post topic using image generation tools (e.g., `generate_image`).
    - Save the generated image directly into the post bundle directory `content/writings/<YYYY-MM_slug>/cover.png` (or `.jpg`).
    - Place any additional figures or screenshots referenced in the body directly inside the same bundle directory.

6.  **Validation**:
    To validate that the post renders correctly, you or the user can run the local development server:
    ```bash
    hugo server -D
    ```
    (The `-D` flag is required to render draft posts). Navigate to `http://localhost:1313` to preview the site.

7.  **Publish (only when explicitly requested)**:
    Publishing is a repository and deployment action, not just a front matter change. Set `draft: false`, run `hugo --minify`, inspect the rendered result, and check `git status` for unrelated changes. Stage only the article bundle and any directly related changes, then create a focused commit such as `blog: publish <slug>`. Push the current branch to its configured remote with `git push`. Report the commit and push result; do not describe the article as published until the push succeeds.
