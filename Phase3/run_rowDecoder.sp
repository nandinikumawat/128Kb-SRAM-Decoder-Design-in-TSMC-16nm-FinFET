.TEMP 80
.OPTION POST
.lib /soft/ece_soft_2/TSMCHOME/Executable_Package/Collaterals/Tech/SPICE/N16ADFP_SPICE_MODEL/n16adfp_spice_model_v1d0_usage.l TTMacro_MOS_MOSCAP
.INCLUDE rowDecoder.sp
.PARAM VDD=0.8

VDD vdd! 0 VDD
VSS vss! 0 0

*CLK - continuous clock with 2ns period
VCLK CLK 0 VDD 

*Address pattern using PULSE sources with fast rise/fall times
*addr 0: A[8:0]=000000000 from 0-8ns
*addr 1: A[8:0]=000000001 from 8-16ns  
*addr 8: A[8:0]=000001000 from 16-24ns
*addr 64: A[8:0]=001000000 from 24-32ns
*addr 511: A[8:0]=111111111 from 32-42ns

*A0: 0,1,0,0,1
VA0 A0 0 PULSE(0 VDD 8n 10p 10p 8n 100n)

*A1-A2: stay 0 until addr 511
VA1 A1 0 PULSE(0 VDD 32n 10p 10p 10n 100n)
VA2 A2 0 PULSE(0 VDD 32n 10p 10p 10n 100n)

*A3: 0,0,1,0,1
VA3 A3 0 PULSE(0 VDD 16n 10p 10p 8n 100n)

*A4-A5: stay 0 until addr 511
VA4 A4 0 PULSE(0 VDD 32n 10p 10p 10n 100n)
VA5 A5 0 PULSE(0 VDD 32n 10p 10p 10n 100n)

*A6: 0,0,0,1,1
VA6 A6 0 PULSE(0 VDD 24n 10p 10p 18n 100n)

*A7-A8: stay 0 until addr 511
VA8 A8 0 PULSE(0 VDD 32n 10p 10p 10n 100n)

*Add load capacitors on outputs to see cleaner signals

.TRAN 0.1n 42n
.END
