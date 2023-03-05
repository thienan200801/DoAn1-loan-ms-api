/*
  Warnings:

  - You are about to drop the column `application_id` on the `broker` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[email]` on the table `user` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `borrower_id` to the `broker` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "broker" DROP CONSTRAINT "broker_application_id_fkey";

-- AlterTable
ALTER TABLE "broker" DROP COLUMN "application_id",
ADD COLUMN     "applicationApplication_id" INTEGER,
ADD COLUMN     "borrower_id" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "user_email_key" ON "user"("email");

-- AddForeignKey
ALTER TABLE "broker" ADD CONSTRAINT "broker_borrower_id_fkey" FOREIGN KEY ("borrower_id") REFERENCES "borrower"("borrower_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "broker" ADD CONSTRAINT "broker_applicationApplication_id_fkey" FOREIGN KEY ("applicationApplication_id") REFERENCES "application"("application_id") ON DELETE SET NULL ON UPDATE CASCADE;
