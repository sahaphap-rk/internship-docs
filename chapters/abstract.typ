#import "../config/common.typ": *

#table(
  columns: (auto, 1fr),
  stroke: none,
  [*หัวข้อรายงาน*], [#project_name_th],
  [*นิสิต*], [นาย#student_name_th],
  [*รหัสประจำตัว*], [#student_id],
  [*อาจารย์ที่ปรึกษา*], [ผู้ช่วยศาสตราจารย์ วรวิทย์ วีระพันธุ์],
  [*ระดับการศึกษา*], [วิทยาศาสตรบัณฑิต สาขาวิชาวิทยาการคอมพิวเตอร์],
  [*คณะ*], [วิทยาการสารสนเทศ มหาวิทยาลัยบูรพา],
  [*ปีการศึกษา*], [2568],
)

= บทคัดย่อ

รายงานการปฏิบัติงานสหกิจศึกษาฉบับนี้นำเสนอผลการปฏิบัติงาน ณ #company_name ระหว่างวันที่ 13 พฤศจิกายน 2567 ถึงวันที่ 13 มีนาคม 2568 โดยมุ่งพัฒนาระบบบริหารจัดการการเรียนรู้ออนไลน์ MyAcademy สำหรับใช้ภายในองค์กร เพื่อสนับสนุนการจัดการหลักสูตร การลงทะเบียนเรียน และการติดตามผลการเรียนรู้ของพนักงาน ผู้จัดทำปฏิบัติงานในตำแหน่ง Full Stack Developer มีหน้าที่ศึกษาโครงสร้างระบบเดิมของ MyHR วิเคราะห์ความต้องการของผู้ใช้งาน และพัฒนาฟังก์ชันให้สอดคล้องกับกระบวนการทำงานขององค์กร

ขอบเขตงานที่รับผิดชอบครอบคลุมการพัฒนาทั้งส่วน Frontend และ Backend ของ Enrollment Management Module และ Course Reporting Module โดยพนักงานสามารถเลือกหลักสูตรและส่งคำขอลงทะเบียนเรียนได้ ขณะที่ฝ่ายทรัพยากรบุคคลสามารถพิจารณาอนุมัติหรือปฏิเสธคำขอ มอบหมายหลักสูตรให้พนักงาน รวมทั้งดูรายงานหลักสูตร ส่งออกรายงานในรูปแบบ CSV และดาวน์โหลดประกาศนียบัตรได้อย่างเป็นระบบ นอกจากนี้ ระบบยังรองรับงานประมวลผลเบื้องหลังด้วย Redis และ BullMQ เพื่อลดความล่าช้าในการสร้างไฟล์รายงานและเพิ่มประสิทธิภาพการให้บริการ

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

This report presents the results of the cooperative education internship at #company_name_en from November 13, 2024, to March 13, 2025. The internship focused on the development of MyAcademy, an internal online learning management system designed to support course management, enrollment, and the tracking of employees' learning outcomes. Working as a Full Stack Developer, the student intern studied the existing MyHR architecture, analyzed user requirements, and developed functions aligned with the organization's workflow.

The scope of work covered both frontend and backend development of the Enrollment Management Module and the Course Reporting Module. Employees can select courses and submit enrollment requests, while human resources staff can approve or reject requests, assign courses to employees, review course reports, export reports in CSV format, and download certificates systematically. In addition, the system supports background processing with Redis and BullMQ to reduce delays in report file generation and improve service efficiency.

The results showed that the developed system operated in accordance with the specified requirements. It improved the accuracy, speed, and traceability of enrollment, request approval, and reporting processes. As a result, the organization can manage employee training more systematically and reduce the manual workload of the human resources staff.
