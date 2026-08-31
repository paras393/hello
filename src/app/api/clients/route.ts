import { NextResponse } from "next/server"; import { prisma } from "@/lib/prisma";
export async function GET(req:Request){const id=new URL(req.url).searchParams.get("professionalId"); return NextResponse.json(await prisma.client.findMany({where:{professionalId:id??""},orderBy:{name:"asc"}}));}
export async function POST(req:Request){const b=await req.json(); if(!b.professionalId||!b.name||!b.pan)return NextResponse.json({error:"Please complete all fields."},{status:400}); return NextResponse.json(await prisma.client.create({data:{professionalId:b.professionalId,name:b.name,pan:b.pan}}));}
