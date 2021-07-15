//////////////////////////////////

(
SynthDef.new(\id, {
	arg a=1,fund=2,b=1,o=10,x=1,bus=0,attack=1,decay=1;
	var y,sum=0,wave,c;
	var envelope;
	b=TChoose.kr(1,[-2/3,-3/4,-4/5,-5/6],[8,5,3,2]);
b=1/b;
	fund=fund*b;
	6.do{
		x=x+1;
		y=((x**b)+a)/(x**(b));
		envelope=EnvGen.ar(Env.perc(attack,decay,1/b,[-4,-6]),doneAction:2);
 wave=SinOsc.ar(y*fund,mul: (1/y));
		//wave=BLowPass.ar(LFSaw.ar(y*fund,mul: (1/y)),200,1);
		sum= sum+wave;
	};
	Out.ar(0,PanAz.ar(2,sum*envelope,bus));

}).add;
)
Synth.new(\id,[\fund,200,\attack,0.1])


(
Tdef(\sa,
      {
				 1.do({(
Tdef(\synth_x, { loop { 1.wait; (
	Synth.new(\id,[\fund,100,\attack,0.01,\decay,4,\bus,-0.5]));
} }).play;) ;  0.yield});

			 1.do({(
Tdef(\synth_y, { loop { 1.wait; (
	Synth.new(\id,[\fund,101,\attack,0.01,\decay,4,\bus,0.5]));
} }).play;) ;8.yield});

		Tdef(\synth_x).stop; 8.yield;
		Tdef(\synth_y).stop; 8.yield;
			})
)


Tdef(\sa).play;
Tdef(\sa).stop;





/////////////////////////////////////

(
//~pot1 = MIDIFunc.cc( { arg vel,nn,chan,src; [vel,nn,chan,src];  ~a= vel.linlin(6,87,2,20).postln; "a".postln}, 71, 0);
//~pot2 = MIDIFunc.cc( { arg vel,nn,chan,src; [vel,nn,chan,src];  ~b= vel.linlin(14,124,0.01,1).round.postln;"b".postln}, 73, 0);
~pot2 = MIDIFunc.cc( , 73, 0);
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
TempoClock.default.tempo_(60/15);
ServerOptions.inDevices.postln;
s.record(numChannels:2);
s.options.sampleRate =96000;
s.options.device_("USB Sound Device");
s.options.memSize = 65536;
s.options.memSize
s.options.numInputBusChannels=0;
s.record(numChannels:2) ;

