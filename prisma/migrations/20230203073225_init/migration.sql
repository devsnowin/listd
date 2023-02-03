-- CreateEnum
CREATE TYPE "Visibility" AS ENUM ('Public', 'Private');

-- CreateEnum
CREATE TYPE "FeedItemType" AS ENUM ('Youtube');

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Feed" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "visibility" "Visibility" NOT NULL,
    "creatorId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Feed_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FeedItem" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "feedItemMetaId" TEXT NOT NULL,
    "feedId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "FeedItem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FeedItemMeta" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "originId" TEXT NOT NULL,
    "type" "FeedItemType" NOT NULL,

    CONSTRAINT "FeedItemMeta_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_username_key" ON "User"("username");

-- AddForeignKey
ALTER TABLE "Feed" ADD CONSTRAINT "Feed_creatorId_fkey" FOREIGN KEY ("creatorId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FeedItem" ADD CONSTRAINT "FeedItem_feedItemMetaId_fkey" FOREIGN KEY ("feedItemMetaId") REFERENCES "FeedItemMeta"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FeedItem" ADD CONSTRAINT "FeedItem_feedId_fkey" FOREIGN KEY ("feedId") REFERENCES "Feed"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
