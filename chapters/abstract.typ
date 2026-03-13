#import "../config/common.typ": *

#table(
  columns: (auto, 1fr),
  stroke: none,
  [*หัวข้อรายงาน*], [#project_name_th],
  [*นิสิต*], [นาย #student_name_th],
  [*รหัสประจำตัว*], [#student_id],
  [*อาจารย์ที่ปรึกษา*], [ผู้ช่วยศาสตราจารย์ เบญจภรณ์ จันทรกองกุล],
  [*ระดับการศึกษา*], [วิทยาศาสตรบัณฑิต สาขาวิชาวิทยาการคอมพิวเตอร์],
  [*คณะ*], [วิทยาการสารสนเทศ มหาวิทยาลัยบูรพา],
  [*ปีการศึกษา*], [2568],
)

= บทคัดย่อ

รายงานการปฏิบัติงานสหกิจศึกษาฉบับนี้นำเสนอผลการปฏิบัติงาน ณ #company_name ระหว่างวันที่ 13 พฤศจิกายน 2567 ถึงวันที่ 13 มีนาคม 2568 โดยมุ่งพัฒนาระบบบริหารจัดการการเรียนรู้ออนไลน์ MyAcademy สำหรับใช้ภายในองค์กร เพื่อสนับสนุนการจัดการหลักสูตร การลงทะเบียนเรียน และการติดตามผลการเรียนรู้ของพนักงาน ผู้จัดทำปฏิบัติงานในตำแหน่ง Full Stack Developer มีหน้าที่ศึกษาโครงสร้างระบบเดิมของ MyHR วิเคราะห์ความต้องการของผู้ใช้งาน และพัฒนาฟังก์ชันให้สอดคล้องกับกระบวนการทำงานขององค์กร

ขอบเขตงานที่รับผิดชอบครอบคลุมการพัฒนาทั้งส่วน Frontend และ Backend ของ Enrollment Management Module และ Reporting Module โดยพนักงานสามารถเลือกหลักสูตรและส่งคำขอลงทะเบียนเรียนได้ ขณะที่ฝ่ายทรัพยากรบุคคลสามารถพิจารณาอนุมัติหรือปฏิเสธคำขอ มอบหมายหลักสูตรให้พนักงาน รวมทั้งส่งออกรายงานผลการเรียนรู้ในรูปแบบ CSV และดาวน์โหลดประกาศนียบัตรได้อย่างเป็นระบบ นอกจากนี้ ระบบยังรองรับงานประมวลผลเบื้องหลังด้วย Redis และ BullMQ เพื่อลดความล่าช้าในการสร้างไฟล์รายงานและเพิ่มประสิทธิภาพการให้บริการ

ผลการดำเนินงานพบว่าระบบที่พัฒนาขึ้นสามารถทำงานได้ตามข้อกำหนดที่กำหนดไว้ ช่วยให้กระบวนการลงทะเบียนเรียน การอนุมัติคำขอ และการสรุปรายงานมีความถูกต้อง รวดเร็ว และตรวจสอบย้อนหลังได้มากขึ้น ส่งผลให้องค์กรสามารถบริหารจัดการการฝึกอบรมพนักงานได้อย่างเป็นระบบ และลดภาระงานที่ต้องดำเนินการด้วยตนเองของฝ่ายทรัพยากรบุคคล

#pagebreak()
#table(
  columns: (auto, 1fr),
  stroke: none,
  [*Report Title*], [#project_name_en],
  [*Student*], [#student_name_en],
  [*Student ID*], [#student_id],
  [*Advisor*], [Assistant Professor Benchaporn Jantarakongkul],
  [*Level of Study*], [Bachelor degree of Science in Computer Science],
  [*Faculty*], [Faculty of Informatics, Burapha University],
  [*Year*], [2025],
)

= ABSTRACT

This report presents the cooperative education internship at #company_name_en from November 13, 2024, to March 13, 2025, focusing on the development of MyAcademy, an internal e-learning management system for employee training. Working as a Full Stack Developer, the student intern studied the existing MyHR architecture, analyzed business requirements, and implemented features that aligned with the organization's learning workflow.

The work covered both frontend and backend development of the Enrollment Management Module and the Reporting Module. Employees can browse courses and submit enrollment requests, while HR staff can approve or reject requests, assign courses, export course reports in CSV format, and download certificates systematically. The system was developed using Angular, Tailwind CSS, NestJS, PostgreSQL, and Redis/BullMQ to support background processing and improve responsiveness during report generation.

The results showed that the developed system satisfied the specified requirements and improved the efficiency of training management. The implemented functions increased the accuracy and traceability of enrollment, approval, and reporting processes, while reducing manual workload for HR staff.
