#import "@preview/fletcher:0.5.6" as fletcher: diagram, edge, node

= บทที่ 3 \ วิธีการดำเนินงานสหกิจศึกษา

บทนี้กล่าวถึงรายละเอียดการปฏิบัติงานภายใต้โครงงานสหกิจศึกษา ซึ่งครอบคลุมกระบวนการพัฒนาระบบ โดยแต่ละระบบมีขอบเขตและรูปแบบการดำเนินงานที่แตกต่างกัน

กระบวนการทำงานหลักที่ใช้ ได้แก่:

- การวิเคราะห์และทำความเข้าใจความต้องการของผู้ใช้งาน
- การออกแบบ UI/UX และการพัฒนา Frontend
- การพัฒนา Backend และการจัดการฐานข้อมูล
- การทดสอบ (Unit/Integration) และการ Deploy

== 3.1 การเลือกใช้เทคโนโลยีและเครื่องมือ (Tools & Technologies)

ในการพัฒนาระบบ MyHR ได้มีการเลือกใช้เทคโนโลยีและเครื่องมือสมัยใหม่เพื่อให้เกิดประสิทธิภาพสูงสุดในการทำงานแบบ Monorepo (รวมทั้ง Frontend, Backend และ Tests ไว้ใน Repository เดียว) โดยมีรายละเอียดดังนี้:

=== 3.1.1 การจัดการโปรเจ็กต์ด้วย Taskfile และ pnpm
- *Taskfile*: ใช้แทน Makefile ดั้งเดิม เพื่อการทำงานข้ามแพลตฟอร์ม (Cross-Platform) ที่ดีขึ้น รองรับรูปแบบการเขียนด้วย YAML ทำให้อ่านง่าย และสามารถจัดเตรียมคำสั่งแบบขนาน (Parallel Execution) ได้อย่างมีประสิทธิภาพ เช่น คำสั่ง `task init` หรือ `task dev`
- *pnpm*: ใช้เป็น Package Manager หลักเนื่องจากมีความเร็วในการติดตั้งสูง ประหยัดพื้นที่ดิสก์อย่างมาก (ผ่านระบบ Hard Links/Symlinks ไปส่วนกลาง) และสนับสนุนการทำงานกับโครงสร้างแบบ Workspace ได้อย่างยอดเยี่ยม หมดปัญหาเรื่อง Phantom Dependencies

=== 3.1.2 การควบคุมคุณภาพและกระบวนการทำงานด้วย Husky
มีการใช้ Husky ในการสร้าง Git Hooks เพื่อตรวจสอบคุณภาพโค้ดแบบอัตโนมัติ:
- *Pre-commit*: ทำงานร่วมกับ `lint-staged` เพื่อรัน ESLint และ Prettier เฉพาะไฟล์ที่ถูกเปลี่ยนแปลง ทำให้โค้ดตรงตามมาตรฐานโดยอัตโนมัติและไม่เสียเวลาตรวจสอบทั้งโปรเจ็กต์
- *Pre-push*: บังคับรัน Task ของการทดสอบ (`test-all`) และการบิวด์ (`build-all`) หากมีส่วนอัปเดตที่ไม่ผ่านเกณฑ์ จะไม่สามารถส่งขึ้น Repository (Git Push) ได้ ป้องกัน Build พัง

=== 3.1.3 ประสิทธิภาพในการทดสอบ (Faster Testing Environments)
- *SWC และ Vitest*: ได้ถูกนำมาใช้แทน Jest และ Babel ในฝั่ง Backend เพื่อแก้ปัญหาความล่าช้าในการจับคู่ไฟล์ (Compilation) ส่งผลให้การพัฒนาและการรัน Unit Test ไวขึ้นถึง 10 เท่า ใช้หน่วยความจำลดลง และรองรับ Native ESM อย่างเต็มตัว
- *Mountebank (Merge JSON Strategy)*: นำมาใช้จำลอง API (Mock Server) โดยออกแบบให้แยกไฟล์ตามแต่ละฟังก์ชันการทำงานส่วนย่อย (เช่น auth, employees) แล้วทำกระบวนการอัตโนมัติรวบรวมเป็นไฟล์เดียว ทำให้โครงสร้างการดูแลง่ายและแก้ไขโค้ดร่วมกันโดยไม่ชนกัน
- *Bruno (collection.bru)*: เครื่องมือสำหรับทดสอบ API โดยมีการนำ Centralized Data Definition มาใช้รวบรวมตัวแปรหลัก เช่น Token หรือ User ID ไว้ที่เดียว ช่วยลดความซ้ำซ้อนของการกำหนดค่าตั้งต้นสำหรับแต่ละการทดสอบ

== 3.2 รูปแบบการพัฒนาซอฟต์แวร์ด้วยแนวคิด Scrum และ eXtreme Programming (XP)

ในการพัฒนาระบบ MyHR ได้มีการประยุกต์ใช้ระเบียบวิธีแบบ Agile โดยผสมผสานระหว่าง *Scrum* และ *eXtreme Programming (XP)* เพื่อให้การทำงานมีความคล่องตัวและได้ซอฟต์แวร์ที่มีคุณภาพสูง:

=== 3.2.1 การประยุกต์ใช้ Scrum
- *Sprint Planning & Daily Stand-up*: มีการวางแผนงานเป็นรอบ (Sprint) เพื่อให้เห็นเป้าหมายที่ชัดเจน และมีการติดตามความคืบหน้า รวมถึงปัญหาที่พบในแต่ละวัน
- *Iterative Delivery*: เน้นการส่งมอบซอฟต์แวร์ที่พัฒนาได้ในแต่ละรอบของ Sprint เพื่อให้พร้อมใช้งานและนำข้อเสนอแนะกลับมาปรับปรุงได้อย่างรวดเร็ว

=== 3.2.2 การประยุกต์ใช้ eXtreme Programming (XP)
- *Test-Driven Development (TDD)*: ให้ความสำคัญกับ Automated Testing ทั้ง Unit Test, Integration Test และ E2E Test เสมอ
- *Continuous Integration / Continuous Deployment (CI/CD)*: มีการนำ Husky เข้ามาช่วยในการตรวจสอบ (Lint, Test, Build) เป็นขั้นแรก และรวมโค้ดบ่อยๆ
- *Refactoring & Code Standards*: ควบคุมมาตรฐานโค้ดอย่างสม่ำเสมอ และมีการตรวจสอบรูปแบบให้ตรงกัน (Code Formatting) ด้วย ESLint และ Prettier

== 3.3 แผนภาพแสดงสถาปัตยกรรมกระบวนการ (Architecture & Workflow Diagram)

เพื่อให้สามารถทำความเข้าใจโครงสร้างและวิถีการทำงานของ MyHR ได้ดียิ่งขึ้น แผนภาพด้านล่างแสดงถึงขั้นตอนของ Git Lifecycle และการปรับใช้โครงสร้างแบบ Monorepo Workspace:

#align(center)[
  #figure(
    caption: [ขั้นตอน Git Hooks อัตโนมัติด้วย Husky],
    diagram(
      node-stroke: 1pt,
      edge-stroke: 1pt,
      node((0, 0), [ผู้พัฒนา\ (Developer)], corner-radius: 5pt),
      edge("-|>"),
      node((0, 1), [git commit], corner-radius: 5pt),
      edge("-|>"),
      node((0, 2), [Husky: pre-commit\ (lint & format)], corner-radius: 5pt, stroke: blue),
      edge("-|>"),
      node((0, 3), [git push], corner-radius: 5pt),
      edge("-|>"),
      node((0, 4), [Husky: pre-push\ (test & build)], corner-radius: 5pt, stroke: blue),
      edge("-|>"),
      node((0, 5), [Git Repository], corner-radius: 5pt, fill: green.lighten(80%)),
    ),
  )
]

#align(center)[
  #figure(
    caption: [การทำงานแบบ Monorepo และเครื่องมือการทดสอบ],
    diagram(
      node-stroke: 1pt,
      edge-stroke: 1pt,
      node((0, 0), [pnpm Workspace], corner-radius: 5pt, fill: orange.lighten(80%)),
      edge((0, 0), (0, 1), "-|>", [แชร์ไลบรารี]),
      node((0, 1), [Backend\ (NestJS)], corner-radius: 5pt),
      edge((0, 1), (1, 1), "<|-|>", [API Testing\ (Bruno / Mountebank)]),
      node((1, 1), [API / E2E Tests], corner-radius: 5pt),
      edge((0, 1), (0, 2), "-|>", [SWC + Vitest]),
      node((0, 2), [Unit Tests], corner-radius: 5pt, fill: green.lighten(80%)),
      edge((0, 0), (-1, 1), "-|>", [แชร์ไลบรารี]),
      node((-1, 1), [Frontend\ (Angular)], corner-radius: 5pt),
    ),
  )
]
