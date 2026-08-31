export const money=(n:number)=>new Intl.NumberFormat("en-IN",{style:"currency",currency:"INR",maximumFractionDigits:0}).format(n||0);
export const toInt=(v:string)=>{const n=Number(v);return Number.isFinite(n)&&n>=0?Math.round(n):NaN};
export function hraCalc(hra:number,rent:number,salary:number,city:string){const cap=city==="metro"?0.5:0.4;const rentMinus=Math.max(0,rent-salary*.1);const exemption=Math.max(0,Math.min(hra,rentMinus,salary*cap));return {actual:hra,rentMinus,capAmount:salary*cap,exemption};}
export function holdingMonths(purchase:string,sale:string){const p=new Date(purchase),s=new Date(sale);return (s.getFullYear()-p.getFullYear())*12+s.getMonth()-p.getMonth()-(s.getDate()<p.getDate()?1:0)}
