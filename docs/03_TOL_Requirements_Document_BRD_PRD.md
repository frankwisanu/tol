# Business & Product Requirements Document (BRD / PRD)
## True Online (TOL) Registration & Omnichannel Sales Platform

---

### Document Control
- **Document ID**: `TRUE-TOL-BRD-PRD-2026-V1.1`
- **Application**: One App / TrueOnline Enterprise Portal
- **Scope**: Modules 01 to 23 (End-to-End Sales, KYC, Scheduling & Provisioning)
- **Classification**: Confidential - Internal / Client Facing

---

## 1. System Architecture & Context Diagram

```
                 ┌──────────────────────────────────────────────────┐
                 │             ONE APP FRONTEND CLIENT              │
                 │    (iOS / Android / Webview Container)           │
                 └─────────┬──────────────────────┬─────────────────┘
                           │                      │
           SGIS Webview    │                      │ REST / JSON
           GIS Map Search  │                      │ (tolSubmit, KYC, etc.)
                           ▼                      ▼
                 ┌──────────────────┐   ┌───────────────────────────┐
                 │   SGIS SERVER    │   │      ONE APP BACKEND      │
                 │ (Coverage Engine)│   │  (Business Rules & Orche) │
                 └─────────┬────────┘   └──────────────┬────────────┘
                           │                           │
                           │   GIS Sync / Callback     │
                           └──────────────┬────────────┘
                                          │
    ┌─────────────────────────────────────┼──────────────────────────────────┐
    ▼                                     ▼                                  ▼
┌───────────────────────┐   ┌───────────────────────────┐   ┌──────────────────────────┐
│  FRAUD TMV & BLACKLIST│   │      HL / iOM CORE        │   │    AWS S3 & REPOSITORY   │
│ (Credit & AML Engine) │   │ (Provisioning & Billing)  │   │  (KYC Image / PDF Vault) │
└───────────────────────┘   └───────────────────────────┘   └──────────────────────────┘
```

---

## 2. Functional Module Catalog (Modules 00 - 23)

### Module 00: Registration Hub & Partner Identification
- **Component ID**: `MOD-00-REG-HUB`
- **Objective**: Provide the primary entry point to initialize registration sessions, capture partner/dealer metadata, and record mandatory regulatory PDPA consent.
- **Data Attributes**:
  - `registrationType`: Enumeration (`NEW_CUSTOMER`, `EXISTING_ADDON`, `MIGRATION_CVG`).
  - `saleAgentId`: Sales representative employee / agent code.
  - `rtrCode`, `dtrCode`: Retail dealer and distribution territory codes.
  - `pdpaConsent`: Boolean (`true` / `false`).
  - `draftTxId`: Unique draft session identifier for resume flow.
- **Functional Rules**:
  - PDPA consent is mandatory; without it, registration session initialization is blocked.
  - Partner codes bind sales commission and route order into corresponding channel queue.
  - Draft state is persisted in `One DB (mrtrdb)` allowing multi-day resumption.

### Module 01: SGIS Coverage Check
- **Component ID**: `MOD-01-SGIS`
- **Objective**: Identify fiber distribution availability, optical network terminal (ONT) compatibility, and drop wire length.
- **Data Attributes**:
  - `latitude`, `longitude`: Decimal GPS coordinates.
  - `addressId`: Unique cadastral identifier from SGIS database.
  - `coverageTier`: Enumeration (`GREEN`, `YELLOW`, `RED`).
  - `tcApproveFlag`: Enumeration (`None`, `Y`, `N`).
- **Functional Rules**:
  - `GREEN`: Distance from Splitter $\le 300$ meters. Instant approval.
  - `YELLOW`: Distance $> 300$ meters. If property is *Private House*, customer pays excess cable charge; if *Rental House*, requires automated supervisor approval request.
  - `RED`: No network presence within 1,000 meters. Customer offered entry into Waiting List.

### Module 02: Service Selection & Sales Channel Format
- **Component ID**: `MOD-02-SVC-SEL`
- **Supported Bundles**:
  - `1P (TOL Standalone)`: Fiber broadband internet only.
  - `2P (TOL + FLP)`: Internet + Fixed Line Plus.
  - `2POTT (TOL + TMH)`: Internet + TrueMove H Postpaid mobile line.
  - `3POTT (TOL + TrueID + FLP)`: Internet + TrueID TV streaming device + Fixed Line.
  - `4POTT (TOL + TMH + TrueID + FLP)`: Quadruple Play convergence solution.
- **Sales Channel Formats**:
  - `หน้าร้าน / ตามบ้าน (Offline / Direct Sales)`: Handled by agent using physical or manual verification.
  - `ออนไลน์ (Online Channel)`: Initiates remote QR self-verification workflow.

### Modules 03 & 04: Customer Identification & New TOL Validation
- **Component ID**: `MOD-03-CUST-ID` & `MOD-04-TOL-VAL`
- **Document Types**:
  1. *Thai Citizen ID*: 13 digits, checked against MOI DOPA format.
  2. *Passport*: Format `[A-Z][0-9]{7,8}`.
  3. *Alien Card (บัตรต่างด้าว)*: 13-digit non-citizen registration.
  4. *Work Permit (เล่ม/บัตร)*: Expiration date must be $> 90$ days from application date.
  5. *Thai Driving License*: 8-digit unique driver ID.
- **Business Validations**:
  - Minimum subscriber age is 18 years.
  - If applicant is under 20 years with address number `00` on rental property, parental guarantor document attachment is mandatory.
  - Fraud check invocation via `SMARTUI-validateTMVFraudAndBlackList`. If outstanding debt $> 1,500$ THB across True Group, order is blocked.

### Modules 05 & 06: Convergence (TMH) Eligibility & Customer Validation
- **Component ID**: `MOD-05-TMH-CVG` & `MOD-06-TMH-VAL`
- **Eligibility Lookup**: `tolGetTmhEligibility`
  - Scans customer identity against active TrueMove H & Dtac postpaid customer databases.
  - Identifies existing mobile numbers eligible for convergence discount (FMC Value Bundle).
  - Flags suspended, debt-locked, or non-eligible prepaid lines.

### Modules 07, 08 & 09: Customer Self-Verification QR, Staff View & Biometrics
- **Component ID**: `MOD-07-QR-STAFF`, `MOD-08-QR-CUST`, `MOD-09-BIO-KYC`
- **Interactive Sequence**:
  1. Staff triggers QR generation in One App (`MOD-07`).
  2. Customer scans QR code using iOS/Android device camera (`MOD-08`).
  3. Customer takes photo of identity document; OCR parses name, address, and card number.
  4. Customer performs real-time liveness test (`MOD-09`):
     - Active liveness: Eye blink, smile, left/right face rotation.
     - Anti-spoofing detection against printed photos or screens.
  5. Biometric similarity comparison between selfie and ID card chip photo:
     - Score $\ge 85\%$: Automatic Pass $\rightarrow$ System proceeds.
     - Score $< 85\%$: Maximum 3 attempts permitted; then triggers fallback to Manual KYC.

### Module 10: More Photo (Supplemental Verification Documents)
- **Component ID**: `MOD-10-MORE-PHOTO`
- **Triggers**:
  - Applicant resides in rental property, apartment, or condo without matching national ID address.
  - Manual KYC fallback execution.
- **Accepted Files**: JPEG, PNG, PDF up to 10 MB per file. Maximum 5 supplementary attachments.

### Modules 11 & 12: Privilege Engine & TOL Package Selection
- **Component ID**: `MOD-11-PRIV` & `MOD-12-PACK-LIST`
- **Discount Types**:
  - *FMC Discount (xT / xD)*: Recurring monthly discount (e.g., 200 THB/month or 20% discount).
  - *CP Employee Welfare (CPemp)*: 30% to 50% discount based on corporate employee tier.
  - *CP Friends & Family (CPfnf)*: One-time promotion token.
- **Media-Driven Filtering**:
  - Optical Fiber (FTTH): Enables full symmetric speeds up to 2000/1000 Mbps.
  - Fiber-to-the-Building (FTTB) / Cable Docsis (FTTC): Caps package bandwidth to physical line limit.

### Module 13: TOL Entry Fee Management
- **Component ID**: `MOD-13-ENTRY-FEE`
- **Fee Rules**:
  - Standard installation entry fee: 890 THB.
  - Automatic waiver (`Waive TOL Entry Fee = Yes`) applied when contract $\ge 24$ months.
  - Promo code discounts applied dynamically (`offerCode: TOLENTRY450` reduces fee to 450 THB).

### Modules 14 & 15: Number Provisioning (TMH Mobile & Fixed Line Plus FLP)
- **Component ID**: `MOD-14-TMH-NUM` & `MOD-15-FLP-NUM`
- **TMH Reservation**:
  - User can choose existing number or select new SIM.
  - Real-time pool query and reservation lock for 30 minutes via `tolReserveServiceNumber`.
- **Fixed Line Plus (FLP)**:
  - Assigns cloud DID telephone number with regional area prefix (02, 053, etc.).
  - Configures price plan (e.g. `IPI49TTT50`: 49 THB for 50 mobile minutes; `IPI300TTT500`: 300 THB for 500 minutes).
  - Includes CLI (Caller Line Identification) VAS feature.

### Modules 16 & 17: Product Summary & Customer Info
- **Component ID**: `MOD-16-PROD-SUM` & `MOD-17-CUST-INFO`
- **Billing Delivery Formats**:
  - `SMS`: Electronic bill link delivered to registered contact mobile.
  - `E-Bill (Email)`: Password-protected PDF bill sent monthly.
- **Address Management**:
  - Installation Address: Inherited from SGIS mapping (immutable street/house details).
  - Billing / Document Delivery Address: Can be set identical to installation or specified custom.

### Modules 18, 19 & 20: Appointment, Review & Port Capacity Check
- **Component ID**: `MOD-18-APPT`, `MOD-19-REV-CONF`, `MOD-20-PORT-CAP`
- **Scheduling Matrix**:
  - Morning Window: 08:30 - 12:00
  - Afternoon Window: 13:00 - 17:00
- **Real-Time Port & Slot Check**:
  - Prior to final submission, system validates physical optical port capacity at the distribution point (DP).
  - If technician availability expired or port becomes exhausted $\rightarrow$ triggers `CHK_PORT` error modal and prompts date rescheduling.

### Modules 21, 22 & 23: Order Submission E2E, History & Reporting
- **Component ID**: `MOD-21-SUBMIT`, `MOD-22-TX-HIST`, `MOD-23-PIE-REP`
- **Payload Composition (`tolSubmit`)**:
```json
{
  "saleAgent": {
    "partnerCode": "10015591",
    "orderCreatorName": "MK Enterprise Co., Ltd. (CODO)"
  },
  "billing": {
    "language": "TH",
    "format": "E",
    "email": "customer@example.com"
  },
  "addressList": [
    {
      "addressType": "install",
      "addressId": "231099090",
      "houseNumber": "7/224",
      "latitude": 13.760986,
      "longitude": 100.563812
    }
  ],
  "propositionCategoryId": "FLP_PROMOTION_CONVERGENCE_4POTT",
  "offerCode": "FTOT409-500",
  "verificationForm": "one-app-id-card:one-app-liveness",
  "appointment": {
    "date": "2026-10-20",
    "slot": "MORNING"
  }
}
```
- **Transaction History**: Real-time sales dashboard showing Order ID, Customer Name, Status (`Submitted`, `Pending KYC`, `Provisioning`, `Completed`).
- **PIE Reporting**: Integrated audit event log dispatching analytics and commission tracking.
