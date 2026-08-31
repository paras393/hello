-- CreateTable
CREATE TABLE "Filer" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "pan" TEXT NOT NULL,
    "role" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE "Client" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "professionalId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "pan" TEXT NOT NULL,
    CONSTRAINT "Client_professionalId_fkey" FOREIGN KEY ("professionalId") REFERENCES "Filer" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE "Return" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "filerId" TEXT NOT NULL,
    "clientId" TEXT,
    "assessmentYear" TEXT NOT NULL DEFAULT '2026-27',
    "itrType" TEXT,
    "regimeChosen" TEXT,
    "status" TEXT NOT NULL DEFAULT 'draft',
    "data" JSON NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "Return_filerId_fkey" FOREIGN KEY ("filerId") REFERENCES "Filer" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "Return_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "Client" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
CREATE INDEX "Client_professionalId_idx" ON "Client"("professionalId");
CREATE INDEX "Return_filerId_assessmentYear_idx" ON "Return"("filerId", "assessmentYear");
CREATE TABLE "PersonalInfo" ("id" TEXT NOT NULL PRIMARY KEY,"returnId" TEXT NOT NULL UNIQUE,"name" TEXT NOT NULL,"pan" TEXT NOT NULL,"dateOfBirth" DATETIME NOT NULL,"residentialStatus" TEXT NOT NULL,"bankAccount" TEXT NOT NULL,"ifsc" TEXT NOT NULL,"aadhaar" TEXT NOT NULL,CONSTRAINT "PersonalInfo_returnId_fkey" FOREIGN KEY ("returnId") REFERENCES "Return" ("id") ON DELETE CASCADE ON UPDATE CASCADE);
CREATE TABLE "SalaryIncome" ("id" TEXT NOT NULL PRIMARY KEY,"returnId" TEXT NOT NULL UNIQUE,"grossSalary" INTEGER NOT NULL DEFAULT 0,"hraReceived" INTEGER NOT NULL DEFAULT 0,"otherAllowances" INTEGER NOT NULL DEFAULT 0,"perquisites" INTEGER NOT NULL DEFAULT 0,"profitInLieu" INTEGER NOT NULL DEFAULT 0,"rentPaid" INTEGER NOT NULL DEFAULT 0,"city" TEXT NOT NULL DEFAULT 'non-metro',"standardDeduction" INTEGER NOT NULL DEFAULT 50000,"hraExemption" INTEGER NOT NULL DEFAULT 0,CONSTRAINT "SalaryIncome_returnId_fkey" FOREIGN KEY ("returnId") REFERENCES "Return" ("id") ON DELETE CASCADE ON UPDATE CASCADE);
CREATE TABLE "HouseProperty" ("id" TEXT NOT NULL PRIMARY KEY,"returnId" TEXT NOT NULL,"propertyType" TEXT NOT NULL,"annualValue" INTEGER NOT NULL DEFAULT 0,"municipalTaxes" INTEGER NOT NULL DEFAULT 0,"homeLoanInterest" INTEGER NOT NULL DEFAULT 0,"income" INTEGER NOT NULL DEFAULT 0,CONSTRAINT "HouseProperty_returnId_fkey" FOREIGN KEY ("returnId") REFERENCES "Return" ("id") ON DELETE CASCADE ON UPDATE CASCADE);
CREATE TABLE "CapitalGain" ("id" TEXT NOT NULL PRIMARY KEY,"returnId" TEXT NOT NULL,"assetType" TEXT NOT NULL,"purchaseDate" DATETIME NOT NULL,"saleDate" DATETIME NOT NULL,"purchaseValue" INTEGER NOT NULL,"saleValue" INTEGER NOT NULL,"transferExpenses" INTEGER NOT NULL DEFAULT 0,"holdingMonths" INTEGER NOT NULL,"holdingType" TEXT NOT NULL,"gain" INTEGER NOT NULL,CONSTRAINT "CapitalGain_returnId_fkey" FOREIGN KEY ("returnId") REFERENCES "Return" ("id") ON DELETE CASCADE ON UPDATE CASCADE);
CREATE TABLE "OtherSource" ("id" TEXT NOT NULL PRIMARY KEY,"returnId" TEXT NOT NULL,"sourceType" TEXT NOT NULL,"description" TEXT NOT NULL,"amount" INTEGER NOT NULL,CONSTRAINT "OtherSource_returnId_fkey" FOREIGN KEY ("returnId") REFERENCES "Return" ("id") ON DELETE CASCADE ON UPDATE CASCADE);
CREATE INDEX "HouseProperty_returnId_idx" ON "HouseProperty"("returnId");
CREATE INDEX "CapitalGain_returnId_idx" ON "CapitalGain"("returnId");
CREATE INDEX "OtherSource_returnId_idx" ON "OtherSource"("returnId");
CREATE TABLE "Deduction" ("id" TEXT NOT NULL PRIMARY KEY,"returnId" TEXT NOT NULL,"category" TEXT NOT NULL,"description" TEXT NOT NULL,"amount" INTEGER NOT NULL,"qualifyingAmount" INTEGER NOT NULL,"loanStartYear" INTEGER,"severity" TEXT,CONSTRAINT "Deduction_returnId_fkey" FOREIGN KEY ("returnId") REFERENCES "Return" ("id") ON DELETE CASCADE ON UPDATE CASCADE);
CREATE TABLE "TdsEntry" ("id" TEXT NOT NULL PRIMARY KEY,"returnId" TEXT NOT NULL,"source" TEXT NOT NULL,"deductor" TEXT NOT NULL,"departmentAmount" INTEGER NOT NULL,"userAmount" INTEGER NOT NULL,"confirmed" BOOLEAN NOT NULL DEFAULT false,CONSTRAINT "TdsEntry_returnId_fkey" FOREIGN KEY ("returnId") REFERENCES "Return" ("id") ON DELETE CASCADE ON UPDATE CASCADE);
CREATE INDEX "Deduction_returnId_idx" ON "Deduction"("returnId");
CREATE INDEX "TdsEntry_returnId_idx" ON "TdsEntry"("returnId");
ALTER TABLE "Return" ADD COLUMN "challanReference" TEXT;
ALTER TABLE "Return" ADD COLUMN "challanAmount" INTEGER;
ALTER TABLE "Return" ADD COLUMN "challanTax" INTEGER;
ALTER TABLE "Return" ADD COLUMN "challanInterest" INTEGER;
ALTER TABLE "Return" ADD COLUMN "challanCess" INTEGER;
ALTER TABLE "Return" ADD COLUMN "bsrCode" TEXT;
ALTER TABLE "Return" ADD COLUMN "challanNumber" TEXT;
ALTER TABLE "Return" ADD COLUMN "paymentDate" DATETIME;
ALTER TABLE "Return" ADD COLUMN "acknowledgementNumber" TEXT;
ALTER TABLE "Return" ADD COLUMN "verificationMethod" TEXT;
ALTER TABLE "Return" ADD COLUMN "verificationDate" DATETIME;
CREATE TABLE "AdvanceTaxPayment" ("id" TEXT NOT NULL PRIMARY KEY,"returnId" TEXT NOT NULL,"amount" INTEGER NOT NULL,"paymentDate" DATETIME NOT NULL,"reference" TEXT NOT NULL,CONSTRAINT "AdvanceTaxPayment_returnId_fkey" FOREIGN KEY ("returnId") REFERENCES "Return" ("id") ON DELETE CASCADE ON UPDATE CASCADE);
CREATE INDEX "AdvanceTaxPayment_returnId_idx" ON "AdvanceTaxPayment"("returnId");
