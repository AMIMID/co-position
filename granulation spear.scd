s.boot;

b = Buffer.readChannel(s,"/Users/petrostatsiopoulos/Dokuments/PROJECT  FILES/dome/granular/basis.wav",channels:1);

TempoClock.default.tempo_(120/80);
(
{
var sig;

sig = GrainBuf.ar(
	2,
	Dust.ar(2),
	4,
	b.bufnum,
	1,
		LFNoise1.ar(2000).range(0,1),
	2,
		SinOsc.ar(1.61803398874989484820458683436563811772030917980576/2),
	-1,
	512
);
}.play
)





