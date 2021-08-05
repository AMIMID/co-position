TempoClock.default.tempo_(120/30);

(
SynthDef.new(\id, {
	arg a=1,fund=1,b=1,x=1,bus=1,dur;
	var y=1,p=0;
	var k,kpos,z,zpos;
	var w=0,o=1,sig,total=0,env,s,spos;
x=dur/(dur+1);
fund=fund*180;
180.do{
		p=p+(1/180);
		w=w+1;
		y=(w+o)/w;
	k=Complex(x,y).angle;
	a=Complex(x,y).abs;
		z=(((k)+a)*fund)/(k);
		zpos=((k)+a)/(k);
		s= Complex(z,w).abs;
			spos=Complex(z,w).angle;
			env=EnvGen.ar(Env.perc(0.01,dur,1/s,[-2,-2]),doneAction:2);
		sig=BLowPass.ar(SinOsc.ar(s,mul: env,phase:p),20000);
		total=total+sig;
		Out.ar(0,PanAz.ar(2,total*env,(spos)*(x.linlin(0.5,1,-1,1)),width:1));
};


}).add;
)

Tdef(\sa).play
Tdef(\sa).stop;



(
Tdef(\sa,
      {
				 1.do({( Pdef(\1, Pbind(\instrument, \id,
	\dur,Pseq([1,2,3,4,5,6],inf),
			\sustain,Pexprand([0.1,1],inf),
			\fund, Pxrand([1.1,1],inf),
		)).play(quant:1));  (0).yield});
		 1.do({( Pdef(\1, Pbind(\instrument, \id,
\dur,Pseq([6,5,4,3,2,1],inf),
			\sustain,Pexprand([0.1,1],inf),
			\fund, Pxrand([1.1,1],inf),
		)).play(quant:1));  (880).yield});
Pdef(\1).stop;
		Pdef(\2).stop;
			})
)

////////////////////////////////////////////////////////voc
s.options.memSize = 2097152
(
SynthDef.new(\idvoc, {
	arg a=1,fund=1,b=1,x=1,bus=1,attack=1,decay=1,y=1,s,dur,sustain;
	var sum=0,wave;
	var envelope,p=0;
	var k,kpos,z,zpos;
fund=fund*220;
	b=b*(-1);

		p=p+1/24;
		y=(x+1)/x;
		k=Complex(x,y).angle;
	a=Complex(x,y).abs;
		z=(((k)+a)*fund)/(k);
		zpos=((k)+a)/(k);


		envelope=EnvGen.ar(Env.perc(5,2+sustain,100/z,[-1,-8]),doneAction:2);
		wave=PitchShift.ar(SoundIn.ar(0),0.2,pitchRatio:z.linlin(1,2200,0,4),mul:envelope,timeDispersion:p);
		sum= sum+wave;
		Out.ar(0,PanAz.ar(2,LeakDC.ar(sum*envelope),zpos*bus,width:1));


}).add;
)

Tdef(\sav).play
Tdef(\sav).stop;


(
Tdef(\sav,
      {
				 1.do({( Pdef(\5, Pbind(\instrument, \idvoc,
	\dur,Pwrand([2,1,0.5],[1,2,1].normalizeSum,inf),
			\fund, Pxrand([2.1,2],inf),
\sustain,Pexprand([0.1,1],inf),
			\x,Pexprand(0.1,1,inf),
			\y,Pexprand(0.1,1,inf),
\attack,2,
	\decay,8,
	\bus,Prand([1,0.75,0.5,0.25,0,(-0.25),(-0.5),(-0.75),(-1)],inf);
		)).play(quant:1));  (0).yield});
Pdef(\1).stop; 1.do({( Pdef(\5, Pbind(\instrument, \idvoc,
	\dur,Pwrand([2,1,0.5],[1,2,1].normalizeSum,inf),
			\fund, Pxrand([1.1,1],inf),
\sustain,Pexprand([0.1,1],inf),
			\x,Pexprand(0.1,1,inf),
			\y,Pexprand(0.1,1,inf),
\attack,2,
	\decay,8,
	\bus,Prand([1,0.75,0.5,0.25,0,(-0.25),(-0.5),(-0.75),(-1)],inf);
		)).play(quant:1));  (365).yield});
		Pdef(\5).stop;
		Pdef(\6).stop;
			})
)
