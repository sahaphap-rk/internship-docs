#import "config/common.typ": *

#set page(
  width: 29.7cm,
  height: 42cm,
  margin: (top: 1.1cm, bottom: 1.1cm, left: 1.2cm, right: 1.2cm),
  fill: rgb("#f4f8fb"),
)

#set text(
  font: "TH Sarabun New",
  size: 16pt,
  lang: "th",
  fill: rgb("#133247"),
)

#set par(justify: false, leading: 0.78em)
#set list(indent: 1.1em, spacing: 0.22em)

#let navy = rgb("#0f4c81")
#let navy-deep = rgb("#0b355a")
#let sky = rgb("#d8ecf8")
#let sky-soft = rgb("#edf6fc")
#let gold = rgb("#e5a62d")
#let gold-soft = rgb("#fff2d6")
#let ink = rgb("#173244")
#let muted = rgb("#557286")
#let panel = white
#let border = rgb("#d5e5f0")

#let section(title, body, fill: panel, inset: 14pt) = rect(
  width: 100%,
  radius: 14pt,
  fill: fill,
  stroke: 1pt + border,
  inset: inset,
)[
  #text(size: 19pt, weight: "bold", fill: navy-deep)[#title]
  #v(0.14cm)
  #body
]

#let chip(body, fill: sky-soft, color: navy) = rect(
  radius: 999pt,
  fill: fill,
  stroke: none,
  inset: (x: 10pt, y: 4pt),
)[#text(size: 13pt, weight: "bold", fill: color)[#body]]

#let metric(title, detail, fill: sky-soft) = rect(
  width: 100%,
  radius: 12pt,
  fill: fill,
  stroke: none,
  inset: 12pt,
)[
  #text(size: 22pt, weight: "bold", fill: navy)[#title]
  #linebreak()
  #text(size: 14pt, fill: muted)[#detail]
]

#let role-card(title, detail) = rect(
  width: 100%,
  radius: 12pt,
  fill: sky-soft,
  stroke: 1pt + border,
  inset: 12pt,
)[
  #text(size: 18pt, weight: "bold", fill: navy)[#title]
  #v(0.08cm)
  #text(size: 14pt, fill: ink)[#detail]
]

#let tech-card(path, label, fill: white) = rect(
  width: 100%,
  radius: 12pt,
  fill: fill,
  stroke: 1pt + border,
  inset: 10pt,
)[
  #align(center)[
    #image(path, height: 1.4cm, fit: "contain")
    #v(0.08cm)
    #text(size: 13pt, weight: "bold", fill: ink)[#label]
  ]
]

#let process-step(number, title, detail) = rect(
  width: 100%,
  radius: 12pt,
  fill: white,
  stroke: 1pt + border,
  inset: 12pt,
)[
  #grid(
    columns: (auto, 1fr),
    gutter: 10pt,
    align: (center, horizon),
    [
      #rect(
        width: 1cm,
        height: 1cm,
        radius: 999pt,
        fill: navy,
        stroke: none,
      )[
        #align(center + horizon)[#text(size: 14pt, weight: "bold", fill: white)[#number]]
      ]
    ],
    [
      #text(size: 17pt, weight: "bold", fill: navy-deep)[#title]
      #linebreak()
      #text(size: 13pt, fill: muted)[#detail]
    ],
  )
]

#let shot(path, caption) = rect(
  width: 100%,
  radius: 12pt,
  fill: white,
  stroke: 1pt + border,
  inset: 8pt,
)[
  #align(center)[#image(path, width: 100%, height: 4.8cm, fit: "contain")]
  #v(0.1cm)
  #align(center)[#text(size: 13pt, fill: muted)[#caption]]
]

#let bullet(items) = {
  for item in items {
    [• #item]
    linebreak()
  }
}

#rect(
  width: 100%,
  radius: 22pt,
  fill: white,
  stroke: 1pt + rgb("#d9e6ef"),
  inset: 18pt,
)[
  #rect(
    width: 100%,
    radius: 18pt,
    fill: navy,
    stroke: none,
    inset: 20pt,
  )[
    #grid(
      columns: (1.45fr, 0.55fr),
      gutter: 16pt,
      [
        #text(size: 28pt, weight: "bold", fill: white)[โปสเตอร์สรุปผลการปฏิบัติงานสหกิจศึกษา]
        #v(0.06cm)
        #text(size: 24pt, weight: "bold", fill: rgb("#f8fbfd"))[#project_name_th]
        #v(0.14cm)
        #grid(
          columns: (auto, auto, auto),
          gutter: 8pt,
          chip([Full Stack Developer], fill: gold-soft, color: navy-deep),
          chip([MyAcademy / MyHR]),
          chip([ระยะเวลา 17 สัปดาห์]),
        )
        #v(0.14cm)
        #text(size: 15pt, fill: rgb("#d9e9f6"))[
          ผู้จัดทำ: #student_name_th  |  รหัสนิสิต #student_id  |  สถานประกอบการ: #company_name
        ]
      ],
      [
        #align(right + top)[
          #grid(
            rows: (auto, auto),
            gutter: 10pt,
            align: right,
            [#image("images/buu-logo-inter.webp", height: 1.8cm)],
            [#chip([Cooperative Education 2026], fill: rgb("#1b609c"), color: white)],
          )
        ]
      ],
    )
  ]

  #v(0.32cm)
  #grid(
    columns: (1.22fr, 0.78fr),
    gutter: 14pt,
    [
      #section([บทคัดย่อ], [
        แอปพลิเคชันที่พัฒนาคือระบบบริหารจัดการการเรียนรู้ออนไลน์ภายในองค์กร เพื่อสนับสนุนการลงทะเบียนเรียน การอนุมัติคำขอ การมอบหมายหลักสูตร และการสรุปรายงานผลการเรียนรู้ของพนักงาน โดยผู้จัดทำรับผิดชอบทั้งส่วน Frontend และ Backend ในโมดูล Enrollment Management และ Course Reporting รวมถึงงานทดสอบและการเชื่อมต่อบริการจริง เช่น อีเมล พื้นที่จัดเก็บไฟล์ และ background job เพื่อให้รองรับงานที่ใช้เวลาประมวลผลสูงได้อย่างมีประสิทธิภาพ
      ])
    ],
    [
      #section([เป้าหมายของโครงงาน], [
        #bullet((
          [ทำให้การลงทะเบียนเรียนและการอนุมัติมี workflow ที่ชัดเจน],
          [ลดงาน manual ของฝ่ายทรัพยากรบุคคลในการจัดการหลักสูตร],
          [รองรับการออกรายงานและดาวน์โหลดประกาศนียบัตรแบบตรวจสอบความคืบหน้าได้],
          [เพิ่มความถูกต้องและตรวจสอบย้อนหลังได้ของข้อมูลการฝึกอบรม],
        ))
      ], fill: gold-soft)
    ],
  )

  #v(0.22cm)
  #grid(
    columns: (1.18fr, 0.82fr),
    gutter: 14pt,
    [
      #section([ขอบเขตงานที่พัฒนา], [
        #grid(
          columns: (1fr, 1fr),
          gutter: 10pt,
          [
            #text(size: 17pt, weight: "bold", fill: navy)[Enrollment Management]
            #v(0.06cm)
            #bullet((
              [พนักงานเลือกหลักสูตรและส่งคำขอลงทะเบียนเรียน],
              [HR อนุมัติหรือปฏิเสธคำขอได้จากหน้าจอเดียว],
              [HR มอบหมายหลักสูตรให้พนักงานรายบุคคลหรือหลายคน],
              [ระบบส่งอีเมลแจ้งเตือนตามสถานะสำคัญ],
            ))
          ],
          [
            #text(size: 17pt, weight: "bold", fill: navy)[Course Reporting]
            #v(0.06cm)
            #bullet((
              [ส่งออกรายงานหลักสูตรในรูปแบบ CSV],
              [ดาวน์โหลดประกาศนียบัตรหลายรายการเป็นไฟล์ ZIP],
              [ใช้ Redis และ BullMQ สำหรับงานประมวลผลเบื้องหลัง],
              [รองรับการนำข้อมูลไปใช้เป็นหลักฐานการฝึกอบรมขององค์กร],
            ))
          ],
        )
      ])
    ],
    [
      #section([ผู้ใช้งานหลัก], [
        #grid(
          columns: (1fr, 1fr),
          gutter: 8pt,
          role-card([Employee], [เลือกหลักสูตร ส่งคำขอลงทะเบียน และติดตามผลการอนุมัติ]),
          role-card([HR / Admin], [อนุมัติคำขอ มอบหมายหลักสูตร ออกรายงาน และดาวน์โหลด Certificate]),
        )
        #v(0.12cm)
        #grid(
          columns: (1fr, 1fr),
          gutter: 8pt,
          metric([2 โมดูลหลัก], [Enrollment และ Reporting]),
          metric([17 สัปดาห์], [ระยะเวลาปฏิบัติงาน]),
        )
      ], fill: sky-soft)
    ],
  )

  #v(0.22cm)
  #grid(
    columns: (0.92fr, 1.08fr),
    gutter: 14pt,
    [
      #section([เทคโนโลยีและเครื่องมือ], [
        #grid(
          columns: (1fr, 1fr, 1fr, 1fr),
          gutter: 8pt,
          tech-card("images/ch2/angular.webp", [Angular]),
          tech-card("images/ch2/nestjs.webp", [NestJS]),
          tech-card("images/ch2/typescript.webp", [TypeScript]),
          tech-card("images/ch2/knexjs.webp", [Knex]),
          tech-card("images/ch2/redis.png", [Redis]),
          tech-card("images/ch2/bullmq.png", [BullMQ]),
          tech-card("images/ch2/bruno.webp", [Bruno]),
          tech-card("images/ch2/vitest.svg", [Vitest]),
        )
      ])

      #v(0.18cm)
      #section([กระบวนการดำเนินงาน], [
        #grid(
          columns: (1fr, 1fr),
          gutter: 8pt,
          process-step([1], [ศึกษาระบบเดิม], [วิเคราะห์ requirement และ flow การทำงานของ MyHR / MyAcademy]),
          process-step([2], [ออกแบบแนวทางพัฒนา], [กำหนดหน้าจอ API และโครงสร้างข้อมูลที่สอดคล้องกับระบบจริง]),
          process-step([3], [พัฒนาและเชื่อมต่อบริการ], [ลงมือทำทั้ง Frontend และ Backend รวมถึงอีเมลและ storage]),
          process-step([4], [ทดสอบและปรับปรุง], [เขียน API test, unit test และปรับแก้จาก feedback ของทีม]),
        )
      ], fill: rgb("#f7fbfe"))
    ],
    [
      #section([ผลลัพธ์เด่นของระบบ], [
        #grid(
          columns: (1fr, 1fr, 1fr),
          gutter: 8pt,
          shot("images/ch4/enrollment_registration_ui_public_course.png", [หน้าลงทะเบียนเรียนของพนักงาน]),
          shot("images/ch4/enrollment_approval_ui.png", [หน้าจออนุมัติคำขอของ HR]),
          shot("images/ch4/report_ui.png", [หน้าจอรายงานและติดตามการดาวน์โหลด]),
        )
        #v(0.16cm)
        #grid(
          columns: (1fr, 1fr),
          gutter: 10pt,
          [
            #text(size: 17pt, weight: "bold", fill: navy)[ผลที่องค์กรได้รับ]
            #v(0.06cm)
            #bullet((
              [ลดขั้นตอน manual ในการลงทะเบียน อนุมัติ และแจ้งผล],
              [ทำให้การจัดการข้อมูลการอบรมตรวจสอบย้อนหลังได้ง่ายขึ้น],
              [รองรับการดึงรายงานและเอกสารหลักฐานไปใช้งานต่อได้จริง],
            ))
          ],
          [
            #text(size: 17pt, weight: "bold", fill: navy)[สิ่งที่ผู้จัดทำได้รับ]
            #v(0.06cm)
            #bullet((
              [ได้พัฒนาระบบจริงภายใต้ codebase เดิมขององค์กร],
              [ได้เรียนรู้การทำงานร่วมกับทีมพัฒนา QA และ DevOps],
              [ได้ฝึกแนวคิดการออกแบบและทดสอบซอฟต์แวร์ในบริบทการทำงานจริง],
            ))
          ],
        )
      ])
    ],
  )

  #v(0.22cm)
  #grid(
    columns: (1fr, 1fr),
    gutter: 14pt,
    [
      #section([สรุปผลการปฏิบัติงาน], [
        ระบบที่พัฒนาขึ้นช่วยให้องค์กรสามารถบริหารจัดการการเรียนรู้ออนไลน์ได้อย่างเป็นระบบมากขึ้น ทั้งในส่วนของการลงทะเบียน การอนุมัติ การมอบหมายหลักสูตร และการจัดทำรายงาน โดยลดภาระงานที่ต้องทำด้วยตนเองและเพิ่มความพร้อมของข้อมูลสำหรับการนำไปใช้งานจริง
      ], fill: sky-soft)
    ],
    [
      #section([ข้อเสนอแนะ], [
        #bullet((
          [เริ่มจากการทำความเข้าใจบริบทธุรกิจและข้อจำกัดของระบบเดิมก่อนลงมือพัฒนา],
          [ให้ความสำคัญกับการทดสอบและการแบ่งงานเป็นส่วนย่อยเพื่อควบคุมความเสี่ยง],
          [พัฒนาทักษะการสื่อสารกับผู้เกี่ยวข้องหลายบทบาทควบคู่กับทักษะเชิงเทคนิค],
        ))
      ], fill: gold-soft)
    ],
  )
]