export function Field({label,children,help}:{label:string;children:React.ReactNode;help?:string}){
  return <label className="block text-sm font-semibold leading-5 text-ink">
    {label}
    {children}
    {help&&<span className="mt-1.5 block text-xs font-normal leading-5 text-slate-500">{help}</span>}
  </label>
}

export function Input(props:React.InputHTMLAttributes<HTMLInputElement>){
  return <input {...props} className={`focus-ring mt-2 min-h-12 w-full rounded-xl border border-line bg-white px-4 py-3 text-base font-normal text-ink shadow-sm placeholder:text-slate-400 hover:border-slate-300 disabled:cursor-not-allowed disabled:bg-slate-100 disabled:text-slate-500 ${props.className||""}`}/>
}

export function Select(props:React.SelectHTMLAttributes<HTMLSelectElement>){
  return <select {...props} className={`focus-ring mt-2 min-h-12 w-full rounded-xl border border-line bg-white px-4 py-3 text-base font-normal text-ink shadow-sm hover:border-slate-300 disabled:cursor-not-allowed disabled:bg-slate-100 disabled:text-slate-500 ${props.className||""}`}/>
}

export function PrimaryButton(props:React.ButtonHTMLAttributes<HTMLButtonElement>){
  return <button {...props} className={`focus-ring inline-flex min-h-12 items-center justify-center rounded-xl bg-teal px-5 py-3 font-semibold text-white shadow-sm hover:bg-teal-700 hover:shadow-md disabled:cursor-not-allowed disabled:bg-slate-300 disabled:text-slate-500 disabled:shadow-none ${props.className||""}`}/>
}

export function Card({children,className=""}:{children:React.ReactNode;className?:string}){
  return <section className={`rounded-2xl border border-line bg-white p-7 shadow-card md:p-8 ${className}`}>{children}</section>
}
