/*
  Warnings:

  - Changed the type of `loan_period` on the `application` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- AlterTable
ALTER TABLE "application" DROP COLUMN "loan_period",
ADD COLUMN     "loan_period" INTEGER NOT NULL;
