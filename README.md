# Voltage-mode controlled (VMC) buck converter
## Contents:
1. Design requirments
2. Closed-loop transfer function
3. Type 3 compensator or PID?
4. Steps to design a Type 3 compensator
5. SIMULINK model
## Design requirments:
Let's assume that the design requirments for your buck converter are as follows:
1. Vin = 48V
2. Vout = 12V
3. Iout = 2A
4. dIL <= 20% of ILavg
5. dVout <= 5%
6. fs = 100KHz
where Vin is the input voltage, Vout is the output voltage, Iout is the output current, dIL is the allowable current ripple in the inductor's current, ILavg is the average inductor current, dVout is the allowable output voltage ripple and fs is the switching frequency.
therefore:
 D = 12/48 = 0.25
Rout = 12/2 = 6ohm
L = (D*(1-D)*Vin)*2.5/fs*dIL = 0.5mH
C = ((1-D)*1.5)/dVout*8*fs^2*L = 0.5uF
where D is the duty cycle, Rout is the load resistance, L is the inductor's value, C is the capacitor's value, 2.5 and 1.5 in the above equations are safety factors.
## Closed-loop transfer functions:
