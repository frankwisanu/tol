# Hosting & Deployment Guide: `www.franktest.online`
## TrueOnline (TOL) Automation Standard & Test Report Portal

---

### Overview
This guide provides the deployment steps to publish the **TrueOnline (TOL) Live Interactive Sample & Test Report Portal** (`c:\Users\frank\Vasup\TOL\index.html`) to your personal domain **`www.franktest.online`** (or **`www.franktest.xyz/tol/`**).

---

## 🚀 Deployment Options

### Option 1: Direct Subpath Deployment on GitHub Pages / Static Hosting (Recommended)
If your website (`www.franktest.online` or `www.franktest.xyz`) is hosted via GitHub Pages:
1. Create a subfolder `tol/` inside your website repository root.
2. Copy `c:\Users\frank\Vasup\TOL\index.html` into `tol/index.html`.
3. Add the project card snippet from [`06_Home_QA_Tutor_Project_Card_Integration.html`](file:///c:/Users/frank/Vasup/TOL/docs/06_Home_QA_Tutor_Project_Card_Integration.html) into your homepage (`home.html` under sections `#qa-tutor` and `#portfolio`).
4. Commit and push:
   ```bash
   git add tol/index.html home.html
   git commit -m "feat: add TrueOnline (TOL) Automation Testing Standard & Live Portal"
   git push origin main
   ```
5. Your live interactive sample and test reports will be immediately accessible at:
   👉 **`https://www.franktest.online/tol/`** (or `https://www.franktest.xyz/tol/`)

---

### Option 2: Instant Local Host & Cloudflare Free Tunnel
If you want to present the live portal directly from this machine with zero cloud upload:

1. **Launch Local Web Server** (in PowerShell):
   ```powershell
   cd c:\Users\frank\Vasup\TOL
   python -m http.server 8080
   ```
2. **Open Cloudflare Free Tunnel** (if cloudflared is installed or using npx localtunnel):
   ```powershell
   npx localtunnel --port 8080 --subdomain franktest-tol
   ```
   *Instantly gives you a public HTTPS URL accessible to any customer or mobile phone.*

---

### Option 3: Local Customer Demo in Visual Studio
To present the live sample and test reports to your customer during your Visual Studio walkthrough:
1. Right-click [`c:\Users\frank\Vasup\TOL\index.html`](file:///c:/Users/frank/Vasup/TOL/index.html) in Visual Studio.
2. Select **"Open with Live Server"** (or open directly in Chrome / Edge).
3. The interactive portal includes:
   - **Live App Simulator**: Walk the customer step-by-step through SGIS Coverage, Multi-Play bundling, and e-KYC.
   - **Test Results Table**: Showcase execution results across all 23 Excel validation modules.
   - **Document Viewer**: Show the BA, PO, and BRD/PRD specifications.
   - **Architecture Tab**: Show the `.locator`, `.page`, and `.features` breakdown.
