//////////////////////////////////

(
SynthDef.new(\id, {
	arg a=1,fund=200,b=1,x=0,bus=0,attack=1,decay=1,fil=440,gain=1;
	var y,sum=0,wave,k,s;
	var envelope,p=0;
	var l,m;
	//b=TWChoose.kr(1,[4/1,5/2,6/3,7/4,8/5,9/6],[0.1,0.2,0.5,0.6,0.4,0.1]);
	b=b*(-1);
	//fund=fund/2;
	6.do{
		p=p+1/6;
		x=x+1;
		y=((x**b)+a)/(x**(b));
		k=Complex(x,y).abs;
		s=Complex(x,y).angle;
		l=((k**b)+a)/(k**b);
		m=((s**b)+a)/(s**b);
		envelope=EnvGen.ar(Env.perc(attack,decay,1/y,[-2,-4]),doneAction:2);
		wave=BLowPass.ar(SinOsc.ar(l*fund,mul: envelope,phase:p),440);
		//wave=LFTri.ar(k*fund,mul: (1/k),iphase:p,mul:envelope);
		sum= sum+wave;
		Out.ar(0,PanAz.ar(2,sum*envelope,m*bus));
	};


}).add;
)

Synth.new(\id,[\fund,400,\attack,1,\decay,4,\bus,]);


;

(
Tdef(\sa,
      {
				 1.do({(g= Pdef(\1, Pbind(\instrument, \id,
	\dur,Pwrand([2,1,0.5],[1,2,3].normalizeSum.postln,inf),
       \fund, Pwrand([100,200,300,400],[5,3,2,1].normalizeSum,inf),
\b,Pwrand([3/1,4/2,5/3,6/4,7/5,8/6,9/7],[1,2,3,5,3,2,1].normalizeSum,inf),
\attack,0.01,
	\decay,2,
	\fil,440,
	\bus,Prand([0.5,0.25,(-0.25),(-0.5)],inf);
		)).play(quant:1));  (0).yield});
		1.do({(f= Pdef(\2, Pbind(\instrument, \id,
	\dur,Pwrand([2,1,0.5],[1,2,3].normalizeSum.postln,inf),
       \fund, Pwrand([100.05,200.05,300.05,400.05,],[5,3,2,1].normalizeSum,inf),
\b,Pwrand([3/1,4/2,5/3,6/4,7/5,8/6,9/7],[1,2,3,5,3,2,1].normalizeSum,inf),
\attack,0.01,
	\decay,2,
	\fil,440,
	\bus,Prand([0.5,0.25,(-0.25),(-0.5)],inf);
)).play(quant:1));  (360).yield});
Pdef(\1).stop;
		Pdef(\2).stop;
			})
)
Tdef(\sa).play;
Tdef(\sa).stop;



///////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////with spat
(
SynthDef.new(\id, {
	arg az1=0,az2=0,az3=0,az4=0,el=0,a=1,fund=200, b=1,x=0,bus=0,attack=1,decay=1,fil=440,gain=1;
	var y,sum=0,wave,k,s;
	var envelope,p=0;
	b=b*(-1);
	//fund=fund/2
	4.do{
		p=p+1/4;
		x=x+1;
		y=((x**b)+a)/(x**(b));
		k=Complex(x,y).abs;
		s=Complex(x,y).angle;
		envelope=EnvGen.ar(Env.perc(attack,decay,gain,[-4,-4]),doneAction:2);
		wave=SinOsc.ar(k*fund,mul: (1/k),phase:p);
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
(e= Pdef(\pat1, Pbind(\instrument, \id,
	\dur,Pwrand([4,2,1,0.5,0.25,0.125],[0.1,0.2,0.3,0.3,0.2,0.1],inf),
       \fund, Pwrand([100,200],[0.1,0.2],inf),
\b,Pwrand([3/1,4/2,5/3,6/4,7/5,8/6],[0.1,0.2,0.5,0.3],inf),
	\attack,0.01,
	\decay,3,
	\fil,440,
		\el,Prand([0.5,0.333,(-0.333),(-0.5)],inf),
	\az1,Prand([0.5,0.333,(-0.333),(-0.5)],inf),
	\az2,Prand([0.5,0.333,(-0.333),(-0.5)],inf),
		\az3,Prand([0.5,0.333,(-0.333),(-0.5)],inf),
	\az4,Prand([0.5,0.333,(-0.333),(-0.5)],inf);
)).play(quant:1));
(d= Pdef(\pat2, Pbind(\instrument, \id,
	\dur,Pwrand([4,2,1,0.5,0.25,0.125],[0.1,0.2,0.3,0.3,0.2,0.1],inf),
       \fund, Pwrand([50.1,100.1],[0.1,0.2],inf),
\b,Pwrand([3/1,4/2,5/3,6/4,7/5,8/6],[0.1,0.2,0.5,0.3],inf),
\attack,0.01,
	\decay,3,
	\fil,440,
	\el,Prand([0.5,0.333,(-0.333),(-0.5)],inf),
		\az1,Prand([0.5,0.333,(-0.333),(-0.5)],inf),
	\az2,Prand([0.5,0.333,(-0.333),(-0.5)],inf),
		\az3,Prand([0.5,0.333,(-0.333),(-0.5)],inf),
	\az4,Prand([0.5,0.333,(-0.333),(-0.5)],inf);
)).play(quant:1))
)

/////////////////////////////////////

(
//~pot1 = MIDIFunc.cc( { arg vel,nn,chan,src; [vel,nn,chan,src];  ~a= vel.linlin(6,87,2,20).postln; "a".postln}, 71, 0);
//~pot2 = MIDIFunc.cc( { arg vel,nn,chan,src; [vel,nn,chan,src];  ~b= vel.linlin(14,124,0.01,1).round.postln;"b".postln}, 73, 0);
~pot2 = MIDIFunc.cc( , 73, 0);
)

MIDIClient.init;
MIDIIn.connectAll;



s.options.numOutputBusChannels=24
TempoClock.default.tempo_(60/30);
);
ServerOptions.inDevices.postln;
s.record(numChannels:2);
s.options.sampleRate =48000;
s.options.device_("USB Sound Device");
s.options.memSize = 65536;
s.options.memSize
s.options.numInputBusChannels=0;
s.record(numChannels:2) ;

