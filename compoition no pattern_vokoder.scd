//////////////////////////////////no pattern + vokoder
s.options.memSize = 524288
(
SynthDef.new(\idv, {
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
		envelope=EnvGen.ar(Env.perc(attack,decay,5,[-4,-4]),doneAction:2);
		wave=PitchShift.ar(SoundIn.ar(0),3,pitchRatio:k.linlin(1,100,0,4),mul:1/k)*envelope;
		sum= sum+wave;
	};
			Out.ar(0,PanAz.ar(2,sum*envelope,s*bus));

}).add;
)
Synth.new(\id,[\fund,1,\attack,1,\decay,4,\bus,]);

(
(e= Pdef(\pat1, Pbind(\instrument, \idv,
	\dur,Pwrand([4,2,1,0.5,0.25],[0.1,0.2,0.6,0.4,0.2],inf),
       \fund, Pwrand([1,0],[0.1,0.3],inf),
\b,Pwrand([3/1,4/2,5/3,6/4,7/5,8/6],[0.1,0.2,0.5,0.3],inf),
\attack,1,
	\decay,3,
	\bus,Prand([0.5,0.25,(-0.25),(-0.5)],inf);
)).play(quant:1));
(d= Pdef(\pat2, Pbind(\instrument, \idv,
		\dur,Pwrand([4,2,1,0.5,0.25],[0.1,0.2,0.6,0.4,0.2],inf),
       \fund, Pwrand([1.5,2.5],[0.1,0.3],inf),
\b,Pwrand([3/1,4/2,5/3,6/4,7/5,8/6],[0.1,0.2,0.5,0.3],inf),
\attack,1,
	\decay,3,
	\bus,Prand([0.5,0.333,(-0.333),(-0.5)],inf);
)).play(quant:1))
)


/////////////////////////////////////
/////////////////////////////////////
(
~pot1 = MIDIFunc.cc( { arg vel,nn,chan,src; [vel,nn,chan,src];  ~a= vel.linlin(6,87,2,20).postln; "a".postln}, 71, 0);
~pot2 = MIDIFunc.cc( { arg vel,nn,chan,src; [vel,nn,chan,src];  ~b= vel.linlin(14,124,10,55).round.postln;"b".postln}, 73, 0);
)

MIDIClient.init;
MIDIIn.connectAll;

////////////////////////////////////////////////////////////////////////////////////installation pattern




s.options.numOutputBusChannels=8;
TempoClock.default.tempo_(120/45);
ServerOptions.inDevices.postln;
s.record(numChannels:2);
s.options.sampleRate =48000;
s.options.device_("USB Sound Device");
s.options.memSize = 524288
s.options.memSize
s.options.memSize
s.options.numInputBusChannels=0;
s.record(numChannels:2) ;

