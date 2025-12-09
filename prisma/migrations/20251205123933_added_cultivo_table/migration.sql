/*
  Warnings:

  - You are about to drop the column `cultivo` on the `Recinto` table. All the data in the column will be lost.
  - You are about to drop the column `nombre` on the `Recinto` table. All the data in the column will be lost.
  - Added the required column `cultivoId` to the `Recinto` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "Recinto_nombre_key";

-- AlterTable
ALTER TABLE "Recinto" DROP COLUMN "cultivo",
DROP COLUMN "nombre",
ADD COLUMN     "cultivoId" INTEGER NOT NULL;

-- CreateTable
CREATE TABLE "Cultivo" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,

    CONSTRAINT "Cultivo_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Cultivo_nombre_key" ON "Cultivo"("nombre");

-- AddForeignKey
ALTER TABLE "Recinto" ADD CONSTRAINT "Recinto_cultivoId_fkey" FOREIGN KEY ("cultivoId") REFERENCES "Cultivo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
