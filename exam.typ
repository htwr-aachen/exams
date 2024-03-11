#let sansFont = "Latin Modern Sans"

#let lineField(label: "", length: auto) = {
  h(12pt)
  block(
    breakable: false,
    stack(
      dir: ttb, 
      spacing: 5pt, {
        line(length: length, stroke: 1pt+black)
      }, 
      if label != "" [
        #set align(center) 
        #label
      ]
    )
  )
}


#let conf(
  title: none,
  shortTitle: none,
  chair: "",
  chairLogo: "",
  lang: "de",
  date: none,
  isSol: false,
  semester: "WS",
  number: 1,
  notices: (
    //if custom is true then only the heading and other notices are displayed.
    custom: false,
    time: 120,
    points: 100,
    minPoints: 50,
    other: []
  ),
  doc,
) = {

  set document(title: str(title))
  
  //-------- SETUP --------
  if date == none { date = datetime.today()}
  let dateYear = int(date.display("[year]"))
  let dateYearString = if semester == "WS" [#{dateYear - 1}/#dateYear] else [text(dateYear)]

  let total_pages = locate(loc=>counter(page).final(loc).at(0) - 2)
  let total_tasks = locate(loc => counter(heading).final(loc).at(0))

  let header = locate(loc => if loc.page() == 1 {
      grid(columns: (100pt, 1fr, 100pt), [
        #set align(left)
        #image("assets/htwr.svg", height: 22pt, width: 100pt, fit: "contain")
      ], 
      [
        #set align(center)
        #title
      ], [
        #set align(right)
        #if chairLogo == "" {
          chair
        } else {
          image(chairLogo, height: 22pt, width: 100pt, alt: chair, fit: "contain")
        }
        
      ])
      line(length: 100%, stroke: 0.1pt + black)
      h(10pt)
    } else {
      grid(
        columns: (1fr,1fr, 1fr), 
        [
          Name: Fick, Adolf
        ],
        [
          #set align(center)
          #link("https://htwr-aachen.de/exams/template")[HTWR Klausurprotokoll]
        ],
        [
          #set align(right)
          Matr.Nr.: 69420
        ]
      )
      line(length: 100%, stroke: 0.1pt + black)
      h(10pt)
    })
 
  set page(
    numbering: "1",
    paper: "a4",
    header: header,
    footer: locate(loc => if loc.page() != 1 {
      grid(columns: (1fr, auto), [
        #title #semester #dateYearString #if isSol [Lösung] 
      ], [#if lang=="de" [Seite] else [Page] #counter(page).display("1")])
    })
  )


  set text(size: 11pt, lang: lang, font: ("Latin Modern"), fallback: true)
  set block(below: 1.05em)

  show link: it => [
    #text(fill: rgb("#013220"), underline(it))
  ]

  set list()  
  
  // ------- Page content --------
  set align(center)

  stack(
    spacing: 15pt,
    text(font: "Latin Modern Mono", {
      link("https://htwr-aachen.de/exams")[htwr-aachen.de/exams]
    }),
    text(22pt, font: sansFont, hyphenate: false, strong([#number. #if lang=="de" [Klausur] else [Exam] #semester #dateYearString ])),
    text(16pt, date.display("[day].[month].[year]")),
  )

  h(10pt)

  box(width: 100%, 
    stroke: (paint: black, thickness: 0.2pt, ), 
    inset: 8pt, {
      set text(size: 12pt)

      grid(
        columns: (auto,1fr,1fr,1fr), 
        rows: (auto,auto), 
        gutter: 5pt,
        [Name:], [#lineField(length: 100%)], [Vorname:], [#lineField(length: 100%)],
        [Matr.Nr.:], [#lineField(length: 100%)], [Klausurprotokoll:], [keine Garantie])
      
      grid(
        columns: (auto,1fr), 
        rows: (auto,auto), 
        gutter: 5pt,
        [Studiengang.:], [#lineField(length: 100%)])
  })  
  
  h(10pt)

  set align(left)

  show heading: it => {
    block(above: 1.2em, below: 1.25em, it.body)
  }

  // ------ SHOW notices --------- 
  [
    = Hinweise (und Informationen)
    #if notices.custom == false [
      - Die Klausur besteht aus *#total_tasks Aufgaben auf #total_pages Seiten* + *2* Seiten für Notizen
      - Die Bearbeitungszeit beträgt *#notices.time Minuten*.
      - Die Klausur umfasst *#notices.points* Punkte. Zum Bestehen genügen *#notices.minPoints* Punkte.
    ]

    #notices.other
  ]
  
  block(height: 1pt)

  [
    Ich habe die oben genannten Hinweise zur Kenntnis genommen. Ferner bestätige ich mit meiner Unterschrift, dass ich mich gesund genug fühle, an der Klausur teilzunehmen und dass ich die Aufgaben selbstständig bearbeitet habe.
    
    #block(height: 15pt)
    
    #set align(center)

    #lineField(length: 30%, label: "Unterschrift")
  ]

  //The 
  set par(leading: 0.65em)
  set heading(numbering: "1.a")

  set quote(quotes: true, block: true)

  show heading.where(
    level: 1
  ): it => block()

  show heading.where(
    level: 2
  ): it => text(
    size: 11pt,
    weight: "regular",
    style: "italic",
    it.body,
  ) + []

  show par: set block(spacing: 1.25em)
  
  pagebreak()

  doc

  pagebreak(weak: false)
  pagebreak(weak: false)
}

#let colorbox(
  title: "title",
  bgColor: luma(220),
  strokeColor: luma(70),
  titleTextColor: luma(255),
  textColor: luma(0),
  radius: 3pt,
  width: 100%,
  breakable: false,
  body
) = {

  let titleCell = rect.with(
    inset: 8pt,
    fill: strokeColor,
    width: 100%,
    radius: (top: radius)
  )

  let contentCell = rect.with(
    inset: 8pt,
    fill: bgColor,
    radius: (bottom: radius),
    width: 100%,
  )
  
  return block(
    breakable: breakable,
    grid(
      columns: 1fr,
      rows: (auto, auto),
      titleCell(height: auto)[#text(font: sansFont ,fill: titleTextColor, weight: "semibold")[#title]],
      contentCell(height: auto)[ 
        #set text(textColor)
        #body
      ]
    )
  )
}

#let sidenote(
  title: "title",
  titleTextColor: luma(255),
  textColor: luma(0),
  radius: 3pt,
  width: 100%,
  prefix: "Sidenote: ",
  body) = {
    colorbox(
      title: prefix + title,
      bgColor: rgb(177, 177, 177, 75),
      strokeColor: rgb(55, 55, 55),
    )[#body]
}

#let ComplexityProblem = content => {
  set text(font: "New Computer Modern") 
  smallcaps(content)
}

#let ComplexityClass = content => {
  set text(font: "New Computer Modern Sans") 
  content
}

#let task(title: [], points: none) = {
  heading(level: 1, title)
  let string = "("
  
  if type(points) == int {points = (points,)}

  let sum = 0
  for value in points {
    sum += value
  }

  set text(size: 13pt, weight: "bold")
  grid(
    columns: (1fr, auto),
    block(
      above: 1.15em, 
      below: 1.25em, 
      [
        Aufgabe #counter(heading).display() (#title)
      ]
    ),
    [
      #set align(left)

      #if points.len() > 1 [(#points.map(x=> str(x)).join("+")) = ] #sum
    ]
  )
}

#let blank(lines: 1, height: none, fill: false, solution: []) = {
  let lineHeight = 25pt
  let calcHeight = if height != none {height} else {lines * lineHeight}

  if fill {
    rect(
      stroke: 0.5pt + black, 
      inset: 8pt, 
      width: 100%, 
      [Lösung: #solution])
  }else {
    rect(
      stroke: 0.5pt + black, 
      height: calcHeight, 
      inset: 8pt, 
      width: 100%, 
      if solution != [] [
        *Lösung:* #solution
      ])
  }
}
