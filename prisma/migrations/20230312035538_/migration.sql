/*
  Warnings:

  - You are about to drop the column `applicationApplication_id` on the `broker` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "broker" DROP CONSTRAINT "broker_applicationApplication_id_fkey";

-- AlterTable
ALTER TABLE "broker" DROP COLUMN "applicationApplication_id";

-- AddForeignKey
ALTER TABLE "application" ADD CONSTRAINT "application_broker_id_fkey" FOREIGN KEY ("broker_id") REFERENCES "broker"("broker_id") ON DELETE RESTRICT ON UPDATE CASCADE;
