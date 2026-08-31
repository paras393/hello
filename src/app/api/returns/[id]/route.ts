import { NextResponse } from "next/server";
import { prisma } from "@/lib/prisma";

export async function GET(_: Request, { params }: { params: { id: string } }) {
  const record = await prisma.return.findUnique({ where: { id: params.id }, include: { client: true, filer: true, personalInfo: true, salaryIncome: true, houseProperties: true, capitalGains: true, otherSources: true, deductions: true, tdsEntries: true } });
  if (!record) return NextResponse.json({ error: "Return not found" }, { status: 404 });
  return NextResponse.json(record);
}
