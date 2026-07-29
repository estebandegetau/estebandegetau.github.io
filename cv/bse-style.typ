// Typst styling for cv/bse.qmd (CSS doesn't apply here since this format
// renders straight to Typst — css-property-processing only translates inline
// styles on spans/divs, not linked stylesheets).

// Space between blocks (tables, quotes, headings act like "paragraphs" here
// since every content row in bse.qmd is written as a pipe table).
#set block(spacing: 0.1em)

// Row spacing *inside* each pipe table: pandoc's default is a uniform 6pt
// inset on every cell side. Splitting x/y lets us tighten row height without
// squeezing the left/right text padding.
#set table(inset: (x: 3pt, y: 4pt))

// Draw a full-width rule immediately under every top-level section heading
// (levels 1 and 2 only — deeper headings get no rule).
#show heading: it => {
  it
  if it.level < 3 {
    v(-0.7em)
    line(length: 100%, stroke: 0.5pt + black)
  }
}
