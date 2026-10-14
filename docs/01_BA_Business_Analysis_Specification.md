# Business Analysis Specification (BA Document)
## True Online (TOL) Registration & Convergence Onboarding System (One App)

---

### Document Information
- **Project Name**: True Online (TOL) Automation & Registration System
- **Module**: E2E Sales, Coverage Verification, Customer KYC & Order Fulfillment
- **Target Channel**: One App (Online Sales Channel & Direct Sales / Retail Dealer / CODO)
- **Author**: Business Analyst Team
- **Version**: 1.1 (Production Baseline)
- **Status**: Approved for Automation Testing & Stakeholder Review

---

## 1. Executive Summary & Business Objective
The True Online (TOL) Onboarding System within One App serves as the unified omni-channel platform enabling sales agents, retail dealers (DLR), True Partners (CODO), and direct customers to register, validate, customize, and fulfill TrueOnline Fixed Broadband and Convergence (FMC) packages.

### Strategic Goals:
1. **Streamlined Digital Journey**: Eliminate manual paperwork by integrating OCR, SGIS automated coverage check, and digital KYC/Liveness verification.
2. **Flexible Multi-Play Product Bundling**: Support Standalone Broadband (1P), Double Play (2P: TOL + TMH / TOL + FLP), Triple Play (3P: TOL + TrueID TV + FLP/TMH), and Quadruple Play (4POTT: Broadband + Mobile + TV + Fixed Line Plus).
3. **Automated Risk & Network Feasibility Checks**: Instant GIS port availability checking, over-cable distance validation (`TC Approve Flag`), technician calendar reservation, and blacklisting/fraud screening via Fraud TMV.
4. **Automated Order Dispatch**: Straight-Through Processing (STP) from One App Backend to High Level (HL) / iOM fulfillment, AWS S3 document archival, and PIE reporting.

---

## 2. Stakeholder & Actor Matrix

| Actor | Channel | Role & Responsibilities |
|---|---|---|
| **Retail Sales Agent / Dealer (DLR)** | One App (Direct Sales / Retail Store) | Initiates registration on behalf of walk-in or field customers, inputs customer location, triggers KYC QR code. |
| **True Partner (TPN / CODO)** | One App (Partner Outlet) | Enrolls customers via partner sales code (`rtr_code`, `dms_dtr_code`, `ICX sale-agent`). |
| **End Customer** | Mobile Web / One App Customer View | Performs self-identity verification by scanning QR code, completes OCR verification, facial biometric liveness, and reviews order details. |
| **Area Supervisor / GIS Team** | SGIS Backend | Reviews and approves over-cable installation requests (`ทางสายเกิน`) where drop wire exceeds standard threshold. |
| **Technician Service Team** | Workforce Management / Dispatch | Receives booked installation appointment slots (Morning/Afternoon) and executes on-site deployment. |
| **Downstream Fulfillment (HL / iOM)** | Enterprise Backend Core | Orchestrates provisioning across ISP network, TMH mobile billing, TrueID entitlement, and FLP softswitch. |

---

## 3. High-Level End-to-End Business Workflow

```
[Start: One App Dashboard] 
       │
       ▼
[Module 00: Registration Hub] (New Customer / Existing Add-on / Partner RTR/DTR / PDPA Consent)
       │
       ▼
[Module 01: SGIS Coverage Check] ──── Red (No Coverage) ──► [Waiting List / Lead Captured]
       │ Green / Yellow
       ▼
[Module 02: Service Selection] (1P / 2P / 3P / 4POTT; Online vs Direct Channel)
       │
       ▼
[Module 03-04: Customer ID Validation] (OCR / Manual Thai ID / Passport / Alien / Work Permit)
       │
       ▼
[Module 05-06: TMH Eligibility Check] (Check Existing True/Dtac number or New TMH)
       │
       ▼
[Module 07-10: Customer KYC & Verification]
       ├─► Staff Screen: Generate QR Code / Ref Code
       ├─► Customer Screen: Scan QR -> Biometric Liveness & Face Compare
       └─► More Photo: Supplemental proof of address or billing documents
       │
       ▼
[Module 11: Privilege Application] (CP Employee, True Employee, FMC Discount %, F&F Code)
       │
       ▼
[Module 12-13: Package & Entry Fee] (FTTH / FTTB / FTTC, Speed Tier, Entry Fee Waive)
       │
       ▼
[Module 14-15: Number Selection] (TMH Mobile SIM & Fixed Line Plus FLP Number)
       │
       ▼
[Module 16-17: Product Summary & Customer Info] (Personal info, billing/install address)
       │
       ▼
[Module 18-20: Appointment & Port Validation] (Standard/Special Install, Slot Booking, Port Capacity)
       │
       ▼
[Module 21-23: Order Submission & Archival] (tolSubmit -> iOM, S3 Upload, PIE Report, Tx History)
```

---

## 4. Detailed Module Business Rules & Functional Specifications

### 4.0 Module 00: TrueOnline Registration Hub & Partner Identification
- **Purpose**: Unified entry point for new subscriber acquisition, existing add-on enrollments, and retail dealer transaction attribution.
- **Registration Types**:
  - `NEW_CUSTOMER`: Brand new TrueOnline subscriber registration.
  - `EXISTING_ADDON`: Existing customer adding convergence broadband to mobile or PayTV account.
  - `MIGRATION_CVG`: Porting or migrating legacy standalone packages to convergence play.
- **Sales Partner Attribution Rules**:
  - `saleAgentId`: 8-digit unique sales agent identifier (e.g. `39027264`). Mandatory for retail and partner channels.
  - `rtrCode`: Retail Dealer Outlet Code (e.g. `RTR-BKK-091`). Binds commission and distribution channel.
  - `dtrCode`: DMS Distribution Territory Reference (e.g. `DTR-9982`).
- **Regulatory PDPA & Consent Rules**:
  - Customers must check the PDPA Data Privacy Consent and Terms of Service.
  - If PDPA consent is not selected, the `เริ่มลงทะเบียนใหม่` button remains strictly disabled.
- **Draft Session Management (ทำรายการต่อ)**:
  - Supports resuming incomplete registrations via customer Thai ID or draft transaction ID.

### 4.1 Module 01: SGIS Coverage Check
- **Purpose**: Verify network technical feasibility at customer geolocation.
- **Coverage Classification**:
  - **Green (Available)**: Standard coverage within fiber distribution point (DP/Splitter). `TC Approve Flag = None`. Immediate progression to service selection.
  - **Yellow (Over-cable / ทางสายเกิน)**: Distance from DP exceeds standard limit.
    - *Private House (บ้านส่วนตัว)*: Requires customer approval for excess drop wire fee (`TC Approve Flag = N`).
    - *Rental House (บ้านเช่า)*: Free cable waiver requires special approval workflow (`TC Approve Flag = Y`).
  - **Red (Unavailable)**: No network coverage. Triggers option to enroll in customer Waiting List. Order terminates with notification.
- **Exit & Back Navigation**:
  - Pressing `< Back` triggers confirmation prompt: *"คุณต้องการยกเลิกการตรวจสอบพื้นที่ให้บริการหรือไม่..."*
  - Selecting "ต้องการ" navigates to One App Home.
  - Selecting "ไม่ต้องการ" maintains current GIS map view.

### 4.2 Module 02: Select Service Type & Sales Channel
- **Core Service**: Broadband Internet (TOL) is **Mandatory** (Pre-checked, non-uncheckable).
- **Add-on Services**:
  - `TMH` (TrueMove H Mobile Postpaid SIM)
  - `TrueID TV` (OTT Set-Top Box)
  - `FLP` (Fixed Line Plus / VoIP home telephone)
- **Play Configurations**:
  - **1P (TOL STD)**: Internet only.
  - **2P (TOL + FLP)**: Internet + Fixed Line.
  - **2POTT (TOL + TMH)**: Internet + Mobile SIM (with or without FLP Dummy).
  - **3POTT (TOL + TrueID + FLP)**: Internet + TrueID TV Box + Fixed Line.
  - **4POTT (TOL + TMH + TrueID + FLP)**: Complete Quad-Play bundle.
- **Sales Channel Formats**:
  - `ออนไลน์ (Online Channel)`: Customer self-verification via QR code mandatory.
  - `หน้าร้าน/ตามบ้าน (Direct / Retail)`: Assisted staff registration with direct document scanning.

### 4.3 Module 03 & 04: Customer ID Verification & Validation
- **Supported Identification Types**:
  1. *Thai National ID Card (บัตรประชาชน)*: 13 digits with checksum calculation.
  2. *Passport (หนังสือเดินทาง)*: Alphanumeric passport number + Nationality.
  3. *Alien Card (บัตรต่างด้าว)*: Non-Thai resident identity document.
  4. *Work Permit Booklet (ใบอนุญาตทำงานแบบเล่ม)* & *Work Permit Card (บัตรอนุญาตทำงาน)*.
  5. *Driving License (ใบขับขี่)*.
- **Validation Rules**:
  - Customer age must be $\ge 18$ years (special parent consent needed if $< 20$ years with online channel and house number `00`).
  - Blacklist & Fraud TMV check: Card number sent to `SMARTUI-validateTMVFraudAndBlackList`. If flagged, registration blocks immediately.
  - Duplication check: Check active broadband lines per national ID.

### 4.4 Module 05 & 06: Existing TMH & Convergence Eligibility
- **API Call**: `tolGetTmhEligibility`
  - If customer owns active TrueMove H / Dtac postpaid number $\rightarrow$ Display eligible FMC bundle privileges.
  - If customer owns suspended True/Dtac number $\rightarrow$ Block bundle activation until billing regularized.
  - If prepaid number $\rightarrow$ System prevents convergence discount until converted to postpaid.
  - If customer requires new mobile line $\rightarrow$ Route to New TMH number reservation.

### 4.5 Module 07 to 10: KYC, Biometrics & Document Capture
- **Staff Workflow**: One App generates a secure encrypted QR code & Reference Code with 15-minute TTL.
- **Customer Self-Service Workflow**:
  - Customer scans QR code using smartphone browser.
  - Camera captures ID Card (OCR automatically extracts Thai/English Name, Birth Date, Expiry Date).
  - Face Biometric Liveness test executed (blink, smile, head turn).
  - Face comparison match score against ID chip photo must exceed 85%.
  - If biometric verification fails 3 times $\rightarrow$ Fallback to Manual KYC with staff review.
- **Module 10 (More Photo)**:
  - If address differs from national ID or house registration $\rightarrow$ Upload supplemental lease agreement, utility bill, or deed certificate.

### 4.6 Module 11 to 13: Privilege, Package & Entry Fee
- **Privilege Profiles**:
  - *General Public (บุคคลทั่วไป)*: Eligible for standard FMC package discounts (xT / xD FMC).
  - *CP Group Employee (พนักงาน CP)*: Validated against CP employee database; grants tiered corporate discount.
  - *True Employee (พนักงาน True)*: True staff welfare entitlement.
  - *CP Friends & Family*: Requires valid single-use promo code.
- **Package Matrix**:
  - Access technologies: FTTH (Fiber to the Home), FTTB (Building), FTTC (Cabinet/Docsis).
  - Bandwidth profiles: 500/500 Mbps, 1000/500 Mbps, 1000/1000 Mbps, 2000/1000 Mbps.
- **TOL Entry Fee**:
  - Standard entry fee: 890 THB.
  - Conditional waiver: `Waive TOL Entry Fee` applied automatically if contract duration $\ge 24$ months or active FMC promotion code (`TOLENTRY450`).

### 4.7 Module 14 & 15: TMH & Fixed Line Plus (FLP) Provisioning
- **New TMH Number Selection**: Real-time search by auspicious numbers (เบอร์มงคล), favorite digits, or random list. Reserve number TTL: 30 minutes (`tolReserveServiceNumber`).
- **Fixed Line Plus (FLP)**: Assigns cloud VoIP phone number with zero hardware telephone exchange costs, Caller ID (CLI) bundle, and bundled talk time (e.g. 50 mins or 500 mins).

### 4.8 Module 16 & 17: Product Summary & Customer Info
- **Bill Delivery Preference**: SMS notification (free) or E-Bill (e-mail format in PDF with password encryption).
- **Billing Language**: Thai (TH) or English (EN).
- **Secondary Contact**: Mandatory backup mobile phone number for technician coordination.

### 4.9 Module 18 to 20: Installation, Appointment & Port Check
- **Installation Types**:
  - *Standard Installation (ติดตั้งแบบมาตรฐาน)*: Surface wiring up to standard meter limit.
  - *Special Installation (ติดตั้งแบบพิเศษ)*: Conduit piping or customized wall-drill routing.
- **Slot Availability**:
  - Calendar displays available technician appointment dates up to 14 days ahead.
  - Slots: Morning (08:30 - 12:00) / Afternoon (13:00 - 17:00).
  - Real-time Capacity Lock: On selecting slot, system holds technician quota for 20 minutes.
  - If capacity becomes exhausted during order review $\rightarrow$ Module 20 triggers `Port/Date Full` dialog, prompting the user to select an alternate slot.

### 4.10 Module 21 to 23: Order Submission E2E & Audit
- **Payload Generation**: Assembles JSON containing `saleAgent`, `addressList`, `billing`, `customerInfo`, `flpInfoList`, `tmhInfo`, `gisOrder`, and `documentAttachmentList`.
- **Backend API**: `tolSubmit` invoked asynchronously.
- **Response**: Returns Customer Order ID (e.g. `2601301414A1TO2P8D15`).
- **Post-Submission Operations**:
  - Upload scanned documents and contract signatures to AWS S3.
  - Issue notification back to SGIS for fiber port binding.
  - Publish transaction ledger entry to PIE Reporting & Transaction History for sales commission audit.

---

## 5. Non-Functional & Operational Requirements
1. **Response Time**: Coverage lookup $\le 3$ seconds; Order submission $\le 5$ seconds.
2. **Availability**: 99.95% uptime during sales operating window (07:00 - 22:00 ICT).
3. **Security & PDPA**: All PII and national identity images encrypted at rest (AES-256) and in transit (TLS 1.3). Biometric vector data stripped post-KYC match.
4. **Data Retention**: Completed transaction logs retained for 90 days in fast storage; archived to cold storage for 5 years per Thai NBTC compliance.
