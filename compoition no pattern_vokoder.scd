//////////////////////////////////no pattern + vokoder
s.options.memSize = 2097152
TempoClock.default.tempo_(120/8);

(
SynthDef.new(\idvoc, {
	arg a=1,fund=200,b=1,x=0,bus=0,attack=1,decay=1;
	var y,sum=0,wave,k,s;
	var envelope,p=0;
	//b=TWChoose.kr(1,[4/1,5/2,6/3,7/4,8/5,9/6],[0.1,0.2,0.5,0.6,0.4,0.1]);
	b=b*(-1);
	//fund=fund/2;
	7.do{
		p=p+((1/7)*pi);
		x=x+1;
		y=((x**b)+a)/(x**(b));
		k=Complex(x,y).abs;
		s=Complex(x,y).angle;
		envelope=EnvGen.ar(Env.perc(attack,decay,47/k,[-2,-4]),doneAction:2);
		wave=PitchShift.ar(SoundIn.ar(0),3,pitchRatio:(fund*k).linlin(2,130,0,4),mul:envelope,timeDispersion:p);
		sum= sum+wave;
	};
	Out.ar(0,PanAz.ar(2,LeakDC.ar(sum*envelope),s*bus));

}).add;
)

(
Tdef(\sa,
      {
				 1.do({(e= Pdef(\1, Pbind(\instrument, \idvoc,
	\dur,Pwrand([4,2,1,0.5,0.25],[2,3,5,3,2].normalizeSum,inf),
       \fund, Pwrand([10,20,30,40,50],[2,3,5,3,2].normalizeSum,inf),
\b,Pwrand([3/1,4/2,5/3,6/4,7/3],[2,3,5,3,2].normalizeSum,inf),
\attack,0.1,
	\decay,4,
	\bus,Prand([0.5,0.25,(-0.25),(-0.5)],inf);
)).play(quant:1));  0.yield});
			 1.do({(e= Pdef(\2, Pbind(\instrument, \idvoc,
	\dur,Pwrand([4,2,1,0.5,0.25],[2,3,5,3,2].normalizeSum,inf),
       \fund, Pwrand([10,20,30,40,50],[2,3,5,3,2].normalizeSum,inf),
\b,Pwrand([3/1,4/2,5/3,6/4,7/3],[2,3,5,3,2].normalizeSum,inf),
\attack,0.01,
	\decay,4,
	\bus,Prand([0.5,0.25,(-0.25),(-0.5)],inf);
)).play(quant:1));  3600.yield});

Pdef(\2).stop; 0.yield;
Pdef(\1).stop; 6.yield;

			})
)
Tdef(\sa).play;
Tdef(\sa).stop;



/////////////////////////////////////
/////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////with spat


(
SynthDef.new(\vokoda, {
	arg az1=0,az2=0,az3=0,az4=0,el=0,a=1,fund=200, b=1,x=0,bus=0,attack=1,decay=1;
	var y,sum=0,wave,k,s;
	var envelope,p=0;
	b=b*(-1);
	fund=fund/2;
8.do{
		p=p+1/4;
		x=x+1;
		y=((x**b)+a)/(x**(b));
		k=Complex(x,y).abs;
		s=Complex(x,y).angle;
		envelope=EnvGen.ar(Env.perc(attack,decay,2/k,[-4,-4]),doneAction:2);
		wave=PitchShift.ar(SoundIn.ar(0),4,pitchRatio:(fund*k).linlin(2,130,0,4),mul:envelope,timeDispersion:p);
		sum= sum+wave;
		Out.ar(20,PanAz.ar(4,sum*envelope,s*el));
		Out.ar(0,PanAz.ar(20,InFeedback.ar(20)*envelope,s*az1));
		Out.ar(5,PanAz.ar(5,InFeedback.ar(21)*envelope,s*az2));
		Out.ar(10,PanAz.ar(5,InFeedback.ar(22)*envelope,s*az3));
		Out.ar(15,PanAz.ar(5,InFeedback.ar(23)*envelope,s*az4));
	};


}).add;
)
Synth.new(\id,[\fund,400,\attack,1,\decay,4,\bus,]);


(
(e= Pdef(\pat1, Pbind(\instrument, \vokoda,
	\dur,Pwrand([4,2,1,0.5,0.25,0.125],[0.1,0.2,0.3,0.3,0.2,0.1],inf),
       \fund, Pwrand([10,20],[0.1,0.2],inf),
\b,Pwrand([3/1,4/2,5/3,6/4,7/5,8/6],[0.1,0.2,0.5,0.3],inf),
	\attack,2,
	\decay,3,
		\el,Prand([0.5,0.333,(-0.333),(-0.5)],inf),
	\az1,Prand([0],inf),
	\az2,Prand([0.5,0.333,(-0.333),(-0.5)],inf),
		\az3,Prand([0.5,0.333,(-0.333),(-0.5)],inf),
	\az4,Prand([0.5,0.333,(-0.333),(-0.5)],inf);
)).play(quant:1));
)


s.options.numOutputBusChannels=24;
TempoClock.default.tempo_(120/60);
ServerOptions.inDevices.postln;
s.record(numChannels:2);
s.options.sampleRate =48000;
s.options.device_("Aggregate Device");
s.options.memSize = 524288
s.options.memSize
s.options.memSize
s.options.numInputBusChannels=0;
s.record(numChannels:2) ;

