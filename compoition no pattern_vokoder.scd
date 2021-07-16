//////////////////////////////////no pattern + vokoder

(
SynthDef.new(\id, {
	arg a=1,fund=200,b=1,o=10,x=0,bus=0,attack=1,decay=1;
	var y,sum=0,wave,c;
	var envelope,p=1/6;
	p=p*(-1);
	b=TChoose.kr(1,[6/5,7/4,8/3,9/2],[8,5,3,2]);
	fund=fund*b;
	30.do{
		p=p+1/4;
		x=x+1;
		y=((x**b)+a)/(x**(b));
		envelope=EnvGen.ar(Env.perc(attack,decay,1,[-4,-6]),doneAction:2);
      wave=SinOsc.ar(y*fund,mul: (1/y))*envelope;
		//wave=PitchShift.ar(SoundIn.ar([0,1]),0.2,pitchRatio:(y*fund),mul:1/y);
		sum= sum+wave;
	};
	Out.ar(0,LeakDC.ar(wave,));

}).add;
)
Synth.new(\id,[\fund,400,\attack,1,\decay,4,\bus,]);


(
Tdef(\sa,
      {
				 1.do({(
Tdef(\synth_x, { loop { 1.wait; (
	Synth.new(\id,[\fund,110,\attack,1,\decay,4,\bus,-0.5]));
} }).play;) ;  0.yield});

					 1.do({(
Tdef(\synth_y, { loop { 1.wait; (
	Synth.new(\id,[\fund,111,\attack,1,\decay,4,\bus,0.5]));
} }).play;) ;  16.yield});

		Tdef(\synth_x).stop; 8.yield;
		Tdef(\synth_y).stop; 8.yield;
			})
)
Tdef(\sa).play;
Tdef(\sa).stop;

/////////////////////////////////////
/////////////////////////////////////
(
~pot1 = MIDIFunc.cc( { arg vel,nn,chan,src; [vel,nn,chan,src];  ~a= vel.linlin(6,87,2,20).postln; "a".postln}, 71, 0);
~pot2 = MIDIFunc.cc( { arg vel,nn,chan,src; [vel,nn,chan,src];  ~b= vel.linlin(14,124,10,55).round.postln;"b".postln}, 73, 0);
)

MIDIClient.init;
MIDIIn.connectAll;

////////////////////////////////////////////////////////////////////////////////////installation pattern
////////////////////////////////////////////////////////////////////////////////////////////////////
(
c= Pdef(\ii, Pbind(\instrument, \id,
\b,Pgauss(2,3,1/4,inf)
)).play(quant:1));





s.options.numOutputBusChannels=8;
TempoClock.default.tempo_(120/83);
ServerOptions.inDevices.postln;
s.record(numChannels:2);
s.options.sampleRate =48000;
s.options.device_("USB Sound Device");
s.options.memSize = 65536;
s.options.memSize
s.options.numInputBusChannels=0;
s.record(numChannels:2) ;

