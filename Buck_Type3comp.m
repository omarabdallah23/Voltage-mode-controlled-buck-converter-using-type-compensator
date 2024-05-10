%%Parameters

Vin = 48;
Vout = 12;
Iout =  2;
fs = 100e3;
D = Vout / Vin;
Rl = Vout / Iout;
L = 0.5e-3;
C = 0.5e-6;
wn = 1 / sqrt(L*C);

%%

G_vg = tf([D * wn^(2)],[1 1/(Rl*C) 1/(L*C)]);
Z_out = tf([(1/C) 0],[1 1/(Rl*C) 1/(L*C)]);
G_vd = tf([Vin * wn^(2)], [1 1/(Rl*C) 1/(L*C)])


H = 5/50;
G_m = 1/5;
G_cl = G_vd * H * G_m;
sisotool(G_cl);