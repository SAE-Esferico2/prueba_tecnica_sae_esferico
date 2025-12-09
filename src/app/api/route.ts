import { NextRequest, NextResponse } from "next/server";
import { prisma } from "../../../prisma/prisma_client";

export const GET = async (req: NextRequest) => {
    const result = await prisma.usuario.findMany();
    return NextResponse.json({ result });
}