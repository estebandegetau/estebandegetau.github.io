# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with blog posts in this repository.

## Blog Vision

This blog builds Esteban's professional presence by making economics accessible to a broad audience: academics, students, policymakers, and the general public.

## Writing Style

**Tone**: Conversational and engaging, not academic prose. Write like you're explaining something interesting to a smart friend.

**Voice**: First-person narrative ("I found...", "When I analyzed..."). Include personal anecdotes that connect research to lived experience. Express opinions clearly on policy debates—don't hide behind false neutrality.

**Language**: Bilingual blog. Write each post in either Spanish or English based on the target audience. Mexican policy topics typically in Spanish; methodological or international topics in English.

**Length**: Match content needs. Quick policy takes can be 500 words; deep dives into research can be 2000+.

## Content Guidelines

**Topics**:
- Mexican labor markets (employment, wages, informality, social security)
- Public policy analysis and program evaluation
- Data science and econometrics tutorials
- Personal reflections on academia and career

**Data & Visuals**: Adapt to the post. Some posts need heavy visualization; others are prose-driven. Key rule: every figure should earn its place.

**Code**: Keep computational code hidden in posts (`echo: false` is the default). Code lives in the repo for reproducibility but doesn't clutter the reading experience.

## Post Structure

Each post lives in `blog/<post-slug>/index.qmd`. Include:
- Clear, compelling title
- `description` for SEO and social sharing
- `date` and `categories` in YAML front matter
- `thumbnail.jpg` for the blog listing

Posts inherit settings from `blog/_metadata.yml` (Giscus comments, bibliography, freeze behavior).
