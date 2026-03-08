// ตั้งค่า Font และกระดาษ
#set text(font: "TH Sarabun New", size: 16pt, lang: "th", style: "normal", weight: "regular")
#show raw: set text(font: "TH Sarabun New", size: 16pt)
#set page(paper: "a4", margin: (top: 2.5cm, bottom: 2.5cm, left: 3cm, right: 2.5cm))

// สถานะสำหรับชื่อสารบัญในหน้าถัดไป
#let outline-title = state("outline-title", none)

// ฟังก์ชันเลขหน้าแบบอักษรไทย (ก ข ค ...)
#let thai-letters = (
  "ก", "ข", "ค", "ง", "จ", "ฉ", "ช"
)

#let thai-page-number(n) = {
  let base = thai-letters.len()
  if n <= 0 { "" }
  else if n <= base { thai-letters.at(n - 1) }
  else {
    let q = calc.floor((n - 1) / base)
    let r = calc.rem(n - 1, base)
    thai-page-number(q) + thai-letters.at(r)
  }
}

// ฟังก์ชันสำหรับเช็คว่ามีหัวข้อระดับ 1 ในหน้าปัจจุบันหรือไม่
#let has-level1-heading() = {
  query(heading.where(level: 1)).any(it => it.location().page() == here().page())
}

// ตั้งค่าการย่อหน้า (Indentation) และการจัดการพารากราฟ
#set par(
  first-line-indent: 1cm, // กำหนดระยะย่อหน้า 1 ซม. (ประมาณ 1 Tab)
  justify: false,
  leading: 0.65em, // ระยะห่างระหว่างบรรทัดในพารากราฟ
)

// บังคับให้พารากราฟที่ไม่พอในหน้าเดียวขยับไปหน้าใหม่ (Keep together)
// หมายเหตุ: หากพารากราฟยาวมากเกินกว่าหนึ่งหน้า จะทำให้เกิดปัญหากระดาษว่าง
#show par: set block(breakable: false)

// บังคับให้ย่อหน้าในพารากราฟแรกหลังหัวข้อด้วย — ลดช่องว่างแนวตั้งลง
#show heading: it => {
  it
  par(spacing: 0em, leading: 0em, text(size: 0pt, ""))
  v(-0.8em)
}

// การตั้งค่าภาพ (Figure)
#set figure(
  supplement: [ภาพที่],
  numbering: it => {
    let ch = counter("chapter").get().first()
    str(ch) + "-" + str(it)
  },
)

// การตั้งค่าตาราง (Table Figure)
#show figure.where(kind: table): set figure(
  supplement: [ตารางที่],
  numbering: it => {
    let ch = counter("chapter").get().first()
    str(ch) + "-" + str(it)
  },
)
// ตั้งค่า Caption ของ Table Figure
#show figure.where(kind: table): set figure.caption(position: top)
#show figure.caption.where(kind: table): set align(left)

// การตั้งค่าหัวข้อ
#show heading.where(level: 1): it => {
  counter(figure.where(kind: image)).update(0)
  counter(figure.where(kind: table)).update(0)
  set align(center)
  set text(size: 18pt, weight: "bold")
  if it.numbering != none {
    [บทที่ #counter(heading).display() \ #it.body]
  } else {
    it.body
  }
  v(1em)
}

#show heading.where(level: 2): it => {
  set text(size: 16pt)
  it
}

#show heading.where(level: 3): it => {
  set text(size: 16pt)
  it
}

// การจัดการลิสต์ให้ไม่มีการย่อหน้าแบบพารากราฟ
#show list: set par(first-line-indent: 0pt)
#show enum: set par(first-line-indent: 0pt)
#show table: set par(first-line-indent: 0pt)

// หน้าปก
#include "chapters/cover-th.typ"
#pagebreak()
#include "chapters/cover-en.typ"
#pagebreak()

// ส่วนหน้า (Front Matter) - ใช้เลขหน้าแบบอักษรไทย (ก, ข, ค, ...)
#set page(
  numbering: thai-page-number,
  background: none,
  footer: none,
  header: context {
    let title = outline-title.get()
    grid(
      columns: (1fr, auto, 1fr),
      [],
      if title != none and not has-level1-heading() {
        align(center, text(size: 18pt, weight: "bold")[#title (ต่อ)])
      } else { [] },
      align(right, counter(page).display()),
    )
  },
)
#{
  set page(numbering: none, header: none, footer: none)
  include "chapters/certificate.typ"
  counter(page).update(1)
}
#pagebreak()
#include "chapters/ack.typ"
#pagebreak()
#include "chapters/abstract.typ"
#pagebreak()

// สารบัญ
#outline-title.update("สารบัญ")
#outline(title: "สารบัญ", indent: 2em)
#outline-title.update(none)
#pagebreak()

#include "chapters/list-of-figures.typ"
#pagebreak()

#include "chapters/list-of-tables.typ"
#pagebreak()

// เนื้อหาหลัก (Main Content) - ใช้เลขหน้าแบบอารบิก (1, 2, 3)
#set page(
  numbering: "1",
  footer: none,
  header: context align(right, counter(page).display()),
)
#counter(page).update(1)

#set heading(numbering: "1.1")
#counter("chapter").update(1)
#include "chapters/ch01_intro.typ"
#pagebreak()
#counter("chapter").step()
#include "chapters/ch02_theory.typ"
#pagebreak()
#counter("chapter").step()
#include "chapters/ch03_method.typ"
#pagebreak()
#counter("chapter").step()
#include "chapters/ch04_result.typ"
#pagebreak()
#counter("chapter").step()
#include "chapters/ch05_summary.typ"
#pagebreak()

// ส่วนหลัง (Back Matter)
#include "chapters/bibliography.typ"
#pagebreak()
#include "chapters/appendix.typ"
#pagebreak()
#include "chapters/biography.typ"
