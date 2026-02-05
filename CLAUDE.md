# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is Esteban Degetau's personal academic website built with **Quarto**, a scientific and technical publishing system. The site is deployed to GitHub Pages at www.estebandegetau.com.

## Build Commands

```bash
# Render the entire site locally
quarto render

# Preview with live reload
quarto preview

# Render a single file
quarto render index.qmd
```

## Deployment

Push to `main` branch triggers automatic deployment via GitHub Actions (`.github/workflows/publish.yml`). The workflow:
1. Sets up Quarto
2. Renders all content
3. Publishes to `gh-pages` branch

## Project Structure

- **`_quarto.yml`** - Main project configuration (navigation, site metadata, render targets)
- **`_brand.yml`** - Brand/theme configuration (colors, typography) - currently commented out in _quarto.yml
- **`blog/_metadata.yml`** - Blog-wide settings (Giscus comments, bibliography, execution options)

### Content Files

| File | Purpose |
|------|---------|
| `index.qmd` | Home/About page with blog listing |
| `blog.qmd` | Blog index page |
| `cv.qmd` | CV (HTML and Typst/PDF formats) |
| `research.qmd` | Research publications |
| `teaching.qmd` | Teaching experience |
| `blog/*/index.qmd` | Individual blog posts |

### Static Assets

- `portfolio/` - Research paper PDFs
- `images/` - Static images

## Key Configuration

**Computational Output**: Uses `freeze: auto` at project level and `freeze: true` for blog posts to cache computational results.

**Blog Posts**: Located in `blog/<post-name>/index.qmd`. Each post can have its own `_targets.yaml` for R targets pipelines. Code execution defaults: `echo: false`, `warning: false`, `message: false`.

**Comments**: Blog posts use Giscus (GitHub Discussions-based comments) configured in `blog/_metadata.yml`.

**Custom Domain**: Configured via `CNAME` file pointing to www.estebandegetau.com.