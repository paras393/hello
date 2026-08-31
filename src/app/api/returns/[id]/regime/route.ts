import {NextResponse} from "next/server";import {prisma} from "@/lib/prisma";
export async function PATCH(req:Request,{params}:{params:{id:string}}){const b=await req.json();if(!["old","new"].includes(b.regime))return NextResponse.json({error:"Choose a valid regime."},{status:400});return NextResponse.json(await prisma.return.update({where:{id:params.id},data:{regimeChosen:b.regime}}));}
