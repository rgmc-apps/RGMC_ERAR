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

**Fields:** `id`, `storeNo`, `posTerminalNo`, `transactionNo`, `receiptNo`, `transactionDate`, `transactionTime`, `memberCardNo`, `customerNo`, `staffId`, `netAmount`, `grossAmount`, `discountAmount`, `noOfItems`, `statementNo`, `companyName`, `lastModifiedDateTime`

**Nested sub-pages:**
```
transactionHeaders({id})/transactionSalesEntries
transactionHeaders({id})/transPaymentEntries
```

---

### Transaction Sales Entries — Page 50323
**Source table:** `LSC Trans. Sales Entry` (99001473)

| Method | URL |
|--------|-----|
| GET (all) | `transactionSalesEntries` |
| GET (single) | `transactionSalesEntries({id})` |
| GET (nested) | `transactionHeaders({id})/transactionSalesEntries` |
| POST | `transactionSalesEntries` |
| PATCH | `transactionSalesEntries({id})` |
| DELETE | `transactionSalesEntries({id})` |

**Fields:** `id`, `storeNo`, `posTerminalNo`, `transactionNo`, `lineNo`, `receiptNo`, `transactionDate`, `transactionTime`, `itemNo`, `barcodeNo`, `variantCode`, `unitOfMeasure`, `quantity`, `price`, `netPrice`, `netAmount`, `discountAmount`, `discountPercent`, `costAmount`, `staffId`, `companyName`, `lastModifiedDateTime`

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

**Fields:** `id`, `storeNo`, `posTerminalNo`, `transactionNo`, `lineNo`, `receiptNo`, `transactionDate`, `transactionTime`, `tenderType`, `amountTendered`, `currencyCode`, `staffId`, `companyName`, `lastModifiedDateTime`

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

**Fields:** `id`, `code`, `description`, `companyName`, `lastModifiedDateTime`

> ⚠️ Most optional fields on `LSC Tender Type Setup` did not exist in this BC27 installation. Use the AL Symbol Browser to discover the correct field names and extend this page if needed.

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

**Fields:** `id`, `no`, `name`, `address`, `address2`, `city`, `county`, `postCode`, `phoneNo`, `email`, `currencyCode`, `locationCode`, `responsibilityCenter`, `companyName`, `lastModifiedDateTime`

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

**Fields:** `id`, `documentNo`, `lineNo`, `itemNo`, `description`, `description2`, `variantCode`, `unitOfMeasureCode`, `qtyPerUnitOfMeasure`, `quantity`, `transferOrderNo`, `transferFromCode`, `transferToCode`, `shortcutDimension1Code`, `shortcutDimension2Code`, `companyName`, `lastModifiedDateTime`

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

**Fields:** `id`, `documentNo`, `lineNo`, `itemNo`, `description`, `description2`, `variantCode`, `unitOfMeasureCode`, `qtyPerUnitOfMeasure`, `quantity`, `transferOrderNo`, `transferFromCode`, `transferToCode`, `shortcutDimension1Code`, `shortcutDimension2Code`, `companyName`, `lastModifiedDateTime`

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

**Fields:** `id`, `itemCategoryCode`, `code`, `description`, `companyName`, `lastModifiedDateTime`

> ⚠️ Most optional fields on `LSC Retail Product Group` did not exist in this BC27 installation. Use the AL Symbol Browser to discover the correct field names and extend this page if needed.

---

### LSC Tender Types — Page 50336
**Source table:** `LSC Tender Type` (99001462)

| Method | URL |
|--------|-----|
| GET (all) | `tenderTypes` |
| GET (single) | `tenderTypes({id})` |
| POST | `tenderTypes` |
| PATCH | `tenderTypes({id})` |
| DELETE | `tenderTypes({id})` |

**Fields:** `id`, `code`, `description`, `companyName`, `lastModifiedDateTime`

> ⚠️ This is `LSC Tender Type` (99001462), distinct from `LSC Tender Type Setup` (99001466). Use the AL Symbol Browser to discover additional fields and extend this page as needed.

---

## Returns

### Return Shipment Lines — Page 50337
**Source table:** `Return Shipment Line` (6651)

| Method | URL |
|--------|-----|
| GET (all) | `returnShipmentLines` |
| GET (single) | `returnShipmentLines({id})` |
| POST | `returnShipmentLines` |
| PATCH | `returnShipmentLines({id})` |
| DELETE | `returnShipmentLines({id})` |

**Fields:** `id`, `documentNo`, `lineNo`, `type`, `no`, `description`, `description2`, `variantCode`, `unitOfMeasureCode`, `qtyPerUnitOfMeasure`, `quantity`, `returnReasonCode`, `returnOrderNo`, `returnOrderLineNo`, `shortcutDimension1Code`, `shortcutDimension2Code`, `companyName`, `lastModifiedDateTime`

> `unitPrice`, `amount`, `amountIncludingVat` do not exist on `Return Shipment Line` in this BC27 installation.

---

### Return Receipt Lines — Page 50338
**Source table:** `Return Receipt Line` (6661)

| Method | URL |
|--------|-----|
| GET (all) | `returnReceiptLines` |
| GET (single) | `returnReceiptLines({id})` |
| POST | `returnReceiptLines` |
| PATCH | `returnReceiptLines({id})` |
| DELETE | `returnReceiptLines({id})` |

**Fields:** `id`, `documentNo`, `lineNo`, `type`, `no`, `description`, `description2`, `variantCode`, `unitOfMeasureCode`, `qtyPerUnitOfMeasure`, `quantity`, `unitPrice`, `returnReasonCode`, `returnOrderNo`, `returnOrderLineNo`, `shortcutDimension1Code`, `shortcutDimension2Code`, `companyName`, `lastModifiedDateTime`

> `amount`, `amountIncludingVat` do not exist on `Return Receipt Line` in this BC27 installation.

---

## Inventory

### Item Ledger Entries — Page 50339
**Source table:** `Item Ledger Entry` (32)
**Table extension:** `RGMC Item Ledger Entry Ext` (50456) — adds `Transfer Type`, `Batch No.`, `Offer No.`, `Promotion No.`, `Statement No.`, `BI Timestamp` as RGMC custom fields. `Warranty Date` and `Originally Ordered No.` are already defined by Base Application and are exposed directly.

| Method | URL |
|--------|-----|
| GET (all) | `itemLedgerEntries` |
| GET (single) | `itemLedgerEntries({id})` |
| POST | `itemLedgerEntries` |
| PATCH | `itemLedgerEntries({id})` |
| DELETE | `itemLedgerEntries({id})` |

**Fields (identity & posting):** `id`, `entryNo`, `itemNo`, `postingDate`, `documentDate`, `entryType`, `sourceType`, `sourceNo`, `documentNo`, `documentType`, `documentLineNo`, `externalDocumentNo`, `noSeries`, `description`

**Fields (item & location):** `locationCode`, `variantCode`, `itemCategoryCode`, `nonstock`, `purchasingCode`

**Fields (tracking):** `serialNo`, `lotNo`, `batchNo`†, `expirationDate`, `itemTracking`, `warrantyDate`

**Fields (quantities):** `quantity`, `invoicedQuantity`, `remainingQuantity`, `shippedQtyNotReturned`, `unitOfMeasureCode`, `qtyPerUnitOfMeasure`

**Fields (status):** `open`, `positive`, `correction`, `completelyInvoiced`, `dropShipment`, `assembleToOrder`, `lastInvoiceDate`

**Fields (order / application):** `orderType`, `orderNo`, `orderLineNo`, `returnReasonCode`, `appliedEntryToAdjust`, `appliesToEntry`, `transferType`†, `originallyOrderedNo`

**Fields (jobs):** `jobNo`, `jobTaskNo`, `jobPurchase`

**Fields (dimensions):** `globalDimension1Code`, `globalDimension2Code`, `dimensionSetId`

**Fields (Intrastat):** `transactionType`, `transportMethod`, `transactionSpecification`, `entryExitPoint`, `countryRegionCode`, `intrastatArea`

**Fields (LSC retail / RGMC ext):** `offerNo`†, `promotionNo`†, `statementNo`†, `biTimestamp`†, `outOfStockSubstitution`

**Fields (metadata):** `companyName`, `lastModifiedDateTime`

> † Field is added by `RGMC Item Ledger Entry Ext` (TableExt 50456) — value will be blank until populated via POST/PATCH.

#### API property name differences from BC column names

| BC Column Name | API Property Name | Reason |
|---|---|---|
| `Area` | `intrastatArea` | `area` is a reserved keyword in AL (used in page layouts as `area(Content)`) |
| `Product Group Code` | *(removed)* | Not present on Table 32 in this BC27 installation (deprecated in BC17+) |
| `Cross-Reference No.` | *(removed)* | Renamed to `Item Reference No.` in BC17+; not present on Table 32 here |

---

## Sales Shipments

### Sales Shipment Lines — Page 50340
**Source table:** `Sales Shipment Line` (111)
**Table extension:** `RGMC Sales Shipment Line Ext` (50457) — adds 20 fields absent from Table 111 in this BC27+LSC installation (see field name table below).

| Method | URL |
|--------|-----|
| GET (all) | `salesShipmentLines` |
| GET (single) | `salesShipmentLines({id})` |
| POST | `salesShipmentLines` |
| PATCH | `salesShipmentLines({id})` |
| DELETE | `salesShipmentLines({id})` |

**Fields (identity & document):** `id`, `documentNo`, `lineNo`, `type`, `no`, `description`, `description2`, `postingDate`, `correction`

**Fields (customer):** `sellToCustomerNo`, `billToCustomerNo`, `customerPriceGroup`, `customerDiscGroup`, `responsibilityCenter`

**Fields (item & location):** `locationCode`, `binCode`, `variantCode`, `itemCategoryCode`, `nonstock`, `postingGroup`, `purchasingCode`

**Fields (quantities & UoM):** `quantity`, `quantityBase`, `quantityInvoiced`, `qtyInvoicedBase`, `qtyShippedNotInvoiced`, `qtyPerUnitOfMeasure`, `unitOfMeasure`, `unitOfMeasureCode`, `unitOfMeasureCrossRef`†, `unitsPerParcel`, `netWeight`, `grossWeight`, `unitVolume`

**Fields (pricing & discounts):** `unitCost`, `unitCostLcy`, `vatBaseAmount`, `allowLineDisc`, `allowInvoiceDisc`, `itemChargeBaseAmount`

**Fields (VAT & posting):** `vatCalculationType`, `vatBusPostingGroup`, `vatProdPostingGroup`, `genBusPostingGroup`, `genProdPostingGroup`

**Fields (Associates 365 tax):** `taxLiable`, `taxAreaCode`, `taxGroupCode`

**Fields (item application):** `itemShptEntryNo`, `appliesToItemEntry`, `applFromItemEntry`, `returnReasonCode`, `attachedToLineNo`

**Fields (order references):** `orderNo`, `orderLineNo`, `blanketOrderNo`, `blanketOrderLineNo`, `purchaseOrderNo`, `purchOrderLineNo`, `dropShipment`, `vendorNo`†

**Fields (job):** `jobNo`, `jobTaskNo`, `jobContractEntryNo`, `workTypeCode`

**Fields (dimensions):** `shortcutDimension1Code`, `shortcutDimension2Code`, `dimensionSetId`

**Fields (FA / depreciation):** `faPostingDate`, `depreciationBookCode`, `deprUntilFaPostingDate`, `duplicateInDepreciationBook`, `useDuplicationList`

**Fields (dates & shipping):** `shippingTime`, `outboundWhseHandlingTime`, `plannedShipmentDate`, `plannedDeliveryDate`, `requestedDeliveryDate`, `promisedDeliveryDate`, `estimatedDeliveryDate`†

**Fields (Intrastat):** `transactionType`, `transportMethod`, `transactionSpecification`, `exitPoint`, `intrastatArea`

**Fields (LSC retail / delivery — all via RGMC ext†):** `sourcing`, `deliverFrom`, `returnPolicy`, `deliveringMethod`, `itemTrackingNo`, `configurationId`, `deliveryUserId`, `optionValueText`, `spoWhseLocation`, `deliveryDateTime`, `noLaterThanDate`, `vendorDeliversTo`, `spoDocumentMethod`, `retailSpecialOrder`, `storeSalesLocation`, `deliveryReferenceNo`, `deliveryLocationCode`

**Fields (Associates 365 / standard):** `authorizedForCreditCard`

**Fields (metadata):** `companyName`, `lastModifiedDateTime`

> † Field is added by `RGMC Sales Shipment Line Ext` (TableExt 50457) — value will be blank until populated via POST/PATCH.

#### API property name differences from BC column names

| BC Column Name | API Property Name | Reason |
|---|---|---|
| `Area` | `intrastatArea` | `area` is a reserved keyword in AL (used in page layouts as `area(Content)`) |
| `Product Group Code` | *(removed)* | Not present on Table 111 in this BC27 installation (deprecated in BC17+) |
| `Cross-Reference No.` | *(removed)* | Renamed to `Item Reference No.` in BC17+; not present on Table 111 here |
| `Cross-Reference Type` | *(removed)* | Renamed in BC17+; not present on Table 111 here |
| `Cross-Reference Type No.` | *(removed)* | Renamed in BC17+; not present on Table 111 here |
| `Unit of Measure Cross Ref.` | `unitOfMeasureCrossRef`† | Not on Table 111 natively; added via TableExt 50457 |
| `Vendor No.` | `vendorNo`† | Not on Table 111 natively; added via TableExt 50457 |
| `Estimated Delivery Date` | `estimatedDeliveryDate`† | Not on Table 111 natively; added via TableExt 50457 |
| `Sourcing` | `sourcing`† | Not on Table 111 natively; added via TableExt 50457 |
| `Deliver from` | `deliverFrom`† | Not on Table 111 natively; added via TableExt 50457 |
| `Return Policy` | `returnPolicy`† | Not on Table 111 natively; added via TableExt 50457 |
| `Delivering Method` | `deliveringMethod`† | Not on Table 111 natively; added via TableExt 50457 |
| `Item Tracking No.` | `itemTrackingNo`† | Not on Table 111 natively; added via TableExt 50457 |
| `Configuration ID` | `configurationId`† | Not on Table 111 natively; added via TableExt 50457 |
| `Delivery User ID` | `deliveryUserId`† | Not on Table 111 natively; added via TableExt 50457 |
| `Option Value Text` | `optionValueText`† | Not on Table 111 natively; added via TableExt 50457 |
| `SPO Whse Location` | `spoWhseLocation`† | Not on Table 111 natively; added via TableExt 50457 |
| `Delivery Date Time` | `deliveryDateTime`† | Not on Table 111 natively; added via TableExt 50457 |
| `No later than Date` | `noLaterThanDate`† | Not on Table 111 natively; added via TableExt 50457 |
| `Vendor Delivers to` | `vendorDeliversTo`† | Not on Table 111 natively; added via TableExt 50457 |
| `SPO Document Method` | `spoDocumentMethod`† | Not on Table 111 natively; added via TableExt 50457 |
| `Retail Special Order` | `retailSpecialOrder`† | Not on Table 111 natively; added via TableExt 50457 |
| `Store Sales Location` | `storeSalesLocation`† | Not on Table 111 natively; added via TableExt 50457 |
| `Delivery Reference No` | `deliveryReferenceNo`† | Not on Table 111 natively; added via TableExt 50457 |
| `Delivery Location Code` | `deliveryLocationCode`† | Not on Table 111 natively; added via TableExt 50457 |

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
| 50323 | `transactionSalesEntries` | LSC Trans. Sales Entry | 99001473 |
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
| 50336 | `tenderTypes` | LSC Tender Type | 99001462 |
| 50337 | `returnShipmentLines` | Return Shipment Line | 6651 |
| 50338 | `returnReceiptLines` | Return Receipt Line | 6661 |
| 50339 | `itemLedgerEntries` | Item Ledger Entry | 32 |
| 50340 | `salesShipmentLines` | Sales Shipment Line | 111 |
