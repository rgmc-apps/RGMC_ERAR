# RGMC API Extension — Additional Endpoints

**API Base URL**
```
https://api.businesscentral.dynamics.com/v2.0/ca3ca144-09d9-42dd-920a-c72aedd54dd6/Production/api/rgmc/rgmccustom/v2.0/companies(717e34b2-e66d-f111-ab09-70a8a571e15c)/
```

All endpoints below append to the base URL above. All support `GET`, `POST`, `PATCH`, `DELETE` unless noted otherwise. All responses include a `companyName` field.

---

## LS Central Transactions

### Transaction Headers — Page 50322
**Source table:** `LSC Transaction Header` (99001472)

| Method | URL |
|--------|-----|
| GET (all) | `transactionHeaders` |
| GET (single) | `transactionHeaders({id})` |
| POST | `transactionHeaders` |
| PATCH | `transactionHeaders({id})` |
| DELETE | `transactionHeaders({id})` |

**Fields:** `id`, `storeNo`, `posTerminalNo`, `transactionNo`, `receiptNo`, `transactionDate`, `transactionTime`, `memberCardNo`, `customerNo`, `staffId`, `netAmount`, `grossAmount`, `discountAmount`, `paymentAmount`, `changeAmount`, `noOfItems`, `currencyCode`, `transStatus`, `posted`, `statementNo`, `companyName`, `lastModifiedDateTime`

**Guards:** Modify and delete blocked when `posted = true`.

**Nested sub-pages:**
```
transactionHeaders({id})/transactionSalesEntries
transactionHeaders({id})/transPaymentEntries
```

---

### Transaction Sales Entries — Page 50323
**Source table:** `LSC Transaction Sales Entry` (99001473)

| Method | URL |
|--------|-----|
| GET (all) | `transactionSalesEntries` |
| GET (single) | `transactionSalesEntries({id})` |
| GET (nested) | `transactionHeaders({id})/transactionSalesEntries` |
| POST | `transactionSalesEntries` |
| PATCH | `transactionSalesEntries({id})` |
| DELETE | `transactionSalesEntries({id})` |

**Fields:** `id`, `storeNo`, `posTerminalNo`, `transactionNo`, `lineNo`, `receiptNo`, `transactionDate`, `transactionTime`, `itemNo`, `barcodeNo`, `description`, `variantCode`, `unitOfMeasure`, `quantity`, `price`, `netPrice`, `grossAmount`, `netAmount`, `discountAmount`, `discountPercent`, `costAmount`, `itemFamilyCode`, `staffId`, `currencyCode`, `returnEntry`, `manuallyDiscounted`, `companyName`, `lastModifiedDateTime`

---

### Transaction Payment Entries — Page 50324
**Source table:** `LSC Trans. Payment Entry` (99001474)

| Method | URL |
|--------|-----|
| GET (all) | `transPaymentEntries` |
| GET (single) | `transPaymentEntries({id})` |
| GET (nested) | `transactionHeaders({id})/transPaymentEntries` |
| POST | `transPaymentEntries` |
| PATCH | `transPaymentEntries({id})` |
| DELETE | `transPaymentEntries({id})` |

**Fields:** `id`, `storeNo`, `posTerminalNo`, `transactionNo`, `lineNo`, `receiptNo`, `transactionDate`, `transactionTime`, `tenderType`, `tenderTypeDescription`, `amount`, `amountTendered`, `currencyCode`, `currencyFactor`, `cardOrAccountNo`, `eftAuthCode`, `staffId`, `returnEntry`, `companyName`, `lastModifiedDateTime`

---

### Tender Type Setups — Page 50325
**Source table:** `LSC Tender Type Setup` (99001466)

| Method | URL |
|--------|-----|
| GET (all) | `tenderTypeSetups` |
| GET (single) | `tenderTypeSetups({id})` |
| POST | `tenderTypeSetups` |
| PATCH | `tenderTypeSetups({id})` |
| DELETE | `tenderTypeSetups({id})` |

**Fields:** `id`, `code`, `description`, `function`, `openDrawer`, `glAccountNo`, `currencyCode`, `minTenderAmount`, `maxTenderAmount`, `allowOverTender`, `allowUnderTender`, `allowNegativeTender`, `roundOffAmount`, `eft`, `eftPaymentTypeNo`, `processEftManually`, `countInTillDeclarations`, `printReceipt`, `tenderTypeGroup`, `companyName`, `lastModifiedDateTime`

---

### Stores — Page 50326
**Source table:** `LSC Store` (99001470)

| Method | URL |
|--------|-----|
| GET (all) | `stores` |
| GET (single) | `stores({id})` |
| POST | `stores` |
| PATCH | `stores({id})` |
| DELETE | `stores({id})` |

**Fields:** `id`, `no`, `name`, `name2`, `address`, `address2`, `city`, `county`, `postCode`, `countryRegionCode`, `phoneNo`, `email`, `currencyCode`, `locationCode`, `inventoryLocationCode`, `responsibilityCenter`, `defaultCustomerNo`, `genBusPostingGroup`, `vatBusPostingGroup`, `customerPostingGroup`, `taxGroupCode`, `openingTime`, `closingTime`, `blocked`, `companyName`, `lastModifiedDateTime`

**Guards:** Delete blocked unless `blocked = true`.

---

## Transfer Orders

### Transfer Headers — Page 50327
**Source table:** `Transfer Header` (5740)

| Method | URL |
|--------|-----|
| GET (all) | `transferHeaders` |
| GET (single) | `transferHeaders({id})` |
| POST | `transferHeaders` |
| PATCH | `transferHeaders({id})` |
| DELETE | `transferHeaders({id})` |

**Fields:** `id`, `no`, `transferFromCode`, `transferFromName`, `transferToCode`, `transferToName`, `inTransitCode`, `postingDate`, `shipmentDate`, `receiptDate`, `status`, `directTransfer`, `externalDocumentNo`, `shortcutDimension1Code`, `shortcutDimension2Code`, `completelyShipped`, `completelyReceived`, `companyName`, `lastModifiedDateTime`

**Guards:** Modify and delete blocked when `status = Released`.

**Nested sub-page:**
```
transferHeaders({id})/transferLines
```

---

### Transfer Lines — Page 50328
**Source table:** `Transfer Line` (5741)

| Method | URL |
|--------|-----|
| GET (all) | `transferLines` |
| GET (single) | `transferLines({id})` |
| GET (nested) | `transferHeaders({id})/transferLines` |
| POST | `transferLines` |
| PATCH | `transferLines({id})` |
| DELETE | `transferLines({id})` |

**Fields:** `id`, `documentNo`, `lineNo`, `itemNo`, `description`, `description2`, `variantCode`, `unitOfMeasureCode`, `qtyPerUnitOfMeasure`, `quantity`, `qtyToShip`, `quantityShipped`, `qtyToReceive`, `quantityReceived`, `outstandingQuantity`, `shipmentDate`, `receiptDate`, `transferFromCode`, `transferToCode`, `inTransitCode`, `shortcutDimension1Code`, `shortcutDimension2Code`, `companyName`, `lastModifiedDateTime`

---

### Transfer Shipment Headers — Page 50329
**Source table:** `Transfer Shipment Header` (5744)

| Method | URL |
|--------|-----|
| GET (all) | `transferShipmentHeaders` |
| GET (single) | `transferShipmentHeaders({id})` |
| POST | `transferShipmentHeaders` |
| PATCH | `transferShipmentHeaders({id})` |
| DELETE | `transferShipmentHeaders({id})` |

**Fields:** `id`, `no`, `transferFromCode`, `transferFromName`, `transferToCode`, `transferToName`, `inTransitCode`, `postingDate`, `shipmentDate`, `transferOrderNo`, `externalDocumentNo`, `shortcutDimension1Code`, `shortcutDimension2Code`, `companyName`, `lastModifiedDateTime`

**Nested sub-page:**
```
transferShipmentHeaders({id})/transferShipmentLines
```

---

### Transfer Shipment Lines — Page 50330
**Source table:** `Transfer Shipment Line` (5745)

| Method | URL |
|--------|-----|
| GET (all) | `transferShipmentLines` |
| GET (single) | `transferShipmentLines({id})` |
| GET (nested) | `transferShipmentHeaders({id})/transferShipmentLines` |
| POST | `transferShipmentLines` |
| PATCH | `transferShipmentLines({id})` |
| DELETE | `transferShipmentLines({id})` |

**Fields:** `id`, `documentNo`, `lineNo`, `itemNo`, `description`, `description2`, `variantCode`, `unitOfMeasureCode`, `qtyPerUnitOfMeasure`, `quantity`, `transferOrderNo`, `transferOrderLineNo`, `transferFromCode`, `transferToCode`, `shortcutDimension1Code`, `shortcutDimension2Code`, `companyName`, `lastModifiedDateTime`

---

### Transfer Receipt Headers — Page 50331
**Source table:** `Transfer Receipt Header` (5746)

| Method | URL |
|--------|-----|
| GET (all) | `transferReceiptHeaders` |
| GET (single) | `transferReceiptHeaders({id})` |
| POST | `transferReceiptHeaders` |
| PATCH | `transferReceiptHeaders({id})` |
| DELETE | `transferReceiptHeaders({id})` |

**Fields:** `id`, `no`, `transferFromCode`, `transferFromName`, `transferToCode`, `transferToName`, `inTransitCode`, `postingDate`, `transferOrderNo`, `externalDocumentNo`, `shortcutDimension1Code`, `shortcutDimension2Code`, `companyName`, `lastModifiedDateTime`

**Nested sub-page:**
```
transferReceiptHeaders({id})/transferReceiptLines
```

---

### Transfer Receipt Lines — Page 50332
**Source table:** `Transfer Receipt Line` (5747)

| Method | URL |
|--------|-----|
| GET (all) | `transferReceiptLines` |
| GET (single) | `transferReceiptLines({id})` |
| GET (nested) | `transferReceiptHeaders({id})/transferReceiptLines` |
| POST | `transferReceiptLines` |
| PATCH | `transferReceiptLines({id})` |
| DELETE | `transferReceiptLines({id})` |

**Fields:** `id`, `documentNo`, `lineNo`, `itemNo`, `description`, `description2`, `variantCode`, `unitOfMeasureCode`, `qtyPerUnitOfMeasure`, `quantity`, `transferOrderNo`, `transferOrderLineNo`, `transferFromCode`, `transferToCode`, `shortcutDimension1Code`, `shortcutDimension2Code`, `companyName`, `lastModifiedDateTime`

---

## Sales Archives

### Sales Header Archives — Page 50333
**Source table:** `Sales Header Archive` (5107)

| Method | URL |
|--------|-----|
| GET (all) | `salesHeaderArchives` |
| GET (single) | `salesHeaderArchives({id})` |
| POST | `salesHeaderArchives` |
| PATCH | `salesHeaderArchives({id})` |
| DELETE | `salesHeaderArchives({id})` |

**Fields:** `id`, `documentType`, `no`, `docNoOccurrence`, `versionNo`, `sellToCustomerNo`, `sellToCustomerName`, `sellToContactNo`, `postingDate`, `documentDate`, `orderDate`, `status`, `salespersonCode`, `currencyCode`, `externalDocumentNo`, `locationCode`, `shortcutDimension1Code`, `shortcutDimension2Code`, `archivedBy`, `dateArchived`, `timeArchived`, `companyName`, `lastModifiedDateTime`

**Nested sub-page:**
```
salesHeaderArchives({id})/salesLineArchives
```

---

### Sales Line Archives — Page 50334
**Source table:** `Sales Line Archive` (5108)

| Method | URL |
|--------|-----|
| GET (all) | `salesLineArchives` |
| GET (single) | `salesLineArchives({id})` |
| GET (nested) | `salesHeaderArchives({id})/salesLineArchives` |
| POST | `salesLineArchives` |
| PATCH | `salesLineArchives({id})` |
| DELETE | `salesLineArchives({id})` |

**Fields:** `id`, `documentType`, `documentNo`, `docNoOccurrence`, `versionNo`, `lineNo`, `lineType`, `no`, `description`, `description2`, `variantCode`, `locationCode`, `unitOfMeasureCode`, `quantity`, `unitPrice`, `lineDiscountPercent`, `lineAmount`, `amount`, `amountIncludingVat`, `shipmentDate`, `shortcutDimension1Code`, `shortcutDimension2Code`, `companyName`, `lastModifiedDateTime`

---

## LS Central Retail Setup

### Retail Product Groups — Page 50335
**Source table:** `LSC Retail Product Group` (10000705)

| Method | URL |
|--------|-----|
| GET (all) | `retailProductGroups` |
| GET (single) | `retailProductGroups({id})` |
| POST | `retailProductGroups` |
| PATCH | `retailProductGroups({id})` |
| DELETE | `retailProductGroups({id})` |

**Fields:** `id`, `itemCategoryCode`, `code`, `description`, `description2`, `genProdPostingGroup`, `vatProdPostingGroup`, `inventoryPostingGroup`, `costingMethod`, `unitOfMeasure`, `unitPrice`, `unitCost`, `vendorNo`, `blocked`, `companyName`, `lastModifiedDateTime`

**Guards:** Delete blocked unless `blocked = true`.

---

## Updated Existing Endpoint

### Price List Lines — Page 50321 *(companyName added)*
**Source table:** `Price List Line` (7001)

| Method | URL |
|--------|-----|
| GET (all) | `priceListLines` |
| GET (nested) | `priceListHeaders({id})/priceListLines` |
| POST | `priceListLines` |
| PATCH | `priceListLines({id})` |
| DELETE | `priceListLines({id})` |

`companyName` field added in this session. No version change.

---

## Object ID Summary

| Page ID | Entity Set | Source Table | BC Table ID |
|---------|-----------|--------------|-------------|
| 50321 | `priceListLines` | Price List Line | 7001 |
| 50322 | `transactionHeaders` | LSC Transaction Header | 99001472 |
| 50323 | `transactionSalesEntries` | LSC Transaction Sales Entry | 99001473 |
| 50324 | `transPaymentEntries` | LSC Trans. Payment Entry | 99001474 |
| 50325 | `tenderTypeSetups` | LSC Tender Type Setup | 99001466 |
| 50326 | `stores` | LSC Store | 99001470 |
| 50327 | `transferHeaders` | Transfer Header | 5740 |
| 50328 | `transferLines` | Transfer Line | 5741 |
| 50329 | `transferShipmentHeaders` | Transfer Shipment Header | 5744 |
| 50330 | `transferShipmentLines` | Transfer Shipment Line | 5745 |
| 50331 | `transferReceiptHeaders` | Transfer Receipt Header | 5746 |
| 50332 | `transferReceiptLines` | Transfer Receipt Line | 5747 |
| 50333 | `salesHeaderArchives` | Sales Header Archive | 5107 |
| 50334 | `salesLineArchives` | Sales Line Archive | 5108 |
| 50335 | `retailProductGroups` | LSC Retail Product Group | 10000705 |
