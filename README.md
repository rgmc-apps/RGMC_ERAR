<div align="center">

# <span style="color:#A07320">RGMC API Extension</span>

<span style="color:#666">Business Central AL extension for RGMC inventory cutoff management and OData API exposure</span>

[![AL Language](https://img.shields.io/badge/Language-AL-0078D4?style=flat-square&logo=microsoft)](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-programming-in-al)
[![Business Central](https://img.shields.io/badge/Business%20Central-27.x-0078D4?style=flat-square&logo=dynamics365)](https://learn.microsoft.com/en-us/dynamics365/business-central/)
[![LS Central](https://img.shields.io/badge/LS%20Central-27.1.8.3261-00A9CE?style=flat-square)](https://www.lsretail.com/)
[![Runtime](https://img.shields.io/badge/AL%20Runtime-16.1-blueviolet?style=flat-square)](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-runtime-packages)
[![License](https://img.shields.io/badge/License-Private-red?style=flat-square)](./LICENSE)

</div>

---

## 📋 Table of Contents

- [Overview](#-overview)
- [Tech Stack](#-tech-stack)
- [Features](#-features)
- [Pages, Reports & APIs](#-pages-reports--apis)
- [Project Structure](#-project-structure)
- [Setup & Installation](#-setup--installation)
- [Launch Configuration](#-launch-configuration)
- [Building & Publishing](#-building--publishing)
- [API Endpoints](#-api-endpoints)
- [Data Model](#-data-model)
- [Generate Cutoffs Flow](#-generate-cutoffs-flow)
- [Authentication Flow](#-authentication-flow)
- [Core Data Flow](#-core-data-flow)
- [License](#-license)

---

## 🔍 Overview

**RGMC API Extension** is a Microsoft Dynamics 365 Business Central AL extension built for **RGMC** (published under RGMC Publisher). It introduces inventory **cutoff period management** directly within Business Central, exposing structured OData v4 REST API endpoints consumable by external systems.

The extension was designed around three core needs:

1. **Cutoff Period Tracking** — A dedicated table and UI for defining and activating monthly inventory cutoff windows (start date → end date).
2. **Automated Generation** — A processing report that auto-generates monthly cutoff periods across a configurable date range, skipping duplicates and auto-activating the current period.
3. **API Exposure** — OData v4 API pages for both the custom Cutoff table and the standard BC Item Ledger Entry table, enabling external inventory systems to read and write data via REST.

The extension targets a **UAT Sandbox** environment and is built on top of LS Central (retail), Base Application, PHCAS, PHTAX, and the existing RGMC Customization extension.

---

## 🛠 Tech Stack

| Layer | Technology | Version |
|---|---|---|
| Language | AL (Application Language) | Runtime 16.1 |
| Platform | Microsoft Dynamics 365 Business Central | 27.5.0.0 (Application) / 27.0.0.0 (Platform) |
| Base Dependency | Base Application (Microsoft) | 27.5.46862.50615 |
| Retail Platform | LS Central (LS Retail) | 27.1.8.3261 |
| Tax Module | PHTAX (Associates 365) | 27.3.0.0 |
| Accounting Module | PHCAS (Associates 365) | 27.1.0.4 |
| Base Extension | RGMC Customization (Associates 365) | 26.0.0.20 |
| System Library | System Application (Microsoft) | 27.5.46862.46929 |
| IDE | Visual Studio Code + AL Language Extension | Latest |
| API Protocol | OData v4 (Business Central Web Services) | v1.0 |

---

## ✨ Features

### <span style="color:#2a9d8f">📦 Cutoff List Management</span>

- Custom `RGMC Cutoff List` table (ID 50300) storing monthly inventory cutoff periods
- Fields: `Cutoff ID` (auto-increment PK), `Start Date`, `End Date`, `Active` flag
- Built-in validation: End Date cannot precede Start Date
- Secondary index on `(Start Date, End Date)` for efficient date-range queries
- DropDown field group for lookup/drilldown pages

### <span style="color:#2a9d8f">🖥 List & Card UI</span>

- **Cutoff List Page** (50300) — read-only repeater view, searchable via BC's `UsageCategory = Lists`
- **Cutoff Card Page** (50301) — editable card for individual period records
- Notes and Links FactBoxes on both pages
- `Set Active` / `Set Inactive` actions promoted to the ribbon on both pages

### <span style="color:#2a9d8f">⚙️ Automated Period Generation</span>

- Processing report (50302) with a request page UI
- User specifies **Start Date** and **End Date**; defaults to current month through 12 months forward
- Generates one monthly period per calendar month in the range
- Auto-marks only the period containing **today** as `Active = true`
- Skips already-existing periods; reports counts of created vs. skipped at completion

### <span style="color:#2a9d8f">🌐 OData REST API — Cutoff</span>

- Full CRUD via OData v4 on the `RGMC Cutoff List` table
- Publisher: `rgmc` | Group: `inventory` | Version: `v1.0`
- Entity set: `cutoffs` | Key: `systemId` (GUID)
- Fields exposed: `systemId`, `cutoffId`, `startDate`, `endDate`, `active`

### <span style="color:#2a9d8f">🌐 OData REST API — Item Ledger Entry</span>

- Full CRUD via OData v4 on BC's standard `Item Ledger Entry` table
- Entity set: `itemLedgerEntries` | Key: `systemId` (GUID)
- 22 fields exposed including quantities, dates, tracking (lot/serial), dimensions, and document references

---

## 📄 Pages, Reports & APIs

### <span style="color:#2a9d8f">🖥 UI Objects</span>

| Object Type | ID | Name | Page Type | Source Table | Usage |
|---|---|---|---|---|---|
| Table | 50300 | RGMC Cutoff List | — | — | Stores cutoff periods |
| Page | 50300 | RGMC Cutoff List | List | RGMC Cutoff List | Browse & manage cutoffs |
| Page | 50301 | RGMC Cutoff Card | Card | RGMC Cutoff List | Edit a single cutoff |
| Report | 50302 | RGMC Generate Cutoffs | ProcessingOnly | — | Auto-generate monthly periods |

> 📌 **Page 50300** appears in the BC search/navigation via `UsageCategory = Lists`.
> **Report 50302** appears under `UsageCategory = Tasks`.

### <span style="color:#2a9d8f">🌐 API Pages</span>

| Object Type | ID | Name | Entity Set | Source Table |
|---|---|---|---|---|
| Page (API) | 50303 | RGMC Cutoff API | `cutoffs` | RGMC Cutoff List |
| Page (API) | 50304 | RGMC Item Ledger Entry API | `itemLedgerEntries` | Item Ledger Entry |

---

## 📁 Project Structure

```
RGMC_ERAR_AL/
│
├── app.json                          # Extension manifest — ID, name, version, dependencies, ID range
│
├── .vscode/
│   └── launch.json                   # VS Code debug/publish config — tenant, environment, startup object
│
├── RGMCCutoffList.Table.al           # Table 50300: RGMC Cutoff List
│                                     #   Fields: Cutoff ID, Start Date, End Date, Active
│                                     #   Keys: PK (Cutoff ID), DateKey (Start Date, End Date)
│
├── RGMCCutoffList.Page.al            # Page 50300: Cutoff List (List)
│                                     #   Actions: Generate Cutoffs, Set Active, Set Inactive
│
├── RGMCCutoffCard.Page.al            # Page 50301: Cutoff Card (Card)
│                                     #   Actions: Set Active, Set Inactive
│
├── RGMCGenerateCutoffs.Report.al     # Report 50302: RGMC Generate Cutoffs (ProcessingOnly)
│                                     #   Request page: Start Date, End Date
│                                     #   Logic: monthly period loop, duplicate skip, auto-activate
│
├── RGMCCutoffAPI.Page.al             # Page 50303: RGMC Cutoff API (API)
│                                     #   OData: rgmc / inventory / v1.0 / cutoffs
│
└── RGMCItemLedgerEntryAPI.Page.al    # Page 50304: RGMC Item Ledger Entry API (API)
                                      #   OData: rgmc / inventory / v1.0 / itemLedgerEntries
```

---

## 🚀 Setup & Installation

### <span style="color:#2a9d8f">Prerequisites</span>

- [Visual Studio Code](https://code.visualstudio.com/)
- [AL Language Extension for VS Code](https://marketplace.visualstudio.com/items?itemName=ms-dynamics-smb.al) (Microsoft)
- Access to the RGMC **UAT** Business Central Sandbox (Tenant: `ca3ca144-09d9-42dd-920a-c72aedd54dd6`)
- Microsoft 365 account with BC developer license

### <span style="color:#2a9d8f">Clone & Open</span>

```bash
git clone <repository-url>
cd RGMC_ERAR_AL
code .
```

### <span style="color:#2a9d8f">Download Symbols</span>

After opening in VS Code, download all dependency symbols:

```
Ctrl + Shift + P  →  AL: Download Symbols
```

This pulls symbols for all six dependencies declared in `app.json` from the UAT sandbox. You must be authenticated to the tenant before running this.

---

## ⚙️ Launch Configuration

Configuration lives in `.vscode/launch.json`. No `.env` files are used — all settings are in the launch config.

| Setting | Value | Purpose |
|---|---|---|
| `name` | `Microsoft cloud sandbox` | Configuration label shown in VS Code |
| `request` | `launch` | Launches BC in browser on publish |
| `type` | `al` | AL Language extension handler |
| `environmentType` | `Sandbox` | Targets a sandbox (non-production) environment |
| `environmentName` | `UAT` | Named environment within the tenant |
| `tenant` | `ca3ca144-09d9-42dd-920a-c72aedd54dd6` | AAD tenant GUID for RGMC |
| `startupObjectId` | `22` | Page 22 (Customer List) opens on launch |
| `startupObjectType` | `Page` | Object type for startup |
| `schemaUpdateMode` | `ForceSync` | Forces table schema sync on publish (dev only) |
| `breakOnError` | `All` | Debugger breaks on any error |
| `enableLongRunningSqlStatements` | `true` | Logs slow SQL in debugger |
| `enableSqlInformationDebugger` | `true` | Shows SQL query info during debug |

> ⚠️ **`schemaUpdateMode = ForceSync` is for development only.** Do not use this setting against production environments — it can cause data loss on schema-breaking changes.

---

## 📦 Building & Publishing

### <span style="color:#2a9d8f">Compile (Build)</span>

```
Ctrl + Shift + B
```

Compiles all AL objects and reports errors in the VS Code Problems panel. No `.app` file is produced until you publish.

### <span style="color:#2a9d8f">Publish to UAT Sandbox</span>

```
Alt + A, Alt + P
```

Or via the Command Palette:

```
Ctrl + Shift + P  →  AL: Publish
```

This compiles, packages a `.app` file, and deploys it to the configured UAT sandbox. The browser opens to Page 22 (Customer List) automatically upon success.

### <span style="color:#2a9d8f">Publish Without Debugging</span>

```
Ctrl + F5
```

Publishes without attaching the AL debugger — faster for routine deploys.

### <span style="color:#2a9d8f">ID Range</span>

All custom objects in this extension use IDs in the reserved range:

```
50300 → 50499
```

| Used IDs | Object |
|---|---|
| Table 50300 | RGMC Cutoff List |
| Page 50300 | RGMC Cutoff List |
| Page 50301 | RGMC Cutoff Card |
| Report 50302 | RGMC Generate Cutoffs |
| Page 50303 | RGMC Cutoff API |
| Page 50304 | RGMC Item Ledger Entry API |

---

## 🌐 API Endpoints

All endpoints follow the BC OData v4 pattern:

```
https://api.businesscentral.dynamics.com/v2.0/{tenant}/UAT/api/{publisher}/{group}/{version}/companies({companyId})/{entitySet}
```

**Base URL for this extension:**

```
https://api.businesscentral.dynamics.com/v2.0/ca3ca144-09d9-42dd-920a-c72aedd54dd6/UAT/api/rgmc/inventory/v1.0/companies({companyId})
```

---

### <span style="color:#2a9d8f">📅 Cutoff Endpoints — `/cutoffs`</span>

| Method | Path | Description |
|---|---|---|
| `GET` | `/cutoffs` | List all cutoff periods. Supports `$filter`, `$orderby`, `$top`, `$skip`. |
| `GET` | `/cutoffs({systemId})` | Retrieve a single cutoff by its GUID. |
| `POST` | `/cutoffs` | Create a new cutoff period. |
| `PATCH` | `/cutoffs({systemId})` | Update one or more fields on an existing cutoff. |
| `DELETE` | `/cutoffs({systemId})` | Delete a cutoff record. |

**POST / PATCH body shape:**

```json
{
  "startDate": "2026-06-01",
  "endDate": "2026-06-30",
  "active": true
}
```

**GET response shape:**

```json
{
  "@odata.etag": "W/\"...\",",
  "systemId": "a1b2c3d4-0000-0000-0000-000000000000",
  "cutoffId": 1,
  "startDate": "2026-06-01",
  "endDate": "2026-06-30",
  "active": true
}
```

> 💡 `cutoffId` and `systemId` are read-only — they are assigned by the system on insert and cannot be set via POST or PATCH.

**Example — filter active cutoffs:**

```
GET /cutoffs?$filter=active eq true&$orderby=startDate desc
```

---

### <span style="color:#2a9d8f">📦 Item Ledger Entry Endpoints — `/itemLedgerEntries`</span>

| Method | Path | Description |
|---|---|---|
| `GET` | `/itemLedgerEntries` | List all entries. Supports `$filter`, `$orderby`, `$top`, `$skip`. |
| `GET` | `/itemLedgerEntries({systemId})` | Retrieve a single entry by GUID. |
| `POST` | `/itemLedgerEntries` | Create a ledger entry directly. ⚠️ See note below. |
| `PATCH` | `/itemLedgerEntries({systemId})` | Update a posted entry. ⚠️ See note below. |
| `DELETE` | `/itemLedgerEntries({systemId})` | Delete a posted entry. ⚠️ See note below. |

**GET response shape:**

```json
{
  "@odata.etag": "W/\"...\",",
  "systemId": "b2c3d4e5-0000-0000-0000-000000000001",
  "entryNo": 1042,
  "itemNo": "ITEM-001",
  "postingDate": "2026-06-15",
  "entryType": "Sale",
  "sourceType": "Customer",
  "sourceNo": "CUST-001",
  "documentNo": "SI-00042",
  "documentType": "Sales Invoice",
  "description": "Item sale",
  "locationCode": "MAIN",
  "variantCode": "",
  "serialNo": "",
  "lotNo": "",
  "quantity": -5,
  "invoicedQuantity": -5,
  "remainingQuantity": 0,
  "unitOfMeasureCode": "PCS",
  "open": false,
  "positiveEntry": false,
  "globalDimension1Code": "DEPT-01",
  "globalDimension2Code": ""
}
```

**Example — filter by item and date:**

```
GET /itemLedgerEntries?$filter=itemNo eq 'ITEM-001' and postingDate ge 2026-06-01&$orderby=postingDate desc
```

> ⚠️ **Important:** `Item Ledger Entry` is a **posted accounting table**. Writing to it via POST, PATCH, or DELETE bypasses all BC posting routines and can corrupt inventory and financial data. Restrict callers to **GET only** unless you have a specific, controlled reason to write directly.

---

## 💾 Data Model

### <span style="color:#2a9d8f">Table: RGMC Cutoff List (50300)</span>

| Field | ID | Type | Constraints | Description |
|---|---|---|---|---|
| Cutoff ID | 1 | Integer | PK, AutoIncrement, Editable = false | System-assigned unique identifier |
| Start Date | 2 | Date | — | First day of the inventory cutoff period |
| End Date | 3 | Date | Must be ≥ Start Date | Last day of the inventory cutoff period |
| Active | 4 | Boolean | — | Whether this period is currently active |

**Keys:**

| Key Name | Fields | Clustered |
|---|---|---|
| PK | Cutoff ID | Yes |
| DateKey | Start Date, End Date | No |

---

## ⚙️ Generate Cutoffs Flow

The **RGMC Generate Cutoffs** report (50302) automates creation of monthly cutoff periods.

```
User clicks "Generate Cutoffs" on the Cutoff List page
          |
          v
Report 50302 opens with a Request Page
  - Start Date: defaults to first day of current month  (<-CM> of Today)
  - End Date:   defaults to 12 months forward           (<CM+11M> of Today)
          |
          v
User confirms dates → Report runs
          |
          v
Loop: PeriodStart = first day of Start Date month
          |
          +--> Check if a cutoff with same Start Date + End Date already exists
          |         |
          |    EXISTS → SkippedCount++
          |         |
          |    NOT EXISTS → Insert new record:
          |                   Start Date = first day of month  (<-CM>)
          |                   End Date   = last day of month   (<CM>)
          |                   Active     = true ONLY if Today falls within the period
          |                   CreatedCount++
          |
          +--> Advance PeriodStart by 1 month (<1M>)
          |
          v
Until PeriodStart > EndDate
          |
          v
Message: "{CreatedCount} cutoff period(s) created. {SkippedCount} already existed and were skipped."
          |
          v
Cutoff List page refreshes (CurrPage.Update)
```

---

## 🔐 Authentication Flow

BC OData APIs use **OAuth 2.0 with Azure Active Directory (AAD)**. All API consumers must authenticate against the RGMC tenant before calling any endpoint.

1. **Register an App in Azure AD** — Create an app registration in the RGMC Azure tenant (`ca3ca144-09d9-42dd-920a-c72aedd54dd6`). Grant it the `Dynamics 365 Business Central → Financials.ReadWrite.All` (or a more restricted) API permission.

2. **Obtain an Access Token** — The client requests a token from AAD using the client credentials or authorization code flow:

```
POST https://login.microsoftonline.com/ca3ca144-09d9-42dd-920a-c72aedd54dd6/oauth2/v2.0/token
Content-Type: application/x-www-form-urlencoded

grant_type=client_credentials
&client_id={appClientId}
&client_secret={appClientSecret}
&scope=https://api.businesscentral.dynamics.com/.default
```

3. **Receive Bearer Token** — AAD returns a JWT access token valid for 1 hour.

4. **Call the BC OData Endpoint** — Include the token in every request:

```
GET https://api.businesscentral.dynamics.com/v2.0/.../api/rgmc/inventory/v1.0/companies({id})/cutoffs
Authorization: Bearer {access_token}
```

5. **BC Validates the Token** — Business Central validates the token against AAD, maps the identity to a BC user with the appropriate permission sets, and processes the request.

6. **Token Refresh** — Before the 1-hour expiry, the client must re-request a new token using the same credentials flow. BC will return `401 Unauthorized` on an expired token.

---

## 🔄 Core Data Flow

**End-to-end flow: external system reads current active cutoff period**

```
External System
    |
    | 1. Authenticate → AAD (OAuth 2.0 client_credentials)
    |
    v
AAD (Azure Active Directory)
    |
    | 2. Returns Bearer Token (JWT, 1hr TTL)
    |
    v
External System
    |
    | 3. GET /cutoffs?$filter=active eq true
    |    Authorization: Bearer {token}
    |
    v
BC OData Web Service Layer
    |
    | 4. Validates token, resolves BC user, checks permissions
    |
    v
Page 50303 "RGMC Cutoff API"
    |
    | 5. Queries Table 50300 "RGMC Cutoff List"
    |    with filter: Active = true
    |
    v
Table 50300 "RGMC Cutoff List"
    |
    | 6. Returns matching records from SQL (BC database)
    |
    v
BC OData Layer
    |
    | 7. Serializes records to OData JSON response
    |
    v
External System
    |
    | 8. Parses response: reads startDate, endDate of active period
    |    Uses these dates to scope its own inventory transactions
```

---

## 🪪 License

This extension is **proprietary and private**. All rights reserved by RGMC Publisher.

Unauthorized copying, distribution, or modification of this extension or any of its AL source files is strictly prohibited.

---

<div align="center">
<span style="color:#555">Built with AL · Dynamics 365 Business Central 27.x · LS Central 27.1.8.3261</span>
</div>
