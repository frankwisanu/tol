# Product Owner Specification (PO Document)
## True Online (TOL) Registration & Convergence Onboarding

---

### Document Metadata
- **Project**: True Online (TOL) Digital Transformation
- **Role**: Product Owner (PO)
- **Version**: 1.1 (Release 1.1 Scope Backlog)
- **Status**: Ready for Sprint Planning & Executive Presentation

---

## 1. Product Vision & Success Metrics

### Product Vision
> *"To deliver an effortless, paperless, omni-channel customer onboarding experience for TrueOnline broadband and convergence services, empowering sales partners to close deals within 5 minutes and enabling customers to complete autonomous digital verification with 100% regulatory compliance."*

### Key Performance Indicators (KPIs)
- **Order Conversion Rate**: Increase from 64% to $\ge 88\%$ by removing manual KYC bottlenecks.
- **Average Handling Time (AHT)**: Reduce end-to-end sales processing time from 18 minutes to $< 5$ minutes.
- **Straight-Through Processing (STP)**: $\ge 92\%$ of submitted orders successfully provisioned into iOM without manual back-office intervention.
- **First-Time KYC Pass Rate**: $\ge 90\%$ pass rate on customer facial biometric and OCR extraction.

---

## 2. Epic Breakdown & Feature Traceability

| Epic ID | Epic Name | Description | Jira Reference | Priority |
|---|---|---|---|---|
| **EP-00** | Registration Hub & Partner Onboarding | Unified entry point for new registrations, partner/dealer attribution, PDPA consent, and draft resumption. | `THL-1089`, `THL-1095` | P0 (Must Have) |
| **EP-01** | SGIS Network Feasibility Check | Map-based coverage check with automatic classification into Green, Yellow, and Red tiers. | `THL-1089`, `THL-1090` | P0 (Must Have) |
| **EP-02** | Multi-Play Service Configuration | Support modular bundling for 1P, 2P, 3P, and 4POTT combinations across online and direct retail channels. | `THL-1089` | P0 (Must Have) |
| **EP-03** | Digital Customer Identification & OCR | Automated scanning and verification of Thai National ID, Passport, Alien Card, and Work Permits with Fraud TMV screening. | `THL-1089`, `THL-1091` | P0 (Must Have) |
| **EP-04** | Remote QR Self-KYC & Biometrics | Customer scans QR code generated on staff device to conduct self-service biometric liveness and face matching. | `THL-1089`, `THL-1093` | P0 (Must Have) |
| **EP-05** | Convergence & Employee Privileges | Dynamic discounting engine supporting TrueMove H FMC discounts, CP employee welfare, and promo coupon codes. | `THL-1087`, `THL-1089`, `THL-1095` | P1 (Should Have) |
| **EP-06** | Package Catalog & Entry Fee Waiver | Dynamic package catalog filtered by physical fiber media (FTTH/FTTB/FTTC) with automated entry fee waiver logic. | `THL-1087`, `THL-1089` | P0 (Must Have) |
| **EP-07** | Number Reservation & VoIP Provisioning | Live TrueMove H mobile number reservation and Fixed Line Plus (FLP) digital VoIP assignment. | `THL-1089` | P1 (Should Have) |
| **EP-08** | Real-Time Appointment & Port Capacity | Interactive technician appointment booking with automatic conflict detection and over-capacity rescheduling. | `THL-1089`, `THL-1092` | P0 (Must Have) |
| **EP-09** | End-to-End Order Submission & Audit | Submission of multi-system payload (`tolSubmit`), S3 document archival, PIE analytics, and transaction tracking. | `THL-1089` | P0 (Must Have) |

---

## 3. High-Priority User Stories with Acceptance Criteria (Gherkin Format)

### Story US-00: Registration Hub Initiation & Partner Identification (EP-00)
**As a** Sales Agent or Retail Partner  
**I want to** select the registration type, capture partner channel codes, and verify PDPA consent  
**So that** the order is accurately attributed, legally compliant, and initialized for coverage checking.

```gherkin
Feature: TrueOnline Registration Hub Initiation

  Scenario: Successful Registration Initialization with Valid PDPA
    Given the sales agent opens "ลงทะเบียนทรูออนไลน์" in One App
    When the agent selects registration type "NEW_CUSTOMER"
    And inputs sales agent ID "39027264" and RTR code "RTR-BKK-091"
    And accepts the PDPA data privacy terms
    And clicks "เริ่มลงทะเบียนใหม่"
    Then the system initializes the registration session
    And transitions to the "SGIS Coverage Check" step with active stepper indicator

  Scenario: Registration Prevented Without Mandatory PDPA Consent
    Given the sales agent opens "ลงทะเบียนทรูออนไลน์" in One App
    When the agent leaves the PDPA consent checkbox unchecked
    Then the "เริ่มลงทะเบียนใหม่" button remains disabled
    And an alert displays "กรุณายอมรับเงื่อนไขความยินยอมข้อมูลส่วนบุคคล (PDPA)"
```

### Story US-01: Network Coverage Feasibility Check (EP-01)
**As a** Sales Agent using One App  
**I want to** pinpoint customer installation coordinates on the SGIS Map  
**So that** I immediately know whether TrueOnline can be installed and whether cable extension approvals are needed.

```gherkin
Feature: SGIS Coverage Feasibility Verification

  Scenario: Standard Full Coverage Available (Green)
    Given the sales agent opens "ลงทะเบียนทรูออนไลน์" in One App
    When the agent selects the customer's location on the SGIS Webview
    And the network splitter has available fiber ports within standard radius
    Then the system displays the Green coverage status badge
    And the "TC Approve Flag" is set to "None"
    And clicking "สมัครบริการ" advances to the "Select Service Type" screen

  Scenario: Over-Cable Limit Exceeded for Private House (Yellow)
    Given the agent selects a location requiring drop wire beyond standard limit
    And the property type is designated as "บ้านส่วนตัว" (Private House)
    When SGIS completes distance calculation
    Then the system displays the Yellow coverage warning ("ทางสายเกิน")
    And prompts the agent to accept excess drop wire terms
    And the "TC Approve Flag" is recorded as "N" (Customer Approved Excess Payment)

  Scenario: Location Unserviceable (Red Tier)
    Given the selected address has no True fiber or docsis infrastructure
    When the coverage lookup executes
    Then the system displays the Red status ("พื้นที่ไม่สามารถให้บริการได้")
    And presents an option to save the customer's details to the "Waiting List"
    And prevents continuation to product selection
```

---

### Story US-02: Omnichannel Customer Self-KYC via QR Code (EP-04)
**As a** Field Sales Agent  
**I want to** generate a secure QR code on my screen for the customer to scan on their personal phone  
**So that** the customer can securely capture their ID and facial biometrics without touching staff hardware.

```gherkin
Feature: Remote Customer Self-Verification QR Workflow

  Scenario: Successful QR Code Biometric KYC Flow
    Given the agent is on the "Customer Self-Verification" Staff Screen
    When the agent presses "สร้าง QR Code สำหรับลูกค้า"
    Then an encrypted QR code is displayed with a 15-minute countdown timer
    When the customer scans the QR code on their mobile device
    And takes a clear photo of their Thai National ID Card
    And completes the facial liveness test (head movement and blink)
    Then the face matching algorithm verifies a similarity score >= 85%
    And the Staff Screen automatically updates to status "ยืนยันตัวตนสำเร็จ"
    And the agent is allowed to proceed to the "Privilege Selection" screen

  Scenario: Biometric Match Failure with Fallback to Manual KYC
    Given the customer's facial scan fails matching threshold after 3 attempts
    When the system terminates automated biometric processing
    Then the Staff Screen switches to "Manual KYC Required"
    And prompts the agent to take supplemental photos ("More Photo") of utility bills and ID
    And routes the order for asynchronous Supervisor Review
```

---

### Story US-03: Convergence FMC & Corporate Employee Privilege Engine (EP-05)
**As a** True/Dtac Postpaid Subscriber or CP Group Employee  
**I want to** link my existing mobile phone number or employee ID  
**So that** I receive exclusive monthly recurring subscription discounts on my broadband package.

```gherkin
Feature: Privilege & Discount Matrix Application

  Scenario: TrueMove H Convergence Discount (xT FMC)
    Given the customer is verified as an active TrueMove H Postpaid subscriber
    When navigating to the "Privilege" screen
    And selecting "สิทธิ์เบอร์ TRUE / DTAC"
    Then the system queries "tolGetTmhEligibility" and displays eligible mobile numbers
    When the user selects an active number
    Then the broadband catalog applies a 20% discount on the selected FTTH package
    And the Product Summary reflects the discounted Monthly Recurring Charge (MRC)

  Scenario: Block Privilege on Suspended Mobile Line
    Given the customer enters a True or Dtac mobile number
    When the backend identifies that the SIM status is "Suspended"
    Then the system displays an error banner: "เบอร์นี้ไม่สามารถรับสิทธิ์ได้เนื่องจากถูกระงับสัญญาณ"
    And disables the promotional discount until the line status is restored to Active
```

---

### Story US-04: Conflict-Free Technician Installation Scheduling (EP-08)
**As a** Customer  
**I want to** choose a convenient technician installation time slot  
**So that** I know exactly when fiber technicians will arrive to set up my broadband equipment.

```gherkin
Feature: Real-Time Technician Appointment and Port Reservation

  Scenario: Successful Slot Reservation
    Given the agent is on the "Installation and Appointment" screen
    When viewing the calendar of available dates
    Then available dates are highlighted with selectable "เช้า (Morning)" and "บ่าย (Afternoon)" slots
    When the user selects an available morning slot
    Then the appointment is locked with a temporary 20-minute reservation hold
    And the selection is populated into the Order Review summary

  Scenario: Graceful Handling of Exhausted Slot Capacity
    Given another concurrent booking claims the last remaining technician slot
    When the user attempts to confirm the order in Module 20 ("Check Port และ วันที่ติดตั้ง")
    Then a modal dialog alerts: "วันและเวลาที่เลือกเต็มแล้ว กรุณาเลือกวันติดตั้งใหม่"
    And automatically returns the user to the interactive calendar to pick another slot
```

---

## 4. Definition of Ready (DoR) & Definition of Done (DoD)

### Definition of Ready (DoR)
- [x] User story contains business persona, functional objective, and rationale.
- [x] Gherkin acceptance criteria written with positive, negative, and edge test scenarios.
- [x] UI mockups and design token references available.
- [x] Integration APIs (`tolGetTmhEligibility`, `tolSubmit`, SGIS) contract payloads specified.
- [x] Dependencies and environment preconditions documented.

### Definition of Done (DoD)
- [x] Code implemented adhering to company naming conventions and architecture.
- [x] Page Object Model (POM) and BDD test suites created.
- [x] Automation test cases executed on SIT environment with 100% pass rate.
- [x] Robocop static code analysis reports zero critical warnings.
- [x] Peer review completed and merged into main branch.
- [x] Artifacts packaged and ready for customer presentation in Visual Studio.
