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
### Buck converter's transfer function:
According to the buck converter's small signal model:

![download (2)](https://github.com/omarabdallah23/Voltage-mode-controlled-buck-converter-using-type-compensator/assets/143711494/1a1df8b9-20c8-45bf-9186-f988aa879a89)

The system's (buck converter's) transfer function is Gvd = Vin/(C*L*S^2 + (L/R)*S + 1)
### Sensor's transfer function:
The input voltage is 48V which we can approximate to 50V
The sensor is a simple voltage divider with a ratio = 5/50
The sensor's transfer function is equal to the ratio between the sensed voltage and the output voltage= H = V1/Vout = R2/(R1 + R2)
### PWM's transfer function:
A control voltage is compared to a saw-tooth wave form by a comparator. The output of the comparator is 1 if the control volatge is greater than the saw-tooth and 0 otherwise. This produces a PWM with a certain duty cycle. Let Vc be the control voltage, D the duty cycle and Vmax the max voltage of the saw-tooth waveform. It can be deduced that Vc(t) = D(t)*Vmax.
In the transient phase:
Vc = Vc + vc'
D(t) = D + d'
D+d' = (Vc+vc')/Vmax
therefore:
D = Vc/Vmax
d' = vc'/Vmax
The transfer function of PWM = Gm = d'/vc' = 1/Vmax however this model is valid as long as the PWM samples the control signal onces over the switching frequency.

The final closed-loop transfer function will be Gcl = Gvd * H * Gm.
## Type ||| compensator or PID:
