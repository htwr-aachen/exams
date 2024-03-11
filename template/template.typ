#import "../exam.typ": conf, task, blank


#show: conf.with(
  title: "Klausurprotokoll",
  shortTitle: "HTWR",
  lang: "de",
  chair: "RWTH Chair",
  chairLogo: "assets/htwr.png",
  date: datetime(day: 01, month: 01, year: 2024),
  notices: (
    custom: false,
    time: 120,
    points: 100,
    minPoints: 50,
    other: [
    - Am Ende der Klausur sind die Klausurblätter und evtl. zusätzlich ausgehändigte Blätter abzugeben.
    - Es sind *keine Hilfsmittel* erlaubt. Mobiltelefone sind auszuschalten. Smartwatches sind für die Dauer der Klausur bei der Aufsicht abzugeben.
    - Bitte verwenden Sie keinen roten oder grünen Stift.
    - Legen Sie Ihren Studierendenausweis bereit.
  ])
)


#task(title: "Titel der Aufgabe", points: (5))
== a) (5 Punkte)

Erläutern Sie ob Klausurprotokolle wie dieses hier eine Urheberrechtsverletzung darstellt.

#blank(height: 80%, solution: [
  Keine Ahnung aber es ist allemal besser als die blank abzukopieren.
  Das BMBF schreibt nur:
  #quote(block: true)[
    Ja. Klausuraufgaben (auch Multiple-Choice-Aufgaben) sind in der Regel urheberrechtlich geschützt. Bei Multiple-Choice-Aufgaben liegt die schöpferische Leistung häufig in der Auswahl der falschen Alternativantworten.
  ]

  Weitergehend schreibt es auf die Frage ob für das Studium Aufsätze oder Lehrbücher kopiert werden dürfen:
  #quote(block: true)[
    Ja. Studierende (auch Gasthörerinnen und Gasthörer), Lehrende und Prüfer dürfen bis zu 15 Prozent aus urheberrechtlich geschützten Werken wie Lehrbüchern, Monografien, Tages- und Publikumszeitschriften etc. nutzen.
    Vergriffene Werke, wissenschaftliche Zeitschriftenartikel und Werke mit geringem Umfang dürfen sogar vollständig genutzt werden
  ]
  Ich denke nicht das Klausuren als geringerem Umpfang gelten.

  Wichtig ist hierbei. 
  #quote(block: true)[Bloße Ideen oder Gedanken sind damit nicht urheberrechtlich geschützt]

  Also... Definitions Antworten sind Definitionen und somit per se nicht urheberrechtlich relevant (aus meiner Sicht).
  Multiple Choice Alternativantworten umformulieren oder hinzufügen hilft.
  
  Wenn möglich oder egal eigene Zahlen einfügen und Sätze umschreiben.
  
  Ich würde denken bei keinen exakten Kopien ist das ganze schon deutlich weniger Anfällig auf Urheberrechtliche Konsequenzen.
])

#pagebreak()

#task(title: "Signale", points: (1.5,1.5,0.5, 1.5, 2,5))
a) (1.5 Punkte)
Was bedeutet der Begriff _Latenz_? Geben Sie _zwei Faktoren_ an die eine höhere Latenz zur Folge haben.

- Erklärung:
#blank(lines: 3, solution: [
  Latenz ist die Verzögerung zwischen dem Senden eines Signals auf das Medium vom Sender bis zum Empfangen beim Empfänger. 
])
- Faktor 1:
#blank(lines: 1, solution: [Niedrige Signalgeschwindigkeit])
- Faktor 2:
#blank(lines: 1, solution: [Große Distanzen])

== b) (1.5 Punkte)

Benennen Sie die drei grundlegenden _Modulationsarten_ im _Breitbandverfahren_

#blank(lines:3, solution: [
  Amplituden-, Frequenz- und Phasenmodulation

  *0.5 Punkte pro korrekter Modulationsart. 0.5 Punkte Abzug für falsche Angaben*
])

== c) (0.5 Punkte)

Haben und wenn ja welche Nachteile haben Leitungscodes mit 100% Effizienz

#blank(lines: 2, solution: [Nicht selbsttaktend, nicht Gleichstromfrei])
