---
name: "umat-thesis-format-word"
description: "Create, rewrite, format or check a UMaT (University of Mines and Technology, Tarkwa) thesis or BSc group project report as a Word .docx in the exact official UMaT format, including UMaT Harvard referencing."
---

# UMaT Thesis / Project Report Formatter (Word)

Use this skill whenever creating, rewriting, formatting, reviewing or checking a UMaT (University of Mines and Technology, Tarkwa) thesis, dissertation or project report. The output is not a generic thesis: it must contain **exactly and only** what UMaT expects, formatted as specified here, and the formatting must be physically present in the .docx (real styles, fields, section breaks) — not merely described.

## 0. Source priority

1. **Official UMaT guide** — *Format for the Presentation of Theses and Project Reports* (May 2011, revised). Authoritative for all formatting and presentation rules.
2. **Recent accepted UMaT report** — a 2026 BSc Electrical & Electronic Engineering group project report. A practical specimen for current structure and wording, not a source of university-wide rules. Do not copy its typos (e.g. "REFENCES", "DICUSSION") or its three-author layout.
3. **Department / supervisor instructions** supplied by the user — apply when they do not conflict with the guide.
4. **Generic academic conventions** — only where UMaT sources are silent; call these "template choices".

Never silently substitute APA, IEEE, MLA, Chicago or another university's style. If a detail is not established by the sources, mark it as a template choice or ask for the departmental requirement rather than inventing a rule.

## 1. Current project configuration (defaults for this user)

- University of Mines and Technology (UMaT), Tarkwa, Ghana — **Bachelor of Science** undergraduate project report.
- **Group of FOUR students.** Always: four names on the title page, plural "We declare…", four separate signature blocks, the same name order throughout. Never leave a three-author layout copied from the specimen.
- **Never invent** candidate names, index numbers, supervisor names, dates, titles, data, results, equipment specifications, citations or references. Use placeholders: `[CANDIDATE 1 FULL NAME]` … `[CANDIDATE 4 FULL NAME]`, `[SUPERVISOR NAME]`, `[PROJECT TITLE]`, `[MONTH YEAR]`, `[INSERT FIGURE HERE]`.

Before writing, establish (one AskUserQuestion if missing): exact title; four candidate names (title page: forenames then SURNAME; declaration: the order/format the group wants — the specimen used Surname Forenames); faculty and department; programme/degree; supervisor; objectives; methodology; actual results/data; references; chapter content available. If content is missing, build the fully formatted skeleton with placeholders.

## 2. Page setup (mandatory — from the guide)

| Setting | Value |
|---|---|
| Paper | **A4** (21.0 × 29.7 cm) — never Letter; good-quality white bond, printed on one side only |
| Margins | Top **2.54 cm**, Bottom **2.54 cm**, Right **2.54 cm**, Left **3.05 cm** (1.2″, binding) |
| Gutter | 0 cm |
| Header / footer distance | 0.0 cm (layout setting) |
| Headers and footers | **Not allowed** — the footer contains only the automatic page number |
| Page number | Automatic PAGE field in the footer, **centred** (right-aligned also permitted — be consistent) |
| Pagination | Title page: no number shown. Preliminaries: lower-case Roman **i, ii, iii…** (Declaration = i). Chapter 1 → end (References, Appendices): Arabic **1, 2, 3…** starting at 1. Controlled with Word section breaks, never typed |

## 3. Typography and spacing (mandatory)

Font: **Times New Roman** throughout (the guide also allows CG Times, Arial, Tahoma, Courier — use TNR unless the department says otherwise). No decorative typefaces; italic/bold only for emphasis, variables, terminology. Never change body size to 10, 11, 13 or 14 pt.

| Element | Size | Style | Alignment | Spacing |
|---|---|---|---|---|
| Body text | **12 pt** | regular | **Justified**, **no indentation** | **1.5 line spacing** (double only if the supervisor requires), 0 pt before, **12 pt after** — this reproduces the guide's "triple space between paragraphs" without blank lines |
| Title-page lines | 14 pt | **bold, ALL CAPS** | centred | 1.15 lines; gaps by paragraph spacing; must fit ONE page |
| "CHAPTER 1" (Heading 1) | **14 pt** | bold, caps | centred | always starts a new page |
| Chapter title under the number | **12 pt** | bold, ALL CAPS | centred | same Heading 1 paragraph after a line break; 12 pt after |
| Level 2 "1.1 Title" (Heading 2) | 12 pt | **bold**, Title Case | left | number, tab, text; no full stop |
| Level 3 "1.1.1 Title" (Heading 3) | 12 pt | **regular (not bold)**, Title Case | left | number, tab, text |
| Level 4 (Heading 4, unnumbered) | 12 pt | *italic*, sentence case | left | own line; not in the TOC |
| Level 5 (unnumbered, run-in) | 12 pt | *italic* + colon, text continues on the same line | — | — |
| DECLARATION, ABSTRACT, DEDICATION, ACKNOWLEDGEMENTS, REFERENCES, APPENDICES (Heading 1) | 14 pt | bold, caps | centred | new page |
| TABLE OF CONTENTS, LIST OF FIGURES, LIST OF TABLES, LIST OF ABBREVIATIONS, LIST OF SYMBOLS, INTERNATIONAL SYSTEM OF UNITS (Heading 1) | 12 pt | bold, caps | centred | new page |
| Figure caption (Caption style) | 12 pt | **bold**, Title Case | centred, **below** the figure | "Figure 2.1 Title" |
| Table caption (Caption style) | 12 pt | **bold**, Title Case | left, **above** the table | "Table 2.1 Title" |
| Source line for borrowed figure/table | 12 pt | regular | under the caption / under the table | "(Source: Yang, 2019)" |
| Table text | 12 pt (11 pt only if a wide table cannot fit) | header row bold | single spacing | Table Grid borders, table centred |
| Reference entries | 12 pt | see §7 | justified, **hanging indent 1.27 cm** | single spacing within, 12 pt between |
| Contents and lists | 12 pt | see §5 | left, page numbers right-aligned | ~single spacing |

General: British English spelling (organisation, analyse, metre, programme, fulfilment) used consistently; headings numbered with Arabic numerals to **three levels only**, separated by full stops, **no full stop after the last number or at the end of a heading** (never 1.2.3.4); each chapter and each appendix starts on a new page; **no bibliography** (UMaT does not use one); never create layout with runs of spaces, repeated blank lines or manually typed page numbers.

## 4. Order of contents (exactly this)

**Title page** (no page number), centred, bold, 14 pt caps:
```
UNIVERSITY OF MINES AND TECHNOLOGY
TARKWA

FACULTY OF ENGINEERING                     ← user's faculty
DEPARTMENT OF ELECTRICAL AND ELECTRONIC ENGINEERING   ← user's department

A PROJECT REPORT ENTITLED                  (MSc/MPhil/PhD: A THESIS REPORT ENTITLED)

[PROJECT TITLE IN CAPITALS]

BY
[CANDIDATE 1 FULL NAME]
[CANDIDATE 2 FULL NAME]
[CANDIDATE 3 FULL NAME]
[CANDIDATE 4 FULL NAME]

SUBMITTED IN PARTIAL FULFILMENT OF THE REQUIREMENTS FOR THE AWARD OF THE
DEGREE OF BACHELOR OF SCIENCE IN ELECTRICAL AND ELECTRONIC ENGINEERING

PROJECT SUPERVISOR                         (thesis: THESIS SUPERVISOR)

……………………………………………
[SUPERVISOR NAME]

TARKWA, GHANA
[MONTH YEAR]                               ← lowest line, ≤ 25 mm from the foot of the page
```
Statement wording: BSc/MSc → "submitted in **partial** fulfilment of the requirements for the award of the degree of …"; MPhil/PhD → "submitted in fulfilment of the requirement for the award of the degree of …". Title: accurate, concise, descriptive, in capitals; no filler such as "A report on investigations into…".

**Preliminaries (Roman numerals):**
1. **DECLARATION** (i) — own page; every candidate signs each copy. Four-student wording:
   "We declare that this project work is our own work. It is being submitted for the degree of Bachelor of Science in <Programme> in the University of Mines and Technology (UMaT), Tarkwa. It has not been submitted for any degree or examination in any other University."
   Then four signature blocks in a borderless 2 × 2 grid (dotted line / name / "(Signature of Candidate)"), then "……… day of ………………, <year>." (e.g. "10th day of August, 2026.").
2. **ABSTRACT** — **≤ 250 words** (project report / master's; ≤ 500 PhD). Starts with a topic sentence giving the central theme; states objective, methods/procedure, major results (with key numbers), conclusions/recommendations; normal prose, not telegraphic; no citations, quotations, tables or figures; nothing that is not in the report.
3. **DEDICATION** (optional) — brief, centred on its own page.
4. **ACKNOWLEDGEMENTS** — supervisor by name, department/HoD/lecturers, sponsors, companies that provided data or facilities (thanks to God is customary). Not routine help.
5. **TABLE OF CONTENTS** — first three heading levels only, with page numbers (automatic field).
6. **LIST OF FIGURES** — own page; Figure | Title | Page (automatic field). Only if figures are used.
7. **LIST OF TABLES** — own page; Table | Title | Page (automatic field). Only if tables are used.
8. **LIST OF ABBREVIATIONS** (the guide's "Nomenclature") — alphabetical; only if used.
9. **LIST OF SYMBOLS** (optional) — only if the report uses many symbols.
10. **INTERNATIONAL SYSTEM OF UNITS** (optional) — Quantity | Unit | Symbol; common in engineering reports.
Do not add optional lists just to pad the report.

**Main body (Arabic numerals; each chapter on a new page):**
- **CHAPTER 1 GENERAL INTRODUCTION** — must contain the guide's four elements (problem definition, objectives, methods, organisation). Practical BSc structure: 1.1 Background to the Research; 1.2 Problem Definition; 1.3 Project Objectives (one-sentence main aim, then "The specific objectives are to:" + roman list); 1.4 Methods Used (roman list of steps); 1.5 Facilities Used (optional — software, laboratories, company/mine); 1.6 Work Organisation (one paragraph describing each chapter). Add scope/significance/limitations only if appropriate.
- **CHAPTER 2 LITERATURE REVIEW** — synthesise, don't list summaries: technical background, comparison of existing methods/systems, evidence-supported limitations/gaps linked to the objectives; recent and foundational sources; usually 2.1 Introduction … 2.n Review of Related Works … 2.n Summary. Never claim "no one has done this" without evidence. (For a case study, Chapter 2 may describe the study area/mine and Chapter 3 hold the literature or experimental procedure — the guide allows the swap.)
- **CHAPTER 3 METHODS USED** (or MATERIALS AND METHODS / DESIGN METHODOLOGY) — enough for a competent reader to follow: system architecture, materials/equipment, software/tools, mathematical models and design calculations, experimental/simulation set-up, data collection, algorithms/control strategy, validation procedure, performance metrics, safety. Never present planned work as completed work.
- **CHAPTER 4 RESULTS AND DISCUSSION** — for each major result: present it; point to its figure/table; explain the engineering meaning; compare with theory, specification or literature; discuss discrepancies and plausible causes without inventing explanations. Keep measured/calculated facts separate from interpretation.
- **CHAPTER 5 CONCLUSIONS AND RECOMMENDATIONS** ("CONCLUSIONS AND FUTURE WORKS" is acceptable) — 5.1 Conclusions answering each objective from the actual results; 5.2 Recommendations / Future Works as a roman list of realistic extensions. No new evidence.

**End matter:**
- **REFERENCES** — new page; UMaT Harvard only (§7). Never a "Bibliography".
- **APPENDICES** — after References; each appendix on a new page, lettered: "APPENDIX A" with its title on the next line (bold caps, centred). Use for detailed calculations, large tables, source code, questionnaires, extra data, datasheets — not for essential explanations. Tables/figures inside are numbered Table A1, Figure B2 (no full stop).

## 5. Contents and list layout (match the UMaT specimen)

```
                        TABLE OF CONTENTS
Contents                                                      Page      (bold)

DECLARATION                                                      i      (TOC 1: bold)
ABSTRACT                                                        ii
…
INTERNATIONAL SYSTEM OF UNITS                                   xi

CHAPTER 1 GENERAL INTRODUCTION                                   1      (bold)

1.1    Background to the Research                                1      (TOC 2)
1.2    Problem Definition                                        2

CHAPTER 2 LITERATURE REVIEW                                      4

2.1    Introduction                                              4
       2.1.1  Types of Sensors                                   5      (TOC 3, indented 1.27 cm)
…
REFERENCES                                                      39
APPENDICES                                                      42
APPENDIX A  ARDUINO SOURCE CODE                                 43
```
Page numbers right-aligned at the margin, no dot leaders. Lists of Figures/Tables use the header line "Figure  Title  Page". Every entry must match the body text word for word and every page number must be correct.

## 6. Figures, tables, equations, numbers, units, style

- Number by chapter: Figure 2.1, 2.2…; Table 3.1…; Equation (3.1). Appendices: Figure A1, Table B2. Use "Figure" (or "Fig.") consistently.
- Cite every figure/table in the text **before** it appears ("…as shown in Figure 2.1"). Every borrowed figure, table or image carries "(Source: Author, Year)" and a matching reference.
- Figure caption **below**, bold, centred; table caption **above**, bold, left; captions brief but self-explanatory; keep captions with their object. Never fabricate figures, captions or data.
- Tables: only when values must be compared; brief column headings with units (use prefixes such as "mm", never "× 10⁻³"); numbers aligned on the decimal sign; fit one page where possible.
- Graphs: only the relevant range, scales in multiples of 10, labelled axes with units, suppressed zero clearly shown, uncluttered; photographs only when they show something words cannot, with a scale.
- Equations: own line, centred, number in parentheses flush right "(3.1)"; in-line fractions with a solidus (ax + b)/(cx + d) with brackets to avoid ambiguity; follow with a "where," block defining each symbol with units; align equals signs; break long equations before an operator; detailed derivations go to an appendix.
- Numbers: words for integers below ten in text (except with units and in tables); never begin a sentence with a numeral; ordinals first–tenth in words; decimals in numerals with a leading zero (0.352); thousands separated by a space (5 241.2), never a comma; use prefixes or exponents for very large/small numbers.
- SI units: space between value and unit (80 cm, 5 V, 20 °C); no "s" on unit symbols; no full stop after symbols except at sentence end; no space between prefix and symbol (ms); derived units m/s or m s⁻¹; quantity symbols italic, unit symbols roman (never italicise units); vectors bold italic.
- Writing: formal British English; precise, consistent engineering terminology; past tense for work done, present tense for general truths; active voice preferred; sentences ≤ ~25 words; paragraphs ≤ ~100 words with the central statement first; define every acronym at first use — "University of Mines and Technology (UMaT)"; capitals sparingly; accepted abbreviations only. Prefer impersonal phrasing, but the guide prefers "we" over vague constructions like "it is considered" or "the authors are of the opinion". No claims stronger than the evidence; paraphrase genuinely and cite; mark quotations and cite them.

## 7. Referencing — UMaT Harvard system (mandatory)

**In-text:** author–year, never numbered [1] or footnotes.
- One author: (Cobblah, 1997) or Cobblah (1997)
- Two authors: (Mireku-Gyimah and Suglo, 1993) — "and", not "&"
- Three authors: name all three — (Tsidzi, Adofo and Kuma, 1993)
- **More than three authors: first author + et al.** — (Temeng et al., 2000). *This follows the official guide ("if there are more than three authors…"); it overrides any note saying "more than two". If the department insists on et al. for three authors, follow the department.*
- Same author, same year: (Amegbey, 1990a), (Amegbey, 1990b)
- Several works: (Kesse, 1985; Dzigbodi-Adjimah, 1996)
- No author (website, organisation, committee report): (Anon., 2007)
- Every citation must be in REFERENCES and every reference cited in the text. No fabricated or padded sources.

**Reference list:** heading REFERENCES; alphabetical by first author's surname, then year; hanging indent; no numbers, no bullets; all authors listed, the last joined by "and".

Punctuation: comma after surname, full stops after initials (Kesse, G. O.); comma separating every element; year in parentheses then a comma; **titles of articles, theses, reports, lecture notes and web pages in "double inverted commas"**; ***italicise*** book titles, the type of thesis/report/lecture notes, journal names and conference/proceedings names; page ranges "pp. 21 – 26"; whole-book page count "610 pp.".

Templates (*…* = italic):
- **Book:** Kesse, G. O. (1985), *The Mineral and Rock Resources of Ghana*, A. A. Balkema Publishers, Rotterdam, 610 pp.
- **Chapter in edited book:** Sweigard, R. J. (1992), "Materials Handling: Loading and Haulage", In Chap. 9.3 of *SME Mining Engineering Handbook*, Hartman, H. L. (ed.), 2nd edition, Vol. 1, SME, Port City Press, Inc., pp. 761 – 782.
- **Journal:** Dzigbodi-Adjimah, K. (1996), "Environmental Concerns of Ghana's Gold Boom: Past, Present and Future", *Ghana Mining Journal*, Vol. 2, No. 1, pp. 21 – 26.
  Suglo, R. S., Frimpong, S. and Muirhead, I. R. (2003), "System Drivers in the Performance of Auxiliary Ventilation Systems", *CIM Bulletin*, Vol. 96, No. 1069, pp. 110 – 115.
- **Conference:** Eshun, P. A. and Mireku-Gyimah, D. (2002), "Small Scale Mining in the Tarkwa District: A Review of its Impacts", *SWEMP 2002, 7th International Symposium on Environmental Issues and Waste Management in Energy and Mineral Production*, Sardinia, Italy, pp. 877 – 884.
  Tsidzi, K. E. N. and Adofo, R. A. (1993), "Some Environmental Aspects of Mining and Related Activities in Ghana", *Proceedings of the National Seminar on Current Developments in the Minerals Industry of Ghana*, Tsidzi, K. E. N. (ed.), IMME, KNUST, Kumasi, Ghana, pp. 126 – 131.
- **Thesis / project report / lecture notes:** Eshun, P. A. (1998), "Accounting for Risks in Economic Evaluation of Gold Mining Projects in Ghana", *Unpublished BSc Project Report*, University of Mines and Technology, Tarkwa, 83 pp.
  Yang, T. (2019), "Low-Noise Micro-Power Amplifiers for Bio-signals Acquisition", *Unpublished PhD Dissertation*, University of Tennessee, 102 pp.
  Adetunde, I. A. (2010), "Experimental Design", *Unpublished BSc Lecture Notes*, University of Mines and Technology, Tarkwa, 72 pp.
- **Web page / organisation / committee report:** Anon. (2007), "The Global Mining Initiative", www.globalmining.com. Accessed: November 11, 2007.
  Anon. (1993), *Caterpillar Performance Handbook*, 24th ed., Caterpillar Inc., Peoria, USA, pp. 4-107 – 4-129.
  Hutson, S. S., Barber, N. L., Kenny, J. F., Linsey, K. S., Lumia, D. S. and Maupin, M. A. (2004), *Estimated Use of Water in the United States in 2000*, US Geol Surv Cir 1268, www.pubs.usgs.gov/circ/2004/circ1268. Accessed: December 19, 2005.

Convert references given in APA/IEEE/other styles, DOIs or links into these templates. If an element (volume, issue, pages, publisher, access date) is unknown, omit it — never invent it — and tell the user which entries are incomplete.

## 8. How to build the .docx

1. If available, read the `anthropic-skills:docx` skill for general docx know-how; the rules in THIS skill win on any conflict.
2. Existing draft (.docx): extract text with `pandoc draft.docx -t markdown` and images from `word/media/` (unzip), then rebuild with the builder — don't patch hundreds of direct-formatted runs.
3. Write the builder module (§11) verbatim to `umat_thesis.py`; `pip install python-docx --break-system-packages` if needed. Write a script that fills `meta` and a `content(t)` function and calls `build(meta, content, "<Short_Title>_Project_Report.docx")`.
   ```python
   meta = dict(faculty="Faculty of Engineering",
               department="Department of Electrical and Electronic Engineering",
               title="[PROJECT TITLE]", group_size=4,
               students=["[CANDIDATE 1 FULL NAME]", "[CANDIDATE 2 FULL NAME]",
                         "[CANDIDATE 3 FULL NAME]", "[CANDIDATE 4 FULL NAME]"],
               declaration_names=None,          # or list in the order/format for the declaration
               statement="Submitted in partial fulfilment of the requirements for the award of the "
                         "degree of Bachelor of Science in Electrical and Electronic Engineering",
               degree="Bachelor of Science in Electrical and Electronic Engineering",
               supervisor="[SUPERVISOR NAME]", date="[MONTH YEAR]",
               declaration_date=None)           # e.g. "10th day of August, 2026."
   ```
4. `content(t)` calls, in order: `t.title_page()`, `t.start_preliminaries()`, `t.declaration()`, `t.abstract(text)`, `t.dedication(text)` (optional), `t.acknowledgements(text)`, `t.table_of_contents()`, `t.list_of_figures()` / `t.list_of_tables()` (only if used), `t.two_column_list("LIST OF ABBREVIATIONS", "Abbreviation", "Meaning", rows)` and/or symbols / `("INTERNATIONAL SYSTEM OF UNITS", "Quantity", "Unit", rows, three="Symbol")`, `t.start_main_body()`, then per chapter `t.chapter(title)`, `t.h2()`, `t.h3()`, `t.h4()`, `t.p()`, `t.items()`, `t.figure()`, `t.table()`, `t.equation()`; then `t.references(list)`; optionally `t.appendices()` and `t.appendix("A", title)` …
   - `t.p(text)`: inline `*italic*`, `**bold**`, `^superscript^`, `~subscript~`; `t.p(text, run_in="Advantages")` = level-5 run-in heading.
   - `t.items([...])`: UMaT roman list i., ii., iii. with ";", "; and", "." added automatically (pass items without end punctuation); `style="bullet"` for bullets.
   - `t.figure(path_or_None, caption, source=None, width_cm=12)`: None leaves "[INSERT FIGURE HERE]".
   - `t.table(caption, header, rows, source=None)`; `t.equation("f~c~ = 1/(2πRC)", where=[("fc", "cut-off frequency (Hz)"), …])`.
5. `build()` renders pass 1 with LibreOffice (`soffice`) + `pdftotext` to find page numbers, then pre-fills the Word TOC / List of Figures / List of Tables **fields** with them, so the numbers are correct on opening and still update in Word (Ctrl+A, F9). Without LibreOffice it prints a warning and numbers show "?" — tell the user to update fields in Word.
6. Verify: `soffice --headless --convert-to pdf` the result, `pdftoppm -r 50 -png`, and look at the title page (must be ONE page), declaration, contents, a chapter opening, a figure page, a table and the references; run §9. Fix and rebuild if anything fails.
7. Deliver the .docx (and save it into the user's connected folder if one is linked). List the placeholders left (names, images, signatures, missing reference details).

## 9. Final checklist (verify every item before delivering)

**Structure** — title page in UMaT order with four candidates, on one page; declaration on its own page with four signature blocks and plural wording; abstract ≤ 250 words; preliminaries in the §4 order; Chapter 1 on Arabic page 1; References before Appendices; each appendix on a new page.
**Page & typography** — A4; margins 2.54/2.54/2.54, left 3.05 cm; no gutter; no header text; footer holds only the automatic centred page number; TNR 12 pt body, 1.5 spacing, justified, no indents, 12 pt between paragraphs; no layout built from spaces or blank lines.
**Headings** — Heading 1–4 styles used; Arabic numbering, max three levels, no trailing full stops; "CHAPTER n" 14 pt bold centred with the 12 pt bold caps title below; every chapter on a new page.
**Contents & lists** — TOC shows levels 1–3 only; lists of figures/tables present only when used; all titles and page numbers match the body.
**Figures, tables, equations** — figure captions below, table captions above, bold; chapter-based numbering in sequence; each cited in text first; sources given; equations numbered (chapter.n) with a "where," block.
**References** — Harvard author–year; et al. only for > 3 authors; alphabetical; hanging indent; UMaT punctuation; every citation ↔ reference; no bibliography; no numbered system; nothing fabricated.
**Integrity** — no fabricated data, results, sources or claims; no planned work presented as done; British English, acronyms defined at first use, number and SI rules followed.

## 10. Binding cover and copies (only if asked)

Cover (centred): UNIVERSITY OF MINES AND TECHNOLOGY / TARKWA / FACULTY OF … / … DEPARTMENT / <TITLE> / BY / <NAMES> / BSC (or MSC, MPHIL, PHD) / <MONTH YEAR>.
Copies: BSc — 2 unbound for examination, 2 bound after corrections; MSc/MPhil — 3 unbound, 3 bound; PhD — 5 unbound, 3 bound. Illustrations too large for A4 go in a pocket inside the back cover.

## 11. Builder module — write this verbatim to `umat_thesis.py`

```python
"""UMaT thesis / project report builder (python-docx).

    from umat_thesis import build
    def content(t):
        t.title_page(); t.start_preliminaries(); t.declaration(); ...
    build(meta, content, "Report.docx")

Real Word structures are used: Heading 1-4 styles, Caption paragraphs with SEQ
fields, TOC / List of Figures / List of Tables as Word fields, section breaks for
Roman -> Arabic page numbers, PAGE field in the footer. build() renders pass 1
with LibreOffice to learn the page numbers and pre-fills the TOC fields with
correct results, so the document is right when opened and can still be updated
in Word (References > Update Table / F9).
"""
import os, re, subprocess, tempfile, shutil
from docx import Document
from docx.shared import Pt, Cm, RGBColor
from docx.enum.text import WD_ALIGN_PARAGRAPH, WD_TAB_ALIGNMENT
from docx.enum.style import WD_STYLE_TYPE
from docx.enum.section import WD_SECTION
from docx.enum.table import WD_TABLE_ALIGNMENT
from docx.oxml.ns import qn
from docx.oxml import OxmlElement

FONT = "Times New Roman"
TEXT_W = Cm(21.0 - 3.05 - 2.54)          # 15.41 cm usable width
ROMAN = "i ii iii iv v vi vii viii ix x xi xii xiii xiv xv xvi xvii xviii xix xx".split()


# ---------------------------------------------------------------- low level
def _font(run, size=12, bold=None, italic=None):
    run.font.name = FONT
    rf = run._element.rPr.rFonts
    rf.set(qn("w:eastAsia"), FONT); rf.set(qn("w:cs"), FONT)
    run.font.size = Pt(size)
    if bold is not None: run.bold = bold
    if italic is not None: run.italic = italic
    return run


def _fmt(p, align=WD_ALIGN_PARAGRAPH.JUSTIFY, before=0, after=12, line=1.5,
         keep_next=False, left=None, first=None):
    f = p.paragraph_format
    p.alignment = align
    f.space_before, f.space_after = Pt(before), Pt(after)
    f.line_spacing = line
    f.keep_with_next = keep_next
    if left is not None: f.left_indent = left
    if first is not None: f.first_line_indent = first
    return p


def _fld(p, kind, instr=None, size=12, bold=False):
    """Append one piece of a complex field to paragraph p. kind: begin|instr|separate|end."""
    r = p.add_run(); _font(r, size, bold=bold)
    if kind == "instr":
        it = OxmlElement("w:instrText"); it.set(qn("xml:space"), "preserve"); it.text = f" {instr} "
        r._r.append(it)
    else:
        fc = OxmlElement("w:fldChar"); fc.set(qn("w:fldCharType"), kind); r._r.append(fc)
    return r


def _simple_field(p, instr, result, size=12, bold=False):
    _fld(p, "begin", size=size, bold=bold); _fld(p, "instr", instr, size, bold)
    _fld(p, "separate", size=size, bold=bold)
    _font(p.add_run(result), size, bold=bold)
    _fld(p, "end", size=size, bold=bold)


def _pgnum(section, fmt, start=1):
    sp = section._sectPr
    for old in sp.findall(qn("w:pgNumType")): sp.remove(old)
    pg = OxmlElement("w:pgNumType")
    if fmt: pg.set(qn("w:fmt"), fmt)
    pg.set(qn("w:start"), str(start))
    # schema order: pgNumType must come before cols/docGrid etc.
    cols = sp.find(qn("w:cols"))
    if cols is not None: cols.addprevious(pg)
    else: sp.append(pg)


def _layout(section):
    section.page_width, section.page_height = Cm(21.0), Cm(29.7)      # A4, never Letter
    section.top_margin = section.bottom_margin = section.right_margin = Cm(2.54)
    section.left_margin = Cm(3.05)                                    # 1.2" binding side
    section.gutter = Cm(0)
    section.header_distance = Cm(0)                                   # UMaT: header 0.0 cm
    section.footer_distance = Cm(0)                                   # UMaT: footer 0.0 cm


def _no_borders(table):
    tblPr = table._tbl.tblPr
    b = OxmlElement("w:tblBorders")
    for e in ("top", "left", "bottom", "right", "insideH", "insideV"):
        x = OxmlElement(f"w:{e}"); x.set(qn("w:val"), "nil"); b.append(x)
    tblPr.append(b)


def _style(d, name, size=12, bold=False, italic=False, align=None, before=0, after=12,
           line=1.5, keep_next=True, left=None, tabs=()):
    try:
        s = d.styles[name]
    except KeyError:
        s = d.styles.add_style(name, WD_STYLE_TYPE.PARAGRAPH)
        s.base_style = d.styles["Normal"]
    s.font.name = FONT; s.font.size = Pt(size); s.font.bold = bold; s.font.italic = italic
    s.font.color.rgb = RGBColor(0, 0, 0)
    rPr = s.element.get_or_add_rPr()
    rf = rPr.find(qn("w:rFonts"))
    for a in ("w:asciiTheme", "w:hAnsiTheme", "w:eastAsiaTheme", "w:cstheme"):
        if rf is not None and rf.get(qn(a)) is not None: del rf.attrib[qn(a)]
    if rf is not None: rf.set(qn("w:eastAsia"), FONT); rf.set(qn("w:cs"), FONT)
    col = rPr.find(qn("w:color"))
    if col is not None:
        for a in ("w:themeColor", "w:themeShade", "w:themeTint"):
            if col.get(qn(a)) is not None: del col.attrib[qn(a)]
    pf = s.paragraph_format
    if align is not None: pf.alignment = align
    pf.space_before, pf.space_after, pf.line_spacing = Pt(before), Pt(after), line
    pf.keep_with_next = keep_next
    if left is not None: pf.left_indent = left
    for pos, al in tabs: pf.tab_stops.add_tab_stop(pos, al)
    return s


# ---------------------------------------------------------------- thesis
class Thesis:
    def __init__(self, meta, pages=None):
        self.m = meta
        self.pages = pages or {}           # key -> printed page label (from pass 1)
        self.toc, self.figs, self.tabs = [], [], []
        self.ch = 0; self.s2 = self.s3 = 0; self.fig_n = self.tab_n = self.eq_n = 0
        self.appendix_letter = None
        self._pending_pb = False
        d = self.d = Document()
        st = d.styles["Normal"]
        st.font.name = FONT; st.font.size = Pt(12)
        st.element.rPr.rFonts.set(qn("w:eastAsia"), FONT)
        pf = st.paragraph_format
        pf.line_spacing = 1.5; pf.space_before = Pt(0); pf.space_after = Pt(12)
        pf.alignment = WD_ALIGN_PARAGRAPH.JUSTIFY
        lang = OxmlElement("w:lang"); lang.set(qn("w:val"), "en-GB"); st.element.rPr.append(lang)
        C, L, R = WD_ALIGN_PARAGRAPH.CENTER, WD_ALIGN_PARAGRAPH.LEFT, WD_TAB_ALIGNMENT.RIGHT
        # Heading styles (TOC picks up levels 1-3)
        _style(d, "Heading 1", 14, bold=True, align=C, after=12)
        _style(d, "Heading 2", 12, bold=True, align=L, before=6, after=12, tabs=[(Cm(1.27), WD_TAB_ALIGNMENT.LEFT)])
        _style(d, "Heading 3", 12, bold=False, align=L, before=6, after=12, tabs=[(Cm(1.27), WD_TAB_ALIGNMENT.LEFT)])
        _style(d, "Heading 4", 12, bold=False, italic=True, align=L, after=12)
        _style(d, "Caption", 12, bold=True, align=C, after=12, line=1.0, keep_next=False)
        # TOC / list styles (used when Word regenerates the fields)
        _style(d, "toc 1", 12, bold=True, align=L, after=0, line=1.15, keep_next=False, tabs=[(TEXT_W, R)])
        _style(d, "toc 2", 12, align=L, after=0, line=1.15, keep_next=False, left=Cm(0),
               tabs=[(Cm(1.27), WD_TAB_ALIGNMENT.LEFT), (TEXT_W, R)])
        _style(d, "toc 3", 12, align=L, after=0, line=1.15, keep_next=False, left=Cm(1.27),
               tabs=[(Cm(2.54), WD_TAB_ALIGNMENT.LEFT), (TEXT_W, R)])
        _style(d, "table of figures", 12, align=L, after=6, line=1.15, keep_next=False,
               tabs=[(Cm(2.0), WD_TAB_ALIGNMENT.LEFT), (TEXT_W, R)])
        _layout(d.sections[0])

    # ------------------------------------------------ helpers
    def _key(self, kind, text): return f"{kind}|{text}"
    def _pg(self, key): return self.pages.get(key, "?")
    def _new_page(self): self._pending_pb = True

    def _para(self, style=None, **kw):
        p = self.d.add_paragraph(style=style)
        if self._pending_pb:
            p.paragraph_format.page_break_before = True
            self._pending_pb = False
        return _fmt(p, **kw) if kw or style is None else p

    def major_heading(self, text, toc=True, size=14):
        """Unnumbered major heading (Heading 1): new page, centred, bold, caps."""
        self._new_page()
        p = self._para(style="Heading 1")
        _font(p.add_run(text.upper()), size, bold=True)
        if toc: self.toc.append(("major", text.upper(), self._key("H", text.upper())))
        return p

    # ------------------------------------------------ title page
    def title_page(self):
        m = self.m
        n = m.get("group_size", 4)
        students = m.get("students") or [f"[CANDIDATE {i + 1} FULL NAME]" for i in range(n)]
        def line(t, after=0):
            p = self._para(align=WD_ALIGN_PARAGRAPH.CENTER, after=after, line=1.15)
            _font(p.add_run(t), 14, bold=True)
        # Spacing is tuned so up to five candidates still fit on ONE page.
        line("UNIVERSITY OF MINES AND TECHNOLOGY")
        line("TARKWA", after=18)
        line(m.get("faculty", "[FACULTY]").upper())
        line(m.get("department", "[DEPARTMENT]").upper(), after=24)
        line(m.get("report_type", "A PROJECT REPORT ENTITLED").upper(), after=18)
        line(m.get("title", "[PROJECT TITLE]").upper(), after=24)
        line("BY", after=8)
        for i, s in enumerate(students):                    # full forenames then SURNAME
            line(s.upper(), after=24 if i == len(students) - 1 else 0)
        line(m.get("statement", "[SUBMITTED IN PARTIAL FULFILMENT OF THE REQUIREMENTS FOR THE AWARD "
                   "OF THE DEGREE OF BACHELOR OF SCIENCE IN PROGRAMME]").upper(), after=24)
        line(m.get("supervisor_label", "PROJECT SUPERVISOR"), after=30)
        line("……………………………………………")
        line(m.get("supervisor", "[SUPERVISOR NAME]").upper(), after=36)
        line("TARKWA, GHANA")
        line(m.get("date", "[MONTH YEAR]").upper())

    # ------------------------------------------------ preliminaries
    def start_preliminaries(self):
        sec = self.d.add_section(WD_SECTION.NEW_PAGE)
        _layout(sec)
        sec.footer.is_linked_to_previous = False
        fp = sec.footer.paragraphs[0]; fp.alignment = WD_ALIGN_PARAGRAPH.CENTER
        _simple_field(fp, "PAGE", "i")
        _pgnum(sec, "lowerRoman", 1)                 # Declaration = i
        self._section_start = True

    def declaration(self):
        m = self.m
        n = m.get("group_size", 4)
        p = self.major_heading("DECLARATION")
        p.paragraph_format.page_break_before = False     # section break already starts a page
        names = m.get("declaration_names") or m.get("students") or \
            [f"[CANDIDATE {i + 1} NAME]" for i in range(n)]
        plural = len(names) > 1
        who = "We declare that this project work is our own work" if plural else \
              "I declare that this project work is my own work"
        self.p(f"{who}. It is being submitted for the degree of {m.get('degree', '[DEGREE]')} in the "
               "University of Mines and Technology (UMaT), Tarkwa. It has not been submitted "
               "for any degree or examination in any other University.")
        cols = 2 if len(names) > 1 else 1; rows = (len(names) + cols - 1) // cols
        tbl = self.d.add_table(rows=rows, cols=cols); _no_borders(tbl)
        tbl.alignment = WD_TABLE_ALIGNMENT.CENTER
        for i, name in enumerate(names):
            c = tbl.cell(i // cols, i % cols)
            for j, t in enumerate(("……………………………………", name, "(Signature of Candidate)")):
                cp = c.paragraphs[0] if j == 0 else c.add_paragraph()
                _fmt(cp, align=WD_ALIGN_PARAGRAPH.CENTER, before=30 if j == 0 else 0, after=0, line=1.15)
                _font(cp.add_run(t), 12)
        yr = m.get("date", "[YEAR]").split()[-1]
        q = self._para(before=30)
        _font(q.add_run(m.get("declaration_date") or f"……………… day of ………………………, {yr}."), 12)

    def abstract(self, text):
        n = len(text.split())
        if n > self.m.get("abstract_limit", 250):
            print(f"WARNING: Abstract has {n} words; UMaT limit is 250 (BSc/MSc), 500 (PhD). Shorten it.")
        self.major_heading("ABSTRACT")
        for para in text.strip().split("\n\n"): self.p(para.strip())

    def dedication(self, text):
        self.major_heading("DEDICATION")
        for i, line in enumerate(text.strip().split("\n")):
            q = self._para(align=WD_ALIGN_PARAGRAPH.CENTER, before=120 if i == 0 else 0, after=0)
            _font(q.add_run(line), 12)

    def acknowledgements(self, text):
        self.major_heading("ACKNOWLEDGEMENTS")
        for para in text.strip().split("\n\n"): self.p(para.strip())

    def _list_head(self, a, b, c=None):
        p = self._para(after=12, line=1.0, align=WD_ALIGN_PARAGRAPH.LEFT)
        ts = p.paragraph_format.tab_stops
        if c is None:
            ts.add_tab_stop(TEXT_W, WD_TAB_ALIGNMENT.RIGHT)
            _font(p.add_run(f"{a}\t{b}"), 12, bold=True)
        else:
            ts.add_tab_stop(Cm(2.0)); ts.add_tab_stop(TEXT_W, WD_TAB_ALIGNMENT.RIGHT)
            _font(p.add_run(f"{a}\t{b}\t{c}"), 12, bold=True)

    def table_of_contents(self):
        self.major_heading("TABLE OF CONTENTS", size=12)
        self._toc_anchor = self._para(after=0, line=1.0)

    def list_of_figures(self):
        self.major_heading("LIST OF FIGURES", size=12)
        self._lof_anchor = self._para(after=0, line=1.0)

    def list_of_tables(self):
        self.major_heading("LIST OF TABLES", size=12)
        self._lot_anchor = self._para(after=0, line=1.0)

    def two_column_list(self, heading, col1, col2, rows, three=None):
        """Abbreviations / Symbols / SI units. rows = [(a,b)] or [(a,b,c)]. Only include if used."""
        self.major_heading(heading, size=12)
        def tabs(p):
            p.paragraph_format.tab_stops.add_tab_stop(Cm(4))
            if three: p.paragraph_format.tab_stops.add_tab_stop(Cm(10))
        p = self._para(after=12, line=1.0, align=WD_ALIGN_PARAGRAPH.LEFT); tabs(p)
        _font(p.add_run(f"{col1}\t{col2}" + (f"\t{three}" if three else "")), 12, bold=True)
        for r in sorted(rows, key=lambda r: r[0].lower()) if not three else rows:
            q = self._para(after=6, line=1.15, align=WD_ALIGN_PARAGRAPH.LEFT); tabs(q)
            _font(q.add_run("\t".join(r)), 12)

    # ------------------------------------------------ main body
    def start_main_body(self):
        sec = self.d.add_section(WD_SECTION.NEW_PAGE)
        _layout(sec)
        _pgnum(sec, None, 1)                       # Arabic 1 at Chapter 1 (footer inherited)
        self._first_chapter = True

    def chapter(self, title):
        self.ch += 1; self.s2 = self.s3 = 0; self.fig_n = self.tab_n = self.eq_n = 0
        if not getattr(self, "_first_chapter", False): self._new_page()
        self._first_chapter = False
        p = self._para(style="Heading 1")
        _font(p.add_run(f"CHAPTER {self.ch}"), 14, bold=True)
        p.add_run().add_break()
        _font(p.add_run(title.upper()), 12, bold=True)
        self.toc.append(("chapter", f"CHAPTER {self.ch} {title.upper()}", self._key("C", str(self.ch))))

    def h2(self, title):
        self.s2 += 1; self.s3 = 0
        num = f"{self.ch}.{self.s2}"
        p = self._para(style="Heading 2")
        _font(p.add_run(f"{num}\t{title.rstrip('.')}"), 12, bold=True)
        self.toc.append(("h2", (num, title), self._key("H2", num)))

    def h3(self, title):
        self.s3 += 1
        num = f"{self.ch}.{self.s2}.{self.s3}"
        p = self._para(style="Heading 3")
        _font(p.add_run(f"{num}\t{title.rstrip('.')}"), 12, bold=False)
        self.toc.append(("h3", (num, title), self._key("H3", num)))

    def h4(self, title):
        """Fourth level: unnumbered, italic (not in TOC)."""
        p = self._para(style="Heading 4")
        _font(p.add_run(title), 12, italic=True, bold=False)

    def _rich(self, para, text):
        for part in re.split(r"(\*\*[^*]+\*\*|\*[^*]+\*|\^[^^]+\^|~[^~]+~)", text):
            if not part: continue
            if part.startswith("**"): _font(para.add_run(part[2:-2]), 12, bold=True)
            elif part.startswith("*"): _font(para.add_run(part[1:-1]), 12, italic=True)
            elif part.startswith("^"): r = _font(para.add_run(part[1:-1]), 12); r.font.superscript = True
            elif part.startswith("~"): r = _font(para.add_run(part[1:-1]), 12); r.font.subscript = True
            else: _font(para.add_run(part), 12)

    def p(self, text, run_in=None):
        """Body paragraph: TNR 12, 1.5 spacing, justified, no indent, 12 pt after.
        Inline marks: *italic*, **bold**, ^superscript^, ~subscript~.
        run_in: fifth-level italic heading leading into the text on the same line."""
        para = self._para()
        if run_in: _font(para.add_run(run_in.rstrip(":") + ": "), 12, italic=True)
        self._rich(para, text)
        return para

    def items(self, items, style="roman"):
        """UMaT list: i., ii., iii. ... each ends ';', penultimate '; and', last '.'"""
        n = len(items)
        for i, it in enumerate(items):
            it = it.rstrip(" ;.")
            if it.endswith(" and"): it = it[:-4]
            end = "." if i == n - 1 else ("; and" if i == n - 2 else ";")
            mark = f"{ROMAN[i]}." if style == "roman" else "•"
            q = self._para(after=12 if i == n - 1 else 0, left=Cm(1.27), first=Cm(-0.76))
            q.paragraph_format.tab_stops.add_tab_stop(Cm(1.27))
            _font(q.add_run(f"{mark}\t"), 12); self._rich(q, it + end)

    def _caption(self, label, align, caption, keep_next):
        """Caption paragraph with a real SEQ field: 'Figure 2.1 Title'."""
        c = self._para(style="Caption")
        c.alignment = align
        c.paragraph_format.keep_with_next = keep_next
        if self.appendix_letter:                      # appendix: Figure A1 (static)
            num = f"{self.appendix_letter}{self.fig_n if label == 'Figure' else self.tab_n}"
            _font(c.add_run(f"{label} {num} {caption}"), 12, bold=True)
        else:
            n = self.fig_n if label == "Figure" else self.tab_n
            num = f"{self.ch}.{n}"
            _font(c.add_run(f"{label} {self.ch}."), 12, bold=True)
            _simple_field(c, f"SEQ {label} \\* ARABIC \\s 1", str(n), bold=True)
            _font(c.add_run(f" {caption}"), 12, bold=True)
        return c, num

    def figure(self, image_path, caption, source=None, width_cm=12):
        """Figure centred; caption BELOW, bold, centred. Cite 'Figure x.y' in text first."""
        self.fig_n += 1
        p = self._para(align=WD_ALIGN_PARAGRAPH.CENTER, after=6, line=1.0, keep_next=True)
        if image_path and os.path.exists(image_path):
            p.add_run().add_picture(image_path, width=Cm(width_cm))
        else:
            _font(p.add_run("[INSERT FIGURE HERE]"), 12, italic=True)
        c, num = self._caption("Figure", WD_ALIGN_PARAGRAPH.CENTER, caption, keep_next=bool(source))
        if source:
            c.paragraph_format.space_after = Pt(0)
            s = self._para(align=WD_ALIGN_PARAGRAPH.CENTER, after=12, line=1.0)
            _font(s.add_run(f"(Source: {source})"), 12)
        self.figs.append((num, caption, self._key("F", num)))
        return num

    def table(self, caption, header, rows, source=None, col_widths_cm=None, size=12):
        """Caption ABOVE table, bold, left. Table Grid, header row bold, single spacing."""
        self.tab_n += 1
        c, num = self._caption("Table", WD_ALIGN_PARAGRAPH.LEFT, caption, keep_next=True)
        c.paragraph_format.space_after = Pt(6)
        t = self.d.add_table(rows=1 + len(rows), cols=len(header))
        t.style = "Table Grid"; t.alignment = WD_TABLE_ALIGNMENT.CENTER
        for r_i, row in enumerate([header] + rows):
            for c_i, val in enumerate(row):
                cell = t.cell(r_i, c_i); cp = cell.paragraphs[0]
                _fmt(cp, align=WD_ALIGN_PARAGRAPH.CENTER if (r_i == 0 or c_i > 0) else WD_ALIGN_PARAGRAPH.LEFT,
                     after=0, line=1.0, keep_next=r_i < len(rows))
                _font(cp.add_run(str(val)), size, bold=(r_i == 0))
                if col_widths_cm: cell.width = Cm(col_widths_cm[c_i])
        s = self._para(align=WD_ALIGN_PARAGRAPH.LEFT, before=4, after=12, line=1.0)
        if source: _font(s.add_run(f"(Source: {source})"), 12)
        self.tabs.append((num, caption, self._key("T", num)))
        return num

    def equation(self, expr, where=None):
        """Own line, centred, number (chapter.n) flush right; 'where,' block defines symbols.
        expr in linear form with a solidus: 'fc = 1/(2πRC)'."""
        self.eq_n += 1
        num = f"({self.ch}.{self.eq_n})"
        p = self._para(align=WD_ALIGN_PARAGRAPH.LEFT, after=6 if where else 12, keep_next=bool(where))
        ts = p.paragraph_format.tab_stops
        ts.add_tab_stop(Cm(TEXT_W.cm / 2), WD_TAB_ALIGNMENT.CENTER)
        ts.add_tab_stop(TEXT_W, WD_TAB_ALIGNMENT.RIGHT)
        _font(p.add_run("\t"), 12); self._rich(p, expr); _font(p.add_run(f"\t{num}"), 12)
        for i, (sym, meaning) in enumerate(where or []):
            q = self._para(align=WD_ALIGN_PARAGRAPH.LEFT, after=12 if i == len(where) - 1 else 0,
                           line=1.15, left=Cm(1.27), first=Cm(-1.27))
            q.paragraph_format.tab_stops.add_tab_stop(Cm(1.27))
            _font(q.add_run("where,\t" if i == 0 else "\t"), 12)
            _font(q.add_run(sym), 12, italic=True)
            _font(q.add_run(f" = {meaning}"), 12)
        return num

    # ------------------------------------------------ end matter
    def references(self, refs):
        """UMaT Harvard entries (use *italic* marks). Sorted by first author surname, then year."""
        self.major_heading("REFERENCES")
        def key(r):
            m = re.match(r"\s*([^,(]+).*?\((\d{4}[a-z]?)", r)
            return (m.group(1).lower().strip(), m.group(2)) if m else (r.lower(), "")
        for r in sorted(refs, key=key):
            q = self._para(align=WD_ALIGN_PARAGRAPH.JUSTIFY, after=12, line=1.0,
                           left=Cm(1.27), first=Cm(-1.27))
            self._rich(q, r)

    def appendices(self):
        self.major_heading("APPENDICES")

    def appendix(self, letter, title):
        """Each appendix on a new page: 'APPENDIX A' / title (bold caps, centred)."""
        self.appendix_letter = letter; self.fig_n = self.tab_n = 0
        self._new_page()
        p = self._para(style="Heading 1")
        _font(p.add_run(f"APPENDIX {letter}"), 12, bold=True)
        p.add_run().add_break()
        _font(p.add_run(title.upper()), 12, bold=True)
        self.toc.append(("appendix", f"APPENDIX {letter} {title.upper()}", self._key("A", letter)))

    # ------------------------------------------------ list generation (Word fields, pre-filled)
    def _insert_before(self, anchor, build_fn):
        body = self.d.element.body
        keep = list(body); before = set(id(e) for e in keep)
        build_fn()
        new = [e for e in body if id(e) not in before and e.tag == qn("w:p")]
        for e in new: anchor._p.addprevious(e)

    def _entry(self, style, text, page, after=None):
        p = self.d.add_paragraph(style=style)
        if after is not None: p.paragraph_format.space_after = Pt(after)
        bold = style == "toc 1"
        _font(p.add_run(f"{text}\t{page}"), 12, bold=bold)
        return p

    def _wrap_field(self, paras, instr):
        """Turn a run of pre-filled paragraphs into one updatable Word field."""
        if not paras: return
        first, last = paras[0], paras[-1]
        r0 = first.runs[0]._r
        for kind in ("begin", "instr", "separate"):
            r = _fld(first, kind, instr); r0.addprevious(r._r)
        _fld(last, "end")

    def finish_lists(self):
        if hasattr(self, "_toc_anchor"):
            made = []
            def b():
                self._list_head("Contents", "Page")
                for i, (kind, data, key) in enumerate(self.toc):
                    nxt = self.toc[i + 1][0] if i + 1 < len(self.toc) else None
                    pg = self._pg(key)
                    if kind in ("major", "chapter", "appendix"):
                        gap = 12 if (nxt == "chapter" or (kind == "chapter" and nxt == "h2")) else 0
                        made.append(self._entry("toc 1", data, pg, gap))
                    else:
                        num, t = data
                        gap = 12 if nxt not in ("h2", "h3") else 0
                        made.append(self._entry("toc 2" if kind == "h2" else "toc 3", f"{num}\t{t}", pg, gap))
            self._insert_before(self._toc_anchor, b)
            self._wrap_field(made, 'TOC \\o "1-3" \\h \\z \\u')
        for attr, items, label in (("_lof_anchor", self.figs, "Figure"), ("_lot_anchor", self.tabs, "Table")):
            if hasattr(self, attr):
                made = []
                def b(items=items, label=label, made=made):
                    self._list_head(label, "Title", "Page")
                    for num, cap, key in items:
                        made.append(self._entry("table of figures", f"{num}\t{cap}", self._pg(key)))
                self._insert_before(getattr(self, attr), b)
                self._wrap_field(made, f'TOC \\h \\z \\c "{label}"')


# ---------------------------------------------------------------- two-pass build
def _norm(s): return re.sub(r"\s+", " ", s).strip().upper()


def _pdf(docx_path):
    tmp = tempfile.mkdtemp()
    subprocess.run(["soffice", "--headless", "--convert-to", "pdf", "--outdir", tmp, docx_path],
                   check=True, capture_output=True, timeout=300)
    return os.path.join(tmp, os.path.splitext(os.path.basename(docx_path))[0] + ".pdf")


def _find_pages(docx_path, t):
    """Render with LibreOffice; map each TOC/figure/table key to its printed page label."""
    if not (shutil.which("soffice") and shutil.which("pdftotext")): return {}
    pdf = _pdf(docx_path)
    txt = subprocess.run(["pdftotext", "-layout", pdf, "-"], capture_output=True, text=True).stdout
    labels, bodies = [], []
    for pg in txt.split("\f"):
        lines = [l.strip() for l in pg.strip().splitlines() if l.strip()]
        lab = lines[-1] if lines and re.fullmatch(r"[0-9]+|[ivxlc]+", lines[-1]) else ""
        labels.append(lab); bodies.append(_norm(" ".join(lines[:-1] if lab else lines)))
    shutil.rmtree(os.path.dirname(pdf), ignore_errors=True)
    def search(pattern, frm):
        for i in range(max(frm, 0), len(bodies)):
            if re.search(pattern, bodies[i]): return i
        return None
    out = {}
    body_start = search(r"^CHAPTER 1 ", 1) or 0
    cur = 0
    for kind, data, key in t.toc:
        if kind == "major":
            pat, frm = "^" + re.escape(_norm(data)), cur
        elif kind in ("chapter", "appendix"):
            pat, frm = "^" + re.escape(_norm(data)[:40]), max(cur, body_start)
        else:
            num, title = data
            pat, frm = re.escape(num) + " " + re.escape(_norm(title)[:30]), max(cur, body_start)
        i = search(pat, frm)
        if i is not None: out[key] = labels[i]; cur = i
    for items, word in ((t.figs, "FIGURE"), (t.tabs, "TABLE")):
        cur = body_start
        for num, cap, key in items:
            i = search(re.escape(_norm(f"{word} {num} {cap}")[:45]), cur)
            if i is not None: out[key] = labels[i]; cur = i
    return out


def build(meta, content, out_path):
    t = Thesis(meta); content(t); t.finish_lists(); t.d.save(out_path)
    pages = _find_pages(out_path, t)
    if pages:
        t2 = Thesis(meta, pages); content(t2); t2.finish_lists(); t2.d.save(out_path)
        missing = [k for _, _, k in t2.toc + t2.figs + t2.tabs if k not in pages]
        if missing: print("WARNING: page not found for", missing)
    else:
        print("LibreOffice/pdftotext not available: page numbers show '?'. "
              "Tell the user to open in Word and press Ctrl+A then F9 to update the TOC and lists.")
    return out_path
```