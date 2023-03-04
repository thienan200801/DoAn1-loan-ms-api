-- CreateTable
CREATE TABLE "user" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "email" TEXT NOT NULL,
    "hash" TEXT NOT NULL,
    "name" TEXT,

    CONSTRAINT "user_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "borrower" (
    "borrower_id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "current_address" TEXT NOT NULL,
    "temporary_address" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "phone_number" TEXT NOT NULL,
    "date_of_birth" TIMESTAMP(3) NOT NULL,
    "tax_number" TEXT NOT NULL,
    "total_salary" DECIMAL(65,30) NOT NULL,
    "saving_amount" DECIMAL(65,30) NOT NULL,
    "offset_account_id" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "application" (
    "application_id" SERIAL NOT NULL,
    "application_amount" DECIMAL(65,30) NOT NULL,
    "loan_period" INTEGER NOT NULL,
    "created_date" TIMESTAMP(3) NOT NULL,
    "settlement_date" TIMESTAMP(3) NOT NULL,
    "drawdown_date" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL,
    "borrower_id" TEXT NOT NULL,
    "broker_id" TEXT NOT NULL,
    "prop_address" TEXT NOT NULL,
    "prop_estimated_value" TEXT NOT NULL,
    "offset_account_id" TEXT NOT NULL,

    CONSTRAINT "application_pkey" PRIMARY KEY ("application_id")
);

-- CreateTable
CREATE TABLE "broker" (
    "broker_id" TEXT NOT NULL,
    "broker_name" TEXT NOT NULL,
    "aggregator_name" TEXT NOT NULL,
    "broker_email" TEXT NOT NULL,
    "application_id" INTEGER NOT NULL,

    CONSTRAINT "broker_pkey" PRIMARY KEY ("broker_id")
);

-- CreateTable
CREATE TABLE "loan_detail" (
    "loan_detail_id" INTEGER NOT NULL,
    "application_id" INTEGER NOT NULL,
    "offset_account_id" TEXT NOT NULL,
    "application_amount" DECIMAL(65,30) NOT NULL,
    "broker_rate" DECIMAL(65,30) NOT NULL,
    "commission_quote" DECIMAL(65,30) NOT NULL,

    CONSTRAINT "loan_detail_pkey" PRIMARY KEY ("loan_detail_id")
);

-- CreateTable
CREATE TABLE "commission_calculation" (
    "commission_calculation_id" INTEGER NOT NULL,
    "loan_detail_id" INTEGER NOT NULL,
    "drawdown_amount" DECIMAL(65,30) NOT NULL,
    "offset_balance" DECIMAL(65,30) NOT NULL,
    "gst" DECIMAL(65,30) NOT NULL,
    "payable" DECIMAL(65,30) NOT NULL,
    "gst_amount" DECIMAL(65,30) NOT NULL,
    "calculated_amount" DECIMAL(65,30) NOT NULL,

    CONSTRAINT "commission_calculation_pkey" PRIMARY KEY ("commission_calculation_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "borrower_borrower_id_key" ON "borrower"("borrower_id");

-- AddForeignKey
ALTER TABLE "application" ADD CONSTRAINT "application_borrower_id_fkey" FOREIGN KEY ("borrower_id") REFERENCES "borrower"("borrower_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "broker" ADD CONSTRAINT "broker_application_id_fkey" FOREIGN KEY ("application_id") REFERENCES "application"("application_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "commission_calculation" ADD CONSTRAINT "commission_calculation_loan_detail_id_fkey" FOREIGN KEY ("loan_detail_id") REFERENCES "loan_detail"("loan_detail_id") ON DELETE RESTRICT ON UPDATE CASCADE;
