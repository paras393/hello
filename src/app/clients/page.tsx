import { ClientPicker } from "@/components/ClientPicker"; export default function Page({searchParams}:{searchParams:{filerId:string}}){return <ClientPicker filerId={searchParams.filerId}/>}
