TempoClock.default.tempo_(120/60);
(
SynthDef.new(\id, {
	arg a=1,fund=1,b=1,x=1,bus=1,attack=1,decay=1,y=1,s;
	var sum=0,wave;
	var envelope,p=0;
	var k,kpos,z,zpos;
fund=fund*110;
	b=b*(-1);

	4.do{
		p=p+1/4;
		x=x+1;
		y=(x+1)/x;
		k=Complex(x,y).angle;
	a=Complex(x,y).abs;
		z=(((k)+a)*fund)/(k);
		zpos=((k)+a)/(k);

		envelope=EnvGen.ar(Env.perc(attack,decay,100/z,[-1,-8]),doneAction:2);
		wave=BLowPass.ar(SinOsc.ar(z,mul: envelope,phase:p),880);
		sum= sum+wave;
		Out.ar(0,PanAz.ar(2,sum*envelope,(zpos)*bus,width:1));
	};


}).add;
)

Tdef(\sa).play
Tdef(\sa).stop;


(
Tdef(\sa,
      {
				 1.do({( Pdef(\1, Pbind(\instrument, \id,
	\dur,Pwrand([2,1,0.5],[1,2,1].normalizeSum,inf),
			\fund, Pxrand([1.1,1],inf),
\b,Pwrand([2,3,4],[1,2,1].normalizeSum,inf),
			\x,Pexprand(0.1,1,inf),
			//\y,Pexprand(0.1,1,inf),
\attack,2,
	\decay,8,
	\bus,Prand([1,0.75,0.5,0.25,0,(-0.25),(-0.5),(-0.75),(-1)],inf);
		)).play(quant:1));  (365).yield});
Pdef(\1).stop;
		Pdef(\2).stop;
		Pdef(\3).stop;
		Pdef(\4).stop;
		Pdef(\5).stop;
		Pdef(\6).stop;
			})
)

////////////////////////////////////////////////////////voc
s.options.memSize = 2097152
(
SynthDef.new(\id, {
	arg a=1,fund=1,b=1,x=1,bus=1,attack=1,decay=1,y=1,s;
	var sum=0,wave;
	var envelope,p=0;
	var k,kpos,z,zpos;
fund=fund*110;
	b=b*(-1);

		p=p+1/6;
			k=Complex(x,y).angle;
	a=Complex(x,y).abs;
		z=(((k)+a)*fund)/(k);
		zpos=((k)+a)/(k);

		envelope=EnvGen.ar(Env.perc(attack,decay,220/z,[-1,-8]),doneAction:2);
		wave=PitchShift.ar(SoundIn.ar(0),0.2,pitchRatio:z.linlin(1,2200,0,4),mul:envelope,timeDispersion:p);
		sum= sum+wave;
		Out.ar(0,PanAz.ar(2,LeakDC.ar(sum*envelope),zpos*bus,width:1));


}).add;
)

Tdef(\sa).play
Tdef(\sa).stop;


(
Tdef(\sa,
      {
				 1.do({( Pdef(\1, Pbind(\instrument, \id,
	\dur,Pwrand([2,1,0.5],[1,2,1].normalizeSum,inf),
			\fund, Pxrand([2.1,2],inf),
\b,Pwrand([2,3,4],[1,2,1].normalizeSum,inf),
			\x,Pexprand(0.1,1,inf),
			\y,Pexprand(0.1,1,inf),
\attack,2,
	\decay,8,
	\bus,Prand([1,0.75,0.5,0.25,0,(-0.25),(-0.5),(-0.75),(-1)],inf);
		)).play(quant:1));  (0).yield});
Pdef(\1).stop; 1.do({( Pdef(\1, Pbind(\instrument, \id,
	\dur,Pwrand([2,1,0.5],[1,2,1].normalizeSum,inf),
			\fund, Pxrand([1.1,1],inf),
\b,Pwrand([2,3,4],[1,2,1].normalizeSum,inf),
			\x,Pexprand(0.1,1,inf),
			\y,Pexprand(0.1,1,inf),
\attack,2,
	\decay,8,
	\bus,Prand([1,0.75,0.5,0.25,0,(-0.25),(-0.5),(-0.75),(-1)],inf);
		)).play(quant:1));  (365).yield});
Pdef(\1).stop;
		Pdef(\2).stop;
		Pdef(\3).stop;
		Pdef(\4).stop;
		Pdef(\5).stop;
		Pdef(\6).stop;
			})
)
