---
name: sync-cv-esp
description: Sync the Spanish CV (cv/cv_long_term_esp.qmd and wrapper pages) with changes made to the English CV source. Invoke via /sync-cv-esp after editing cv/cv_long_term.qmd, cv/index.qmd, cv/index_typst.qmd, or teaching/classes.qmd.
user-invocable: true
---

# Sync Spanish CV Skill

Reconciles the Spanish CV with the English source after the English side has
changed. This is not a one-shot translation — it's a repeatable diff-and-port
step, since both versions are hand-maintained in parallel and can drift.

Read `glossary.md` in this skill directory before making any edits. It holds
the term mappings and structural conventions already established across the
two versions — reuse them instead of re-deriving translations from scratch.

## File pairs in scope

| English source | Spanish target |
|---|---|
| `cv/cv_long_term.qmd` | `cv/cv_long_term_esp.qmd` |
| `cv/index.qmd` | `cv/index_esp.qmd` |
| `cv/index_typst.qmd` | `cv/index_typst_esp.qmd` |

`teaching/classes.qmd` is an **indirect** source: `cv_long_term.qmd` pulls it
in via `{{< include ../teaching/classes.qmd >}}`, but `cv_long_term_esp.qmd`
inlines a hand-translated version of the same content instead of including
it. So changes to `teaching/classes.qmd` also need to be diffed and ported
into the `### Docencia` section of `cv_long_term_esp.qmd`.

## Never touch

The "Working papers" (`## Documentos de trabajo`) and "Selected works in
progress" (`## Trabajo en progreso (selección)`) sections in
`cv_long_term_esp.qmd` are raw includes of the English partials:

```
{{< include ../research/working_papers.qmd >}}
{{< include ../research/work_in_progress.qmd >}}
```

This is a deliberate, standing decision — these sections show English text
inside the Spanish CV on purpose (research titles stay in their original
language). **Never** convert these to inline translated bullets, and never
edit `research/working_papers.qmd` or `research/work_in_progress.qmd` as part
of this skill. The section *headings* themselves (in `cv_long_term.qmd`) are
still in scope if the English heading wording changes.

## Algorithm

For each target file in the table above (do the content pair first, then the
two wrapper pairs):

1. **Find the last-sync commit:**
   `git log -1 --format=%H -- <target-file>`
   If this returns nothing (target has no history), treat the entire
   corresponding source file as new content to translate.

2. **Diff the source since that commit** (includes both committed history and
   uncommitted working-tree changes):
   `git diff <last-sync-sha> -- <source-file>`
   For `cv_long_term_esp.qmd` specifically, also run:
   `git diff <last-sync-sha> -- teaching/classes.qmd`

3. **If the diff is empty, skip this pair** and note it as "already in sync"
   in the final report.

4. **Read the diff alongside the current target file.** For each changed
   hunk, decide:
   - **Port it.** Genuinely new or changed content (new row, new bullet, new
     section, a footnote whose *meaning* changed) → translate using
     `glossary.md` conventions and apply the analogous edit to the target
     file, in the equivalent location (locations won't always be the same
     line number — the two files aren't line-aligned).
   - **Skip it, and say why.** A wording-only tweak on the English side that
     the existing Spanish text already conveys (e.g. a synonym swap, a
     pluralization) needs no edit. Don't make busywork edits just because a
     line changed upstream.
   - **Skip it — excluded section.** Anything inside the "Never touch"
     sections above.
   - **Mirror the shape, not the literal string.** If a change alters *how*
     something is computed or formatted (e.g. the R date-format string
     changes to drop the day), and the Spanish side implements the same idea
     differently (e.g. via the custom `fecha`/`meses` lookup instead of
     `format()`), update the Spanish implementation to match the new shape —
     don't copy the English code verbatim.

5. **Apply edits** with the `Edit` tool, one logical change at a time.

6. **Update `glossary.md`** if this run coined a translation for a term or
   structural pattern that isn't already documented there — so the next run
   doesn't have to re-derive it.

## Judgment principle

This is not mechanical find-and-replace across two files. Match *meaning*,
not literal wording. The two files have already diverged in legitimate,
intentional ways (different date-formatting code, bold vs. non-bold
institution names, "Certificados" instead of a literal "Certificaciones",
raw-English research sections) — preserve those differences. Only act on
substantive content changes.

## Report format

End every run with a short summary:

- Which target files were updated, and what changed in each (one line per
  edit is enough).
- Which target files were already in sync (empty diff).
- Any changes that were intentionally skipped, and why (wording already
  covered, or inside an excluded section).
- Any new entries added to `glossary.md`.

Do not run `quarto render` automatically as part of every sync — only do it
if the user asks for verification, since it's slow and this skill may run
frequently during editing sessions.
