//////////////////////////////////no pattern + vokoder
s.options.memSize = 524288
(
SynthDef.new(\idvoc, {
	arg a=1,fund=200,b=1,x=0,bus=0,attack=1,decay=1;
	var y,sum=0,wave,k,s;
	var envelope,p=0;
	//b=TWChoose.kr(1,[4/1,5/2,6/3,7/4,8/5,9/6],[0.1,0.2,0.5,0.6,0.4,0.1]);
	b=b*(-1);
	//fund=fund/2;
	4.do{
		x=x+1;
		y=((x**b)+a)/(x**(b));
		k=Complex(x,y).abs;
		s=Complex(x,y).angle;
		envelope=EnvGen.ar(Env.perc(attack,decay,1,[-3,-4]),doneAction:2);
		wave=PitchShift.ar(SoundIn.ar(0),3.5,pitchRatio:k.linlin(2,130,0,4),mul:1/k)*envelope;
		sum= sum+wave;
	};
	Out.ar(0,PanAz.ar(2,LeakDC.ar(sum*envelope),s*bus));

}).add;
)

(
Tdef(\sa,
      {
				 1.do({(e= Pdef(\1, Pbind(\instrument, \idvoc,
	\dur,Pwrand([4,2,1,0.5],[0.1,0.2,0.5,0.3],inf),
       \fund, Pwrand([1,1],[0.1,0.1],inf),
\b,Pwrand([3/1,4/2,5/3,6/4,7/5,8/6],[0.1,0.2,0.3,0.5,0.8,1.3],inf),
\attack,4,
	\decay,8,
	\fil,220,
	\bus,Prand([0.5,0.25,(-0.25),(-0.5)],inf);
)).play(quant:1));  0.yield});
				 1.do({(e= Pdef(\2, Pbind(\instrument, \idvoc,
	\dur,Pwrand([4,2,1,0.5],[0.1,0.2,0.5,0.3],inf),
       \fund, Pwrand([1.1,1.1],[0.1,0.1],inf),
\b,Pwrand([3/1,4/2,5/3,6/4,7/5,8/6],[0.1,0.2,0.3,0.5,0.8,1.3],inf),
\attack,4,
	\decay,8,
	\fil,220,
	\bus,Prand([0.5,0.25,(-0.25),(-0.5)],inf);
)).play(quant:1));  60.yield});

Pdef(\2).stop; 0.yield;
Pdef(\1).stop; 6.yield;
				 1.do({(e= Pdef(\1, Pbind(\instrument, \idvoc,
	\dur,Pwrand([4,2,1,0.5],[0.1,0.2,0.5,0.3],inf),
       \fund, Pwrand([1,1],[0.1,0.1],inf),
\b,Pwrand([3/1,4/2,5/3,6/4,7/5,8/6],[0.1,0.2,0.3,0.5,0.8,1.3],inf),
\attack,4,
	\decay,8,
	\fil,220,
	\bus,Prand([0.5,0.25,(-0.25),(-0.5)],inf);
)).play(quant:1));  0.yield});
				 1.do({(e= Pdef(\2, Pbind(\instrument, \idvoc,
	\dur,Pwrand([4,2,1,0.5],[0.1,0.2,0.5,0.3],inf),
       \fund, Pwrand([1.1,1.1],[0.1,0.1],inf),
\b,Pwrand([3/1,4/2,5/3,6/4,7/5,8/6],[0.1,0.2,0.3,0.5,0.8,1.3],inf),
\attack,4,
	\decay,8,
	\fil,220,
	\bus,Prand([0.5,0.25,(-0.25),(-0.5)],inf);
)).play(quant:1));  60.yield});

Pdef(\2).stop; 0.yield;
Pdef(\1).stop; 10.yield;
			})
)
Tdef(\sa).play;
Tdef(\sa).stop;



/////////////////////////////////////
/////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////installation pattern




s.options.numOutputBusChannels=8;
TempoClock.default.tempo_(120/120);
ServerOptions.inDevices.postln;
s.record(numChannels:2);
s.options.sampleRate =48000;
s.options.device_("USB Sound Device");
s.options.memSize = 524288
s.options.memSize
s.options.memSize
s.options.numInputBusChannels=0;
s.record(numChannels:2) ;

