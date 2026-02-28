-- CreateEnum
CREATE TYPE "VoiceVarient" AS ENUM ('SYSTEM', 'CUSTOM');

-- CreateEnum
CREATE TYPE "VoiceCatgory" AS ENUM ('AUDIOBOOK', 'CONVERTATIONAL', 'CUSTOMER_SERVICE', 'GENERAL', 'NARRATIVE', 'CHARACTERS', 'MEDITATION', 'MOTIVATIONAL', 'ADVERTISING', 'PODCAST', 'VOICEOVER', 'CORPORATE');

-- CreateTable
CREATE TABLE "Voice" (
    "id" TEXT NOT NULL,
    "orgId" TEXT,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "category" "VoiceCatgory" NOT NULL DEFAULT 'GENERAL',
    "language" TEXT NOT NULL DEFAULT 'en-US',
    "varient" "VoiceVarient" NOT NULL,
    "r2ObjectKey" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Voice_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Generation" (
    "id" TEXT NOT NULL,
    "orgId" TEXT NOT NULL,
    "voiceId" TEXT,
    "voiceName" TEXT NOT NULL,
    "text" TEXT NOT NULL,
    "r2ObjectKey" TEXT,
    "temprature" DOUBLE PRECISION NOT NULL,
    "topP" DOUBLE PRECISION NOT NULL,
    "topK" DOUBLE PRECISION NOT NULL,
    "repetitionPenalty" DOUBLE PRECISION NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Generation_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "Voice_varient_idx" ON "Voice"("varient");

-- CreateIndex
CREATE INDEX "Voice_orgId_idx" ON "Voice"("orgId");

-- CreateIndex
CREATE INDEX "Generation_orgId_idx" ON "Generation"("orgId");

-- CreateIndex
CREATE INDEX "Generation_voiceId_idx" ON "Generation"("voiceId");

-- AddForeignKey
ALTER TABLE "Generation" ADD CONSTRAINT "Generation_voiceId_fkey" FOREIGN KEY ("voiceId") REFERENCES "Voice"("id") ON DELETE SET NULL ON UPDATE CASCADE;
