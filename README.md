# True Online (TOL) Automation Testing Standard & Documentation Suite

This project contains the complete Enterprise Automation Testing Framework and Role Documentation for the **True Online (TOL) Registration & Omnichannel Sales System** on **One App**, adhering strictly to the **Company Automation Standard (`Standard/Example_By_BAS`)**.

---

## 📁 Project Architecture & Folder Structure

```
c:\Users\frank\Vasup\TOL\
├── docs/                                 # Role-Specific Specifications
│   ├── 01_BA_Business_Analysis_Specification.md   # BA: Business flows, rules & logic
│   ├── 02_PO_Product_Owner_Specification.md       # PO: Vision, Epics, Stories & Gherkin AC
│   ├── 03_TOL_Requirements_Document_BRD_PRD.md     # BRD/PRD: All 23 modules specifications
│   └── 04_Traceability_Matrix_And_Test_Mapping.md # Requirements-to-Test Traceability
│
├── .locator/                             # Direct Locator Repositories
│   ├── gis_coverage.locator
│   ├── service_and_kyc.locator
│   ├── package_and_order.locator
│   └── registration.locator                  # Registration hub, channel codes & PDPA
│
├── .page/                                # Direct Page Object Definitions
│   ├── gis_coverage.page
│   ├── service_and_kyc.page
│   ├── package_and_order.page
│   └── registration.page                     # Registration hub, partner & draft handling
│
├── .features/ & features/                # BDD Gherkin Feature Files (Visual Studio Ready)
│   ├── 01_SGIS_Coverage_Check.feature
│   ├── 02_Service_Selection_And_KYC.feature
│   ├── 03_Privilege_And_Package.feature
│   └── 04_Appointment_And_Order_Submission.feature
│   └── registration.feature                  # E2E TrueOnline Registration Lifecycle
│
├── locators/                             # Standard Robot Framework Locators
│   ├── gis_coverage_locator.resource
│   ├── service_type_locator.resource
│   ├── customer_id_locator.resource
│   ├── kyc_self_verification_locator.resource
│   ├── privilege_locator.resource
│   ├── package_selection_locator.resource
│   ├── customer_info_locator.resource
│   ├── appointment_locator.resource
│   ├── order_review_locator.resource
│   ├── order_submission_locator.resource
│   └── registration_locator.resource         # ${REGISTRATION.*}
│
├── keywords/                             # Page Object Model (POM) & Feature Flow Keywords
│   ├── common/
│   │   └── common.resource              # Browser lifecycle, explicit wait helpers
│   └── tol/
│       ├── component/                    # Reusable UI widgets (Headers, Dialogs)
│       │   ├── header_container.resource
│       │   └── popup_dialog.resource
│       ├── pages/                        # Screen-level low-level actions (.page)
│       │   ├── gis_coverage_page.resource
│       │   ├── service_type_page.resource
│       │   ├── customer_id_page.resource
│       │   ├── kyc_self_verification_page.resource
│       │   ├── privilege_page.resource
│       │   ├── package_selection_page.resource
│       │   ├── customer_info_page.resource
│       │   ├── appointment_page.resource
│       │   ├── order_review_page.resource
│       │   ├── order_submission_page.resource
│       │   └── registration_page.resource    # 1-line common.* calls
│       └── features/                     # Reusable business step flows (.features)
│           ├── check_coverage_feature.resource
│           ├── select_bundle_package_feature.resource
│           ├── customer_kyc_verification_feature.resource
│           ├── package_and_privilege_feature.resource
│           ├── installation_appointment_feature.resource
│           ├── order_submission_e2e_feature.resource
│           └── registration_feature.resource # High-level registration workflows
│
├── imports/                              # Unified Resource Import Hubs
│   ├── import_locators.resource
│   ├── import_pages.resource
│   ├── import_features.resource
│   └── import_common_components.resource
│
├── settings/                             # Environment & Linter Configurations
│   ├── sit/settings.yaml
│   ├── uat/settings.yaml
│   └── robocop/settings.cfg
│
├── testdata/                             # Externalized Multi-Environment Test Data
│   ├── sit/testdata.yaml
│   └── uat/testdata.yaml
│
└── testcases/                            # Robot Framework Test Suites
    ├── tc_tol_e2e_01_green_coverage_standalone.robot
    ├── tc_tol_e2e_02_yellow_coverage_overcable_approval.robot
    ├── tc_tol_e2e_03_convergence_2p_tmh_bundle.robot
    ├── tc_tol_e2e_04_convergence_4p_e2e_order.robot
    └── tc_tol_e2e_05_registration_lifecycle.robot
```

---

## 🧑‍💼 Role-Specific Deliverables Summary

### 1. Business Analyst (BA) Specification
- **Path**: `docs/01_BA_Business_Analysis_Specification.md`
- **Highlights**:
  - Detailed actor matrix: Sales Agent (DLR/CODO), Customer, GIS Team, Downstream Fulfillment (HL/iOM).
  - High-level business process flows and decision points.
  - Business rules for coverage classification (Green, Yellow with `TC Approve Flag`, Red with Waiting list).
  - Convergence bundling rules: 1P, 2POTT, 3POTT, 4POTT.
  - Biometric KYC, OCR, Fraud TMV credit rules, and appointment slot locking logic.

### 2. Product Owner (PO) Specification
- **Path**: `docs/02_PO_Product_Owner_Specification.md`
- **Highlights**:
  - Strategic vision and customer conversion KPIs.
  - Jira Epic Breakdown (`THL-1087`, `THL-1089`, `THL-1090`, `THL-1091`, `THL-1092`, `THL-1095`).
  - Sprint user stories with formal **Gherkin Acceptance Criteria (Given-When-Then)**.
  - Definition of Ready (DoR) and Definition of Done (DoD).

### 3. Business & Product Requirements Document (BRD / PRD)
- **Path**: `docs/03_TOL_Requirements_Document_BRD_PRD.md`
- **Highlights**:
  - Comprehensive technical specifications for all **23 functional modules** from customer documentation.
  - Architectural context diagram and downstream API contracts (`tolSubmit`, `tolGetTmhEligibility`, `SMARTUI-validateTMVFraudAndBlackList`).
  - S3 file storage policies and regulatory compliance standards (PDPA & NBTC).

### 4. Traceability Matrix
- **Path**: `docs/04_Traceability_Matrix_And_Test_Mapping.md`
- **Highlights**:
  - Bi-directional matrix mapping customer Excel test cases $\leftrightarrow$ Jira Epics $\leftrightarrow$ User Stories $\leftrightarrow$ Page Objects $\leftrightarrow$ Automated Test Cases.

---

## 🎯 How to Present in Visual Studio to the Customer

When presenting this project in Visual Studio or VS Code:
1. **Open Workspace Folder**: Open `c:\Users\frank\Vasup\TOL` in Visual Studio.
2. **Showcase Requirements Alignment**:
   - Open `docs/04_Traceability_Matrix_And_Test_Mapping.md` to demonstrate how every single module from their Excel files is mapped.
   - Walk through `docs/01_BA_Business_Analysis_Specification.md` and `docs/02_PO_Product_Owner_Specification.md` to show deep understanding of TrueOnline business logic.
3. **Showcase Visual Studio File Structure (`.locator`, `.page`, `.features`)**:
   - Highlight `.locator/` showing clean element separation.
   - Highlight `.page/` showing encapsulated screen logic.
   - Highlight `.features/` showing BDD acceptance criteria readable by business stakeholders.
4. **Showcase Company Standard Architecture**:
   - Open `common/common.resource` to demonstrate the centralized primitive engine: all low-level selenium waits, clicks, inputs, and validations are maintained in one place.
   - Open `imports/imports.resource` to demonstrate master imports that eliminate repetitive code across tests.
   - Open `keywords/tol/pages/` and `keywords/tol/features/` to show separation of concerns: low-level page interactions vs reusable business workflows.
   - Open `testcases/tc_tol_e2e_01_green_coverage_standalone.robot` to demonstrate how clean, readable, and maintainable the end-to-end tests are (under 10 lines of test logic).

---

## ⚡ Company Standard Philosophy: "Use As Much As Less Code As Possible"

The framework strictly adheres to the principle of minimal test code and zero boilerplate:

1. **Centralized Primitives (`common/common.resource`)**:
   - Every browser wait, click, input, scroll, frame switch, and assertion lives exclusively in `common/`.
   - Page objects never write raw Selenium loops or hardcoded timeouts; they delegate directly to `common.*` (e.g. `common.Click element when ready`, `common.Input text when ready`).

2. **One-Line Page Objects (`keywords/tol/pages/`)**:
   - Each page keyword is a concise 1-line or 2-line wrapper over `common.*` coupled with locators.

3. **Minimalist Test Cases (`testcases/`)**:
   - Test cases only declare 4–7 high-level business feature keywords:

```robot
*** Test Cases ***
TC_TOL_NEW_MODULE_EXAMPLE
    common.Open chrome browser      ${application['base_url']}
    check_coverage_feature.Verify And Confirm Green Coverage Feasibility    ${addresses['green_coverage']['query']}
    select_bundle_package_feature.Select Standalone 1P Broadband Online Channel
    package_and_privilege_feature.Select Package With General Public Privilege    media_tech=FTTH    offer_code=FTTH_500M
    ${order_id}=    order_submission_e2e_feature.Review Contract Sign And Submit Order    ...
    Should Not Be Empty    ${order_id}
```

---

## 🌐 Interactive Test Report & Web Simulation

- **Live Application File**: `index.html` (self-contained interactive dashboard and test execution runner)
- **Online URL**: `www.franktest.online` / `www.franktest.xyz`
- **Deployment Guide**: `docs/05_Deployment_And_Hosting_Guide_FrankTest.md`
