// AY 2026-27 rates live here so a rule update is a one-file correction.
export const TAX_RULES={
  standardDeduction:50000,cess:0.04,
  capitalGains:{equityStcgRate:.20,equityLtcgRate:.125,equityLtcgExemption:125000,otherLtcgRate:.125,equityHoldingMonths:12,propertyHoldingMonths:24,movableHoldingMonths:36},
  deductions:{section80CCap:150000,section80DttaCap:10000,section80TtbCap:50000,nps80ccd1bCap:50000,educationLoanYears:8,disabilityNormal:75000,disabilitySevere:125000},
  rebate:{old:{limit:500000,max:12500},new:{limit:1200000,max:60000}},
  old:{normal:[{upto:250000,rate:0},{upto:500000,rate:.05},{upto:1000000,rate:.2},{upto:Infinity,rate:.3}],senior:[{upto:300000,rate:0},{upto:500000,rate:.05},{upto:1000000,rate:.2},{upto:Infinity,rate:.3}],superSenior:[{upto:500000,rate:0},{upto:1000000,rate:.2},{upto:Infinity,rate:.3}]},
  new:[{upto:400000,rate:0},{upto:800000,rate:.05},{upto:1200000,rate:.1},{upto:1600000,rate:.15},{upto:2000000,rate:.2},{upto:2400000,rate:.25},{upto:Infinity,rate:.3}],
  surcharge:[{above:5000000,rate:.1},{above:10000000,rate:.15},{above:20000000,rate:.25},{above:50000000,rate:.37}]
};
