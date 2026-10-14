# Sprint Plan: Week of 12 October 2026
## True Online (TOL) Automation Testing & Registration Onboarding (One App)

---

### Document Control & Cadence Metadata
- **Sprint Cycle**: Week 42 (12 October 2026 – 18 October 2026)
- **Cadence**: Weekly Sprint Cycle (Planning & Backlog Grooming every Monday)
- **Project**: True Online (TOL) Automation Testing Standard & Onboarding Platform
- **Sprint Lead / Owner**: QA Automation Lead (Frank)
- **Team**: QA Automation Engineers, BA, PO, VASUP Integration Team
- **Version**: 1.0 (Live Sprint Document)
- **Last Updated**: Wednesday, 14 October 2026 (Mid-Sprint Tracking)

---

## 1. Sprint Objective & Commitment

### Primary Sprint Goal
> *"Stabilize and deliver the Enterprise True Online (TOL) Automation Testing Framework adhering strictly to the Company Standard (`Example_By_BAS`), enforce the 'minimal test code' philosophy via a centralized `common/` engine, integrate the end-to-end Registration Hub (Module 00), verify 100% dry-run pass rate across all 5 E2E test suites, and deliver role-specific executive documentation in Microsoft Word & WPS Office format for customer presentation in Visual Studio."*

### Key Deliverables for This Week:
1. **Centralized Common Architecture (`common/common.resource`)**:
   - Centralize all low-level Selenium waits, clicks, inputs, frame switches, and verifications into a single reusable hub.
   - Refactor all 10 page objects so each keyword is a concise 1-line delegation to `common.*`.
2. **Registration Module Integration Across All Layers**:
   - Add `.locator/registration.locator` & `locators/registration_locator.resource`.
   - Add `.page/registration.page` & `keywords/tol/pages/registration_page.resource`.
   - Add `.features/registration.feature` & `keywords/tol/features/registration_feature.resource`.
   - Implement `testcases/tc_tol_e2e_05_registration_lifecycle.robot`.
3. **5/5 Test Suite Verification**:
   - Execute dry runs across all 5 Robot Framework suites (`tc_tol_e2e_01` to `05`) with 100% PASS rate.
4. **Visual Studio Presentation Readiness**:
   - Verify root directories `.page/`, `.features/`, and `.locator/` are clean and immediately inspectable in Visual Studio Solution Explorer.
5. **Executive Documentation in Word Format (`.docx`)**:
   - Generate styled Microsoft Word & WPS Office documents for BA, PO, PRD/BRD, Traceability Matrix, Deployment Guide, and Sprint Plan.
6. **Live Interactive Report & Simulation Portal**:
   - Prepare `index.html` for publishing to personal domain `www.franktest.online` / `www.franktest.xyz`.

---

## 2. Daily Execution Schedule (12 Oct – 18 Oct 2026)

| Day & Date | Planned Activities & Milestones | Status | Highlights & Output |
| :--- | :--- | :---: | :--- |
| **Monday, 12 Oct 2026**<br>*(Sprint Planning Day)* | • Sprint Planning & Backlog Review from customer `GivenDoc` & `F:\VASUP\0038_TOL`.<br>• Scope definition for Release 1.1 Backlog (Modules 01–23).<br>• Define company standard alignment with `Standard/Example_By_BAS`. | **DONE** | Sprint backlog locked; Visual Studio folder blueprint established. |
| **Tuesday, 13 Oct 2026** | • Refactor `common/common.resource` with centralized explicit wait primitives.<br>• Implement 1-line delegation pattern in all page objects (`service_type`, `customer_id`, `kyc`, `privilege`, `package`, `appointment`, `order_review`, `order_submit`).<br>• Synchronize `imports/imports.resource`. | **DONE** | Master `common/` engine completed; boilerplate code eliminated across page objects. |
| **Wednesday, 14 Oct 2026**<br>*(Current Day)* | • Implement Registration Hub across all 3 layers: `.locator`, `.page`, `.features`.<br>• Author and verify `tc_tol_e2e_05_registration_lifecycle.robot`.<br>• Convert all Markdown specifications into Microsoft Word & WPS format (`.docx`).<br>• Update BA, PO, PRD, and Traceability Matrix documents.<br>• Full test dry-run execution (5 suites, 5 passed). | **DONE** | All 5 test suites pass; 6 executive Word `.docx` documents generated. |
| **Thursday, 15 Oct 2026** | • Visual Studio Customer Walkthrough Dry-Run.<br>• Review `.page`, `.features`, `.locator` in VS Code / Visual Studio Solution Explorer.<br>• Validate multi-environment test data (`settings/sit`, `testdata/sit`).<br>• Test interactive web simulation app `index.html` locally on port 8080. | **IN PROGRESS** | Visual Studio rehearsal; demo environment readiness check. |
| **Friday, 16 Oct 2026**<br>*(Sprint Review & Demo)* | • Formal Client Demo & Presentation in Visual Studio.<br>• Showcase 4-line test case authoring and separation of concerns.<br>• Deploy live interactive test reports to `www.franktest.online`.<br>• Sprint Retrospective: review velocity, code coverage, and customer feedback. | **TO DO** | Customer acceptance sign-off; production deployment to FrankTest. |
| **Saturday, 17 Oct 2026** | • Buffer day: Address any minor customer feedback or adjustments.<br>• Clean up temporary logs and backup reports into `reports/`. | **TO DO** | Framework maintenance & clean state. |
| **Sunday, 18 Oct 2026** | • Sprint wrap-up & KPI metrics calculation.<br>• Prepare Monday Sprint Backlog for next sprint cycle (Sprint Week 43: 19 Oct 2026). | **TO DO** | Next Monday backlog draft ready. |

---

## 3. Sprint Backlog & Task Breakdown

| Task ID | Jira Ref / Epic | Description | Module | Assignee | Est. (SP) | Status |
| :--- | :--- | :--- | :--- | :---: | :---: | :---: |
| **TSK-42-01** | `THL-1089` | Build Centralized `common/common.resource` wait & interaction primitives | Architecture | Frank | 5 | **DONE** |
| **TSK-42-02** | `THL-1089` | Refactor 10 Page Objects to 1-line calls delegating to `common.*` | Keywords/Pages | Frank | 8 | **DONE** |
| **TSK-42-03** | `THL-1089`, `1095` | Create Registration Hub `.locator/registration.locator` & Robot locators | Registration | Frank | 3 | **DONE** |
| **TSK-42-04** | `THL-1089`, `1095` | Create `.page/registration.page` & `keywords/tol/pages/registration_page.resource` | Registration | Frank | 5 | **DONE** |
| **TSK-42-05** | `THL-1089`, `1095` | Create `.features/registration.feature` BDD Gherkin scenarios | Registration | Frank | 3 | **DONE** |
| **TSK-42-06** | `THL-1089` | Implement `registration_feature.resource` workflow keywords | Registration | Frank | 5 | **DONE** |
| **TSK-42-07** | `THL-1089` | Author & verify `tc_tol_e2e_05_registration_lifecycle.robot` | Testcases | Frank | 5 | **DONE** |
| **TSK-42-08** | Quality Gate | Execute full test suite dry-run (5 test cases, all passed) | Test Suite | Frank | 3 | **DONE** |
| **TSK-42-09** | Documentation | Convert all specifications to Microsoft Word & WPS format (`.docx`) | Docs | Frank | 5 | **DONE** |
| **TSK-42-10** | Presentation | Customer Presentation in Visual Studio (Showcase `.locator`, `.page`, `.features`) | Client Facing | Frank | 8 | **IN PROGRESS** |
| **TSK-42-11** | Deployment | Publish interactive test portal to `www.franktest.online` | Hosting | Frank | 3 | **TO DO** |
| **TSK-42-12** | Governance | Weekly Sprint Retrospective & Next Monday (19 Oct) Backlog Grooming | Agile | Frank | 2 | **TO DO** |

**Total Sprint Story Points**: **55 SP** | **Completed**: **42 SP (76%)** | **In Progress**: **8 SP (15%)** | **Remaining**: **5 SP (9%)**

---

## 4. Test Automation Coverage & Execution Status (Sprint Week 42)

| Test Suite | Scenario Covered | Tags | Status | Run Time |
| :--- | :--- | :--- | :---: | :---: |
| [`tc_tol_e2e_01`](file:///c:/Users/frank/Vasup/TOL/testcases/tc_tol_e2e_01_green_coverage_standalone.robot) | Register Standalone 1P Broadband Success with Green SGIS Coverage | `smoke`, `p0`, `e2e` | **PASS** | < 4s (dryrun) |
| [`tc_tol_e2e_02`](file:///c:/Users/frank/Vasup/TOL/testcases/tc_tol_e2e_02_yellow_coverage_overcable_approval.robot) | Register Broadband with Yellow Over-Cable Drop Wire Fee Approval | `regression`, `yellow`, `p1` | **PASS** | < 4s (dryrun) |
| [`tc_tol_e2e_03`](file:///c:/Users/frank/Vasup/TOL/testcases/tc_tol_e2e_03_convergence_2p_tmh_bundle.robot) | Register Convergence 2P Bundle with TrueMove H FMC Subscriber Discount | `convergence`, `fmc`, `p0` | **PASS** | < 4s (dryrun) |
| [`tc_tol_e2e_04`](file:///c:/Users/frank/Vasup/TOL/testcases/tc_tol_e2e_04_convergence_4p_e2e_order.robot) | Register Full Convergence 4POTT Quad-Play (TOL + TMH + TrueID + FLP) | `convergence`, `4pott`, `p0` | **PASS** | < 4s (dryrun) |
| [`tc_tol_e2e_05`](file:///c:/Users/frank/Vasup/TOL/testcases/tc_tol_e2e_05_registration_lifecycle.robot) | End-to-End Registration Hub with Partner Code, RTR Attribution & PDPA | `registration`, `smoke`, `p0` | **PASS** | < 4s (dryrun) |

**Overall Pass Rate**: **100% (5 / 5 suites passed)**

---

## 5. Risks, Dependencies & Mitigation Strategy

| # | Risk / Blocker | Impact | Severity | Mitigation Action | Owner |
| :---: | :--- | :--- | :---: | :--- | :---: |
| **1** | **Customer Presentation Environment in Visual Studio**: Customer requests seeing how new test cases are added without complex coding. | High | Medium | Prepared 5-line test case template in `testcases/` proving how `common/` eliminates boilerplate. | Frank |
| **2** | **Drop Wire Over-Cable Approval Delay**: Yellow coverage scenarios require supervisor approval for rental properties. | Medium | Low | Automated test stubs handle both `TC Approve Flag = Y` (free waiver) and `TC Approve Flag = N` (customer payment). | Frank |
| **3** | **Biometric Face Liveness in CI/CD**: Camera device required for physical biometric verification. | High | Low | Automated test suite includes stubbed KYC token bypassing physical camera while asserting backend KYC status badge. | Frank |

---

## 6. Monday Recurring Update Template

*Instructions: Every Monday morning, copy the template block below, increment the Sprint Week number, set the date range, adjust the sprint objectives and backlog items, and update the document.*

```markdown
### 📋 Sprint Information Template
- **Sprint Cycle**: Week [WW] ([DD Month YYYY] – [DD Month YYYY])
- **Cadence**: Weekly Sprint (Updated every Monday)
- **Status**: [Active / Planned / Completed]
- **Sprint Lead**: Frank

### 🎯 Sprint Goals
1. [Goal 1]
2. [Goal 2]
3. [Goal 3]

### 📊 Task Breakdown
| Task ID | Description | Assignee | Est. SP | Status |
|---|---|---|---|---|
| TSK-[WW]-01 | ... | Frank | ... | [To Do / In Progress / Done] |

### 🧪 Test Automation Target
- Target Test Cases: [List of Robot suites]
- Target Pass Rate: 100%
```

---

## 7. Deliverable Document Artifacts

All sprint documentation is compiled in both Markdown and Microsoft Word / WPS Office (`.docx`):
1. **Sprint Plan (Current)**: [`07_Sprint_Plan_Week_12Oct2026.docx`](file:///c:/Users/frank/Vasup/TOL/docs/07_Sprint_Plan_Week_12Oct2026.docx)
2. **BA Specification**: [`01_BA_Business_Analysis_Specification.docx`](file:///c:/Users/frank/Vasup/TOL/docs/01_BA_Business_Analysis_Specification.docx)
3. **PO Specification**: [`02_PO_Product_Owner_Specification.docx`](file:///c:/Users/frank/Vasup/TOL/docs/02_PO_Product_Owner_Specification.docx)
4. **Requirements Document (BRD/PRD)**: [`03_TOL_Requirements_Document_BRD_PRD.docx`](file:///c:/Users/frank/Vasup/TOL/docs/03_TOL_Requirements_Document_BRD_PRD.docx)
5. **Traceability Matrix**: [`04_Traceability_Matrix_And_Test_Mapping.docx`](file:///c:/Users/frank/Vasup/TOL/docs/04_Traceability_Matrix_And_Test_Mapping.docx)
6. **Deployment Guide**: [`05_Deployment_And_Hosting_Guide_FrankTest.docx`](file:///c:/Users/frank/Vasup/TOL/docs/05_Deployment_And_Hosting_Guide_FrankTest.docx)
7. **Overview**: [`00_TOL_Automation_Testing_Standard_Overview.docx`](file:///c:/Users/frank/Vasup/TOL/docs/00_TOL_Automation_Testing_Standard_Overview.docx)
