#let outline-title = state("outline-title", none)

#outline-title.update("สารบัญตาราง")
#outline(
  title: "สารบัญตาราง",
  target: figure.where(kind: table),
  indent: 2em,
)
#outline-title.update(none)
