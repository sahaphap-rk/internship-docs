#import "config/common.typ": *

#set page(
  width: 33.867cm,
  height: 19.05cm,
  margin: (top: 1.1cm, bottom: 1.1cm, left: 1.3cm, right: 1.3cm),
  fill: rgb("#f4efe6"),
)

#set text(
  font: "TH Sarabun New",
  size: 20pt,
  lang: "th",
  fill: rgb("#1d2a33"),
)

#set par(justify: false, leading: 0.55em)
#set list(indent: 1.2em, spacing: 0.3em)

#let brand = rgb("#123a52")
#let brand-soft = rgb("#d8e4ea")
#let accent = rgb("#d67c2c")
#let accent-soft = rgb("#f4d7bb")
#let panel-fill = rgb("#fffdf9")
#let ink-soft = rgb("#50626d")

#let slide-frame(body) = rect(
  width: 100%,
  height: 100%,
  radius: 16pt,
  fill: panel-fill,
  stroke: 1pt + rgb("#d9e0e3"),
  inset: 20pt,
)[#body]

#let panel(title, body, fill: white) = rect(
  width: 100%,
  radius: 12pt,
  fill: fill,
  stroke: 1pt + rgb("#d8dde0"),
  inset: 16pt,
)[
  #text(size: 19pt, weight: "bold", fill: brand)[#title]
  #v(0.18cm)
  #body
]

#let stat-card(number, label) = rect(
  width: 100%,
  radius: 12pt,
  fill: brand-soft,
  stroke: none,
  inset: 14pt,
)[
  #text(size: 27pt, weight: "bold", fill: brand)[#number]
  #linebreak()
  #text(size: 16pt, fill: ink-soft)[#label]
]

#let image-card(path, height: 5.5cm) = rect(
  width: 100%,
  radius: 12pt,
  fill: white,
  stroke: 1pt + rgb("#d8dde0"),
  inset: 8pt,
)[
  #align(center)[#image(path, height: height, fit: "contain")]
]

#let bullet-list(items) = {
  for item in items {
    [- #item]
  }
}

#let section-slide(title, subtitle: none, body: none) = {
  pagebreak()
  slide-frame([
    #grid(
      columns: (1fr, auto),
      gutter: 12pt,
      [
        #text(size: 29pt, weight: "bold", fill: brand)[#title]
        #if subtitle != none {
          linebreak()
          text(size: 16pt, fill: ink-soft)[#subtitle]
        }
      ],
      [
        #align(right)[
          #context {
            rect(radius: 999pt, fill: accent-soft, inset: (x: 12pt, y: 5pt))[
              #text(size: 15pt, weight: "bold", fill: accent)[#counter(page).display("1")]
            ]
          }
        ]
      ],
    )
    #v(0.2cm)
    #rect(width: 100%, height: 2pt, fill: brand-soft, stroke: none)
    #v(0.35cm)
    #body
  ])
}

#slide-frame([
  #rect(
    width: 100%,
    radius: 16pt,
    fill: brand,
    stroke: none,
    inset: 24pt,
  )[
    #text(size: 34pt, weight: "bold", fill: white)[การนำเสนอผลการปฏิบัติงานสหกิจศึกษา]
    #v(0.15cm)
    #text(size: 24pt, fill: rgb("#e8f0f4"))[#project_name_th]
    #v(0.2cm)
    #text(size: 18pt, fill: rgb("#d4e0e8"))[Cooperative Education Internship Presentation]
  ]

  #v(0.55cm)
  #grid(
    columns: (1.15fr, 0.85fr),
    gutter: 18pt,
    [
      #panel([ข้อมูลผู้นำเสนอ], [
        #table(
          columns: (33%, 67%),
          stroke: none,
          inset: 4pt,
          [ชื่อ - นามสกุล], [#student_name_th],
          [รหัสนิสิต], [#student_id],
          [สาขาวิชา], [วิทยาการคอมพิวเตอร์],
          [สถานประกอบการ], [#company_name],
          [ตำแหน่ง], [Full Stack Developer],
          [ระยะเวลา], [13 พฤศจิกายน 2568 - 13 มีนาคม 2569],
        )
      ])

      #v(0.28cm)
      #panel([หัวข้อการนำเสนอ], [
        #bullet-list((
          [ความเป็นมาและขอบเขตงาน],
          [สถาปัตยกรรมและเทคโนโลยีที่ใช้],
          [ผลงานหลักของ Enrollment Management Module],
          [ผลงานหลักของ Course Reporting Module],
          [ผลลัพธ์ที่ได้รับและบทเรียนจากการฝึกงาน],
        ))
      ], fill: rgb("#fff7ef"))
    ],
    [
      #image-card("images/app/home-menu.png", height: 12cm)
    ],
  )
])

#section-slide(
  [ภาพรวมโครงงาน],
  subtitle: [บริบทขององค์กรและระบบที่ได้รับมอบหมาย],
  body: [
  #grid(
    columns: (1.05fr, 0.95fr),
    gutter: 18pt,
    [
      #panel([องค์กรและบทบาทงาน], [
        #bullet-list((
          [ปฏิบัติงานที่ #company_name ในบทบาท Full Stack Developer],
          [พัฒนาระบบ MyAcademy ภายใต้แพลตฟอร์ม MyHR],
          [ดูแลงานทั้งฝั่ง Frontend และ Backend ตาม requirement ของผู้ใช้งานจริง],
          [ประสานงานกับทีมพัฒนา ทีมทดสอบ และ DevOps ในสภาพแวดล้อมจริงขององค์กร],
        ))
      ])

      #v(0.28cm)
      #panel([ปัญหาทางธุรกิจที่ระบบต้องช่วยแก้], [
        #bullet-list((
          [การลงทะเบียนเรียนและการอนุมัติเดิมต้องการ workflow ที่ชัดเจนและตรวจสอบย้อนหลังได้],
          [HR ต้องการลดงาน manual ในการมอบหมายหลักสูตร แจ้งผล และจัดทำรายงาน],
          [การดาวน์โหลดรายงานและประกาศนียบัตรต้องรองรับข้อมูลจำนวนมากโดยไม่เกิด timeout],
        ))
      ], fill: rgb("#f8fafb"))
    ],
    [
      #panel([ผู้ใช้งานหลักของระบบ], [
        #grid(
          columns: (1fr, 1fr),
          gutter: 12pt,
          stat-card([2 กลุ่ม], [ผู้ใช้งานหลักของระบบ]),
          stat-card([4 เดือน], [ระยะเวลาปฏิบัติงาน]),
          stat-card([17 สัปดาห์], [ช่วงเวลาพัฒนาและส่งมอบ]),
          stat-card([2 โมดูลหลัก], [Enrollment และ Course Reporting]),
        )
        #v(0.35cm)
        #bullet-list((
          [Employee: เลือกคอร์ส ส่งคำขอลงทะเบียน และติดตามผล],
          [HR/Admin: อนุมัติหรือปฏิเสธคำขอ มอบหมายคอร์ส ส่งออกรายงาน และดาวน์โหลด Certificate],
        ))
      ], fill: rgb("#f7fbfc"))
    ],
  )
  ],
)

#section-slide(
  [ขอบเขตงานและผลลัพธ์ที่ต้องส่งมอบ],
  subtitle: [สิ่งที่พัฒนาให้ระบบ MyAcademy ระหว่างการฝึกงาน],
  body: [
  #grid(
    columns: (1fr, 1fr),
    gutter: 18pt,
    [
      #panel([Enrollment Management Module], [
        #bullet-list((
          [พนักงานเลือกหลักสูตรและส่งคำขอลงทะเบียนเรียน],
          [HR ตรวจสอบคำขอและอนุมัติหรือปฏิเสธได้จากหน้าจอเดียว],
          [HR มอบหมายหลักสูตรให้พนักงานได้ทั้งรายคนและหลายคน],
          [ระบบส่งอีเมลแจ้งเตือนอัตโนมัติตามสถานะของคำขอ],
        ))
      ])
    ],
    [
      #panel([Course Reporting Module], [
        #bullet-list((
          [ดาวน์โหลดรายงานหลักสูตรในรูปแบบ CSV],
          [ดาวน์โหลดประกาศนียบัตรหลายรายการเป็นไฟล์ ZIP],
          [ใช้ background job เพื่อติดตาม progress ของงานที่ใช้เวลานาน],
          [รองรับการนำข้อมูลไปใช้เป็นหลักฐานการอบรมขององค์กร],
        ))
      ])
    ],
  )

  #v(0.35cm)
  #panel([ประโยชน์ต่อองค์กร], [
    #grid(
      columns: (1fr, 1fr, 1fr),
      gutter: 12pt,
      stat-card([ลดงาน manual], [การลงทะเบียนและแจ้งผล]),
      stat-card([ตรวจสอบย้อนหลังได้], [สถานะ ผู้ดำเนินการ และผลลัพธ์]),
      stat-card([พร้อมใช้งานจริง], [เชื่อมต่อฐานข้อมูล อีเมล และ storage]),
    )
  ], fill: rgb("#fff8f1"))
  ],
)

#section-slide(
  [สถาปัตยกรรมและเทคโนโลยี],
  subtitle: [โครงสร้างการพัฒนาและเครื่องมือที่ใช้จริงในองค์กร],
  body: [
  #grid(
    columns: (1.05fr, 0.95fr),
    gutter: 18pt,
    [
      #image-card("images/ch3/project_structure_front_back.png", height: 10.2cm)
    ],
    [
      #panel([โครงสร้างระบบ], [
        #bullet-list((
          [โครงการอยู่ในรูปแบบ Monorepo แยก Frontend และ Backend ชัดเจน],
          [Frontend ใช้ Angular สำหรับหน้าจอของผู้ใช้และผู้ดูแลระบบ],
          [Backend ใช้ NestJS และแยกชั้น Controller, Service, Repository],
          [ฐานข้อมูลจัดการผ่าน Knex และ Liquibase Migration],
        ))
      ])

      #v(0.28cm)
      #panel([เทคโนโลยีหลัก], [
        #bullet-list((
          [Angular, Tailwind CSS, NestJS, PostgreSQL],
          [Redis และ BullMQ สำหรับ background job],
          [SendGrid สำหรับอีเมลแจ้งเตือน],
          [Bruno, Mountebank และ Jest สำหรับงานทดสอบ],
        ))
      ], fill: rgb("#f8fafb"))
    ],
  )
  ],
)

#section-slide(
  [กระบวนการพัฒนา],
  subtitle: [แนวทางการทำงานที่ใช้ตลอดช่วงสหกิจศึกษา],
  body: [
  #grid(
    columns: (0.92fr, 1.08fr),
    gutter: 18pt,
    [
      #panel([วิธีทำงาน], [
        #bullet-list((
          [ศึกษาระบบเดิมและทำความเข้าใจ requirement ร่วมกับ stakeholder],
          [ออกแบบ Blueprint เพื่อเชื่อม scenario กับองค์ประกอบเชิงเทคนิค],
          [วางแผนงานแบบ Sprint 1-2 สัปดาห์ และสื่อสารผ่าน Daily Sync],
          [ส่งงานเป็น Small PR เพื่อรีวิวและลดความเสี่ยงจากการ merge],
        ))
      ])

      #v(0.28cm)
      #panel([คุณภาพซอฟต์แวร์], [
        #bullet-list((
          [ออกแบบ API test ตาม acceptance criteria ก่อนลงมือพัฒนา],
          [ทำ mock/stub สำหรับบริการที่ยังไม่พร้อม],
          [เพิ่ม unit test ในส่วน business logic ที่สำคัญ],
        ))
      ], fill: rgb("#fff8f1"))
    ],
    [
      #image-card("images/ch3/calendar_task_week.png", height: 5.3cm)
      #v(0.24cm)
      #image-card("images/ch3/test_api_result.png", height: 4.6cm)
    ],
  )
  ],
)

#section-slide(
  [ผลงานหลัก: Enrollment Management],
  subtitle: [จัดการการลงทะเบียน อนุมัติ และมอบหมายหลักสูตร],
  body: [
  #grid(
    columns: (1fr, 1fr),
    gutter: 18pt,
    [
      #panel([ความสามารถหลัก], [
        #bullet-list((
          [Registration: พนักงานดูรายละเอียดหลักสูตรและส่งคำขอลงทะเบียน],
          [Approval: HR อนุมัติหรือปฏิเสธคำขอ พร้อมส่งอีเมลแจ้งผล],
          [Assignment: HR มอบหมายหลักสูตรให้พนักงานได้แบบรายคนหรือหลายคน],
          [รองรับการติดตามสถานะ เช่น PENDING, APPROVED และ REJECTED],
        ))
      ])

      #v(0.28cm)
      #panel([ผลลัพธ์เชิงธุรกิจ], [
        #bullet-list((
          [ลดขั้นตอนการประสานงานแบบ manual ระหว่างพนักงานกับ HR],
          [ทำให้กระบวนการลงทะเบียนเรียนมี workflow ที่ตรวจสอบได้],
          [ช่วยให้องค์กรกำหนดคอร์สบังคับและติดตามการเข้าร่วมได้ง่ายขึ้น],
        ))
      ], fill: rgb("#f8fafb"))
    ],
    [
      #image-card("images/ch4/enrollment_approval_ui.png", height: 5.2cm)
      #v(0.24cm)
      #image-card("images/ch4/enrollment_assignment_ui.png", height: 5.2cm)
    ],
  )
  ],
)

#section-slide(
  [ตัวอย่างหน้าจอ Enrollment],
  subtitle: [ภาพรวมการใช้งานจริงของพนักงานและ HR],
  body: [
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 14pt,
    [
      #image-card("images/ch4/enrollment_registration_ui_public_course.png", height: 4.6cm)
      #v(0.12cm)
      #text(size: 16pt, fill: ink-soft)[หน้ารายการหลักสูตรที่เปิดให้ลงทะเบียน]
    ],
    [
      #image-card("images/ch4/enrollment_registration_ui_course_detail.png", height: 4.6cm)
      #v(0.12cm)
      #text(size: 16pt, fill: ink-soft)[หน้ารายละเอียดหลักสูตรพร้อมปุ่มขอลงทะเบียน]
    ],
    [
      #image-card("images/ch4/enrollment_approval_email_approve.png", height: 4.6cm)
      #v(0.12cm)
      #text(size: 16pt, fill: ink-soft)[อีเมลแจ้งผลเมื่อคำขอได้รับการอนุมัติ]
    ],
  )

  #v(0.35cm)
  #panel([จุดเด่นของงานส่วนนี้], [
    #bullet-list((
      [เชื่อมต่อ UI, API, Database และ Mail Service เข้าด้วยกันครบ flow],
      [ออกแบบให้รองรับการตรวจสอบย้อนหลังและลดความผิดพลาดจากการจัดการด้วยมือ],
      [สอดคล้องกับโครงสร้างระบบเดิมขององค์กรโดยไม่กระทบโมดูลอื่น],
    ))
  ], fill: rgb("#fff8f1"))
  ],
)

#section-slide(
  [ผลงานหลัก: Course Reporting Module],
  subtitle: [ส่งออกรายงาน CSV และดาวน์โหลด Certificate แบบ background job],
  body: [
  #grid(
    columns: (0.95fr, 1.05fr),
    gutter: 18pt,
    [
      #panel([ความสามารถหลัก], [
        #bullet-list((
          [ผู้ดูแลเลือกรายงานของหลักสูตรที่ต้องการติดตาม],
          [ดาวน์โหลดข้อมูลผู้เรียนออกเป็นไฟล์ CSV ได้ทันที],
          [เลือกผู้เรียนหลายคนเพื่อดาวน์โหลด Certificate รวมเป็น ZIP],
          [ติดตามสถานะงานผ่าน jobId และ progress บนหน้าจอ],
        ))
      ])

      #v(0.28cm)
      #panel([เหตุผลที่ใช้ Background Job], [
        #bullet-list((
          [ลดความเสี่ยงจาก timeout เมื่อต้องรวมไฟล์จำนวนมาก],
          [ทำให้ผู้ใช้เห็นความคืบหน้าของงานแบบต่อเนื่อง],
          [เพิ่มความทนทานของระบบเมื่อรองรับคำขอดาวน์โหลดหลายรายการ],
        ))
      ], fill: rgb("#f8fafb"))
    ],
    [
      #image-card("images/ch4/report_course_ui_cert.png", height: 5.2cm)
      #v(0.24cm)
      #image-card("images/ch4/report_csv_file.png", height: 4.9cm)
    ],
  )
  ],
)

#section-slide(
  [การทดสอบและความถูกต้องของระบบ],
  subtitle: [แนวทางที่ใช้ยืนยันว่าฟังก์ชันทำงานได้จริง],
  body: [
  #grid(
    columns: (1fr, 1fr),
    gutter: 18pt,
    [
      #panel([ระดับการทดสอบ], [
        #bullet-list((
          [API Test ด้วย Bruno เพื่อตรวจสอบ contract และลำดับการทำงาน end-to-end],
          [Mock/Stub ด้วย Mountebank เพื่อทำให้การทดสอบทำซ้ำได้],
          [Unit Test ด้วย Jest สำหรับ service ที่มี business logic สำคัญ],
          [Manual Test บนหน้าจอจริงเพื่อยืนยันประสบการณ์ใช้งาน],
        ))
      ])
    ],
    [
      #image-card("images/ch3/test_api_code.png", height: 5.2cm)
      #v(0.24cm)
      #image-card("images/ch3/test_unit.png", height: 2.1cm)
    ],
  )

  #v(0.32cm)
  #panel([ผลที่ได้จากการทดสอบ], [
    #grid(
      columns: (1fr, 1fr, 1fr),
      gutter: 12pt,
      stat-card([API ผ่าน], [ตาม acceptance criteria]),
      stat-card([Logic ชัดเจน], [ตรวจสอบได้ในระดับ service]),
      stat-card([พร้อมรีวิว], [สอดคล้องกับแนวทาง Small PR]),
    )
  ], fill: rgb("#fff8f1"))
  ],
)

#section-slide(
  [ผลลัพธ์ที่ได้รับ],
  subtitle: [สิ่งที่องค์กรและผู้ปฏิบัติงานได้รับจากโครงงานนี้],
  body: [
  #grid(
    columns: (1fr, 1fr),
    gutter: 18pt,
    [
      #panel([ประโยชน์ที่องค์กรได้รับ], [
        #bullet-list((
          [มีระบบลงทะเบียนและอนุมัติการเรียนรู้ที่เป็นมาตรฐานมากขึ้น],
          [สามารถส่งออกรายงานและประกาศนียบัตรได้สะดวกและตรวจสอบย้อนหลังได้],
          [ลดภาระงาน manual ของ HR ด้วย workflow และอีเมลแจ้งเตือนอัตโนมัติ],
        ))
      ])
    ],
    [
      #panel([สิ่งที่ได้รับจากการฝึกงาน], [
        #bullet-list((
          [เรียนรู้การทำงานบน legacy codebase และระบบจริงขององค์กร],
          [พัฒนาทักษะ Full Stack, การทดสอบระบบ, และการออกแบบสถาปัตยกรรม],
          [เข้าใจกระบวนการทำงานร่วมกับ Developer, QA และ DevOps มากขึ้น],
          [ฝึกการสื่อสาร การแบ่งงาน และการรีวิวโค้ดในทีม],
        ))
      ], fill: rgb("#f8fafb"))
    ],
  )

  #v(0.35cm)
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 12pt,
    stat-card([Full Stack], [บทบาทที่ปฏิบัติจริง]),
    stat-card([2 โมดูล], [ผลงานหลักที่รับผิดชอบ]),
    stat-card([พร้อมต่อยอด], [ใช้งานจริงในบริบทอดค์กร]),
  )
  ],
)

#section-slide(
  [ปัญหา อุปสรรค และบทเรียน],
  subtitle: [ประเด็นสำคัญที่พบระหว่างการทำงานจริง],
  body: [
  #grid(
    columns: (1fr, 1fr),
    gutter: 18pt,
    [
      #panel([อุปสรรคที่พบ], [
        #bullet-list((
          [ต้องใช้เวลาในการทำความเข้าใจระบบเดิมและข้อจำกัดของ legacy codebase],
          [มีความเสี่ยงจากการ merge และการเปลี่ยนแปลงร่วมกับหลายทีม],
          [บางปัญหาเกี่ยวข้องกับสิทธิ์และสภาพแวดล้อมจริง ซึ่งต้องประสานกับ DevOps],
          [ต้องบริหารเวลาให้ทันกับ requirement และรอบการส่งมอบของทีม],
        ))
      ])
    ],
    [
      #panel([บทเรียนที่สำคัญ], [
        #bullet-list((
          [การเข้าใจ business context สำคัญไม่แพ้การเขียนโค้ด],
          [การออกแบบ test ตั้งแต่ต้นช่วยลดการย้อนแก้และทำให้ requirement ชัดขึ้น],
          [Small PR และการสื่อสารสม่ำเสมอช่วยลดความเสี่ยงในระบบจริง],
          [การทำงานในองค์กรต้องอาศัยทั้งทักษะเทคนิคและการประสานงานข้ามทีม],
        ))
      ], fill: rgb("#fff8f1"))
    ],
  )
  ],
)

#section-slide(
  [สรุป],
  subtitle: [ภาพรวมของผลการปฏิบัติงานสหกิจศึกษา],
  body: [
  #panel([สรุปสาระสำคัญ], [
    #bullet-list((
      [พัฒนาระบบ MyAcademy ให้รองรับการลงทะเบียน การอนุมัติ การมอบหมายคอร์ส และการรายงานผลได้ครบ flow],
      [เชื่อมงานฝั่ง UI, API, Database, Mail Service และ Background Job เข้าด้วยกันในบริบทของระบบจริง],
      [ช่วยให้องค์กรลดงาน manual เพิ่มความถูกต้อง และใช้งานข้อมูลการอบรมได้เป็นระบบมากขึ้น],
      [ได้รับประสบการณ์ตรงด้านการพัฒนาซอฟต์แวร์ในองค์กร ทั้งเชิงเทคนิค กระบวนการ และการทำงานร่วมกับทีม],
    ))
  ])

  #v(0.6cm)
  #align(center)[
    #rect(radius: 16pt, fill: brand, stroke: none, inset: (x: 30pt, y: 18pt))[
      #text(size: 32pt, weight: "bold", fill: white)[ขอบคุณครับ]
      #linebreak()
      #text(size: 20pt, fill: rgb("#d4e0e8"))[Questions and Answers]
    ]
  ]
  ],
)