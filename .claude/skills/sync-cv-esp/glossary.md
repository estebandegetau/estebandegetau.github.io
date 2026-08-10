# CV Translation Glossary & Conventions

Living reference for `/sync-cv-esp`. Entries here are pulled from what's
*already* consistently used across `cv/cv_long_term.qmd` /
`cv/cv_long_term_esp.qmd` and the wrapper pages — treat them as settled, not
suggestions to reconsider. Add a new entry whenever a run coins a translation
or convention that isn't listed yet.

## Section headings

| English | Spanish |
|---|---|
| Education | Formación académica |
| Working papers | Documentos de trabajo |
| Select(ed) work(s) in progress | Trabajo en progreso (selección) |
| Talks & conferences / Presentations | Presentaciones |
| Professional experience | Experiencia profesional |
| Research (sub-heading) | Investigación |
| Public service | Servicio público |
| Teaching | Docencia |
| Industry | Sector privado |
| Recognitions | Reconocimientos |
| Languages & technical skills | Idiomas y habilidades técnicas |
| Certifications | Certificados |
| Contact | Contacto |

Note: the Spanish rendering doesn't always mirror English parenthetical
qualifiers word-for-word (e.g. an English heading picking up "(including
future)" doesn't necessarily require the Spanish heading to grow a matching
qualifier) — use judgment on whether the qualifier is substantive enough to
port.

## Recurring phrases

| English | Spanish |
|---|---|
| Mexico City, Mexico | Ciudad de México, México |
| Barcelona, Catalonia, Spain | Barcelona, Cataluña, España |
| Deputy Head, Fiscal Policy Planning -- Affiliation and Collection Directorate | Subjefe de División de Planeación de Política Fiscal -- Dirección de Incorporación y Recaudación |
| Short Term Consultant | Consultor de Corto Plazo |
| Research Assistant | Asistente de Investigación |
| Senior Business Analyst / Business Analyst | Analista de Negocios Senior / Analista de Negocios |
| International Trade Analyst | Analista de Comercio Internacional |
| Instructor | Profesor / Instructor (Profesor for a course of record, Instructor for a training session — see current Docencia section for examples) |
| TA | Ayudante |
| Undergrad | Licenciatura |
| Fall / Spring | Otoño / Primavera |
| Certificate | Certificado |
| Expected / Scheduled (footnote markers) | Previsto |
| High Honors | Mención Honorífica |
| PhD in Economics | Doctorado en Economía |
| Master of Research in Economics | Máster en Investigación en Economía (MRes) |
| Master in Applied Economics | Maestría en Economía Aplicada |
| BA in Economics | Licenciatura en Economía |

Proper nouns (institution names, place names beyond the "Mexico City" case
above, people's names), and tool/software names (R, Python, Stata, SQL, SAS,
Quarto, Git, GitHub, Power BI, LaTeX, Claude Code) are never translated.
"World Bank" is kept in English (not "Banco Mundial") per current usage.

## Structural conventions (Spanish-only differences from English — preserve these)

- The institution name in the top contact row is **bold** in Spanish
  (`**Barcelona School of Economics**`); it is not bold in English.
- Spanish computes the "last updated" date with an explicit month-name lookup
  (`meses` vector + `fecha` variable) instead of R's `format(d, "%B...")`,
  to avoid depending on system locale for Spanish month names. When the
  English date format *shape* changes (e.g. drops the day, changes
  separators), update the `fecha` computation to produce the equivalent
  shape — do not just copy the English `format()` string into the Spanish
  chunk.
- "Working papers" and "Selected works in progress" section bodies are raw
  `{{< include ../research/*.qmd >}}`s in *both* language versions — research
  titles are intentionally shown in English inside the Spanish CV. This is a
  standing decision, not translation debt. Never change these to inline
  translated bullets.
- The "Teaching" section is the opposite case: English includes
  `teaching/classes.qmd` directly, but Spanish inlines a hand-translated copy
  of the same rows. Diff `teaching/classes.qmd` (not just `cv_long_term.qmd`)
  to catch changes here.
- Some tables carry explicit `: {tbl-colwidths=[...]}` directives that don't
  exist on the English side (or vice versa) — these are formatting choices,
  not translation content; don't add or remove them just because the other
  language's file doesn't have one, unless the English table gained/lost one
  for a real layout reason.
