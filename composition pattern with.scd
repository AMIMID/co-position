//////////////////////////////////

(
SynthDef.new(\id, {
	arg a=1,fund=200,b=1,o=10,x=1,bus=0,attack=1,decay=1,fil=440,gain=1;
	var y,sum=0,wave,k,s;
	var envelope,p=0;
	//b=TWChoose.kr(1,[4/1,5/2,6/3,7/4,8/5,9/6],[0.1,0.2,0.5,0.6,0.4,0.1]);
	b=b*(-1);
	//fund=fund/2;
	3.do{
		p=p+1/3;
		x=x+1;
		y=((x**b)+a)/(x**(b));
		k=Complex(x,y).abs;
		s=Complex(x,y).angle;
		envelope=EnvGen.ar(Env.perc(attack,decay,gain,[-4,-4]),doneAction:2);
		wave=SinOsc.ar(k*fund,mul: (1/k),phase:p);
		//wave=BLowPass.ar(VarSaw.ar(k*fund,mul: (1/k),iphase:p,width:SinOsc.ar(0.075/s)),fil,1)*envelope;
		sum= sum+wave;
		Out.ar(0,PanAz.ar(2,sum*gain*envelope,s*bus));
	};


}).add;
)

Synth.new(\id,[\fund,400,\attack,1,\decay,4,\bus,]);


(
(e= Pdef(\pat1, Pbind(\instrument, \id,
	\dur,Pwrand([4,2,1,0.5,0.25],[0.1,0.2,0.6,0.4,0.2],inf),
       \fund, Pwrand([100,200],[0.1,0.3],inf),
\b,Pwrand([4/1,5/2,6/3,7/4,8/5,9/6],[0.1,0.2,0.5,0.6,0.4,0.1],inf),
	\attack,0.075,
	\decay,2.75,
	\fil,440,
	\bus,Prand([0.5,0.25,(-0.25),(-0.5)],inf);
)).play(quant:1));
(d= Pdef(\pat2, Pbind(\instrument, \id,
		\dur,Pwrand([4,2,1,0.5,0.25],[0.1,0.2,0.6,0.4,0.2],inf),
       \fund, Pwrand([50.3,100.3],[0.1,0.3],inf),
\b,Pwrand([4/1,5/2,6/3,7/4,8/5,9/6],[0.1,0.2,0.5,0.6,0.4,0.1],inf),
	\attack,0.075,
	\decay,2.75,
	\fil,440,
	\bus,Prand([0.5,0.333,(-0.333),(-0.5)],inf);
)).play(quant:1))
)


(
Tdef(\sa,
      {

			})
)
Tdef(\sa).play;
Tdef(\sa).stop;



///////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////with spat
((
SynthDef.new(\id, {
	arg a=1,fund=200,b=1,o=10,x=1,bus=0,attack=1,decay=1,fil=440,gain=1;
	var y,sum=0,wave,k,s;
	var envelope,p=0;
	b=b*(-1);
	fund=fund/2;
	2.do{
		p=p+1/3;
		x=x+1;
		y=((x**b)+a)/(x**(b));
		k=Complex(x,y).abs;
		s=Complex(x,y).angle;
		envelope=EnvGen.ar(Env.perc(attack,decay,gain,[-4,-4]),doneAction:2);
		//wave=SinOsc.ar(k*fund,mul: (1/k),phase:p);
		wave=BLowPass.ar(VarSaw.ar(k*fund,mul: (1/k),iphase:p,width:SinOsc.ar(s)),fil,1)*envelope;
		sum= sum+wave;
		Out.ar(8,PanAz.ar(2,sum*envelope,s*el));
		Out.ar(0,PanAz.ar(4,InFeedback.ar(8)*envelope,s*az1));
		Out.ar(4,PanAz.ar(4,InFeedback.ar(9)*envelope,s*az2));
	};


}).add;
)
Synth.new(\id,[\fund,400,\attack,1,\decay,4,\bus,]);


(
(e= Pdef(\pat1, Pbind(\instrument, \id,
	\dur,Pwrand([4,2,1,0.5,0.25,0.125],[0.1,0.2,0.3,0.3,0.2,0.1],inf),
       \fund, Pwrand([100,200],[0.1,0.2],inf),
\b,Pwrand([4/1,5/2,6/3,7/4,8/5,9/6],[0.1,0.2,0.5,0.6,0.4,0.1],inf),
	\attack,0.075,
	\decay,4.75,
	\fil,440,
		\el,Prand([0.5,0.333,(-0.333),(-0.5)],inf),
	\az1,Prand([0.5,0.333,(-0.333),(-0.5)],inf),
	\az2,Prand([0.5,0.333,(-0.333),(-0.5)],inf);
)).play(quant:1));
(d= Pdef(\pat2, Pbind(\instrument, \id,
	\dur,Pwrand([4,2,1,0.5,0.25,0.125],[0.1,0.2,0.3,0.3,0.2,0.1],inf),
       \fund, Pwrand([50.1,100.1],[0.1,0.2],inf),
	\b,Pwrand([4/1,5/2,6/3],[0.1,0.2,0.3],inf),
	\attack,0.075,
	\decay,4.75,
	\fil,440,
	\el,Prand([0.5,0.333,(-0.333),(-0.5)],inf),
		\az1,Prand([0.5,0.333,(-0.333),(-0.5)],inf),
	\az2,Prand([0.5,0.333,(-0.333),(-0.5)],inf);
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



s.options.numOutputBusChannels=12
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

