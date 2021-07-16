//////////////////////////////////

(
SynthDef.new(\id, {
	arg a=1,fund=200,b=1,o=10,x=1,bus=0,attack=1,decay=1,fil=440,presens=1;
	var y,sum=0,wave,c,k;
	var envelope,p=0;
	b=TWChoose.kr(1,[4/1,5/2,6/3,7/4,8/5,9/6],[0.1,0.2,0.5,0.6,0.4,0.1]);
	b=b*(-1);
	fund=fund/2;
	2.do{
		p=p+1/2;
		x=x+1;
		y=((x**b)+a)/(x**(b));
		k=Complex(x,y).abs;
		envelope=EnvGen.ar(Env.perc(attack,decay,k,[-4,-4]),doneAction:2);
		wave=BLowPass.ar(VarSaw.ar(k*fund,mul: (1/k),iphase:p,width:1/k),fil,1);
		sum= sum+wave;};
	Out.ar(0,PanAz.ar(2,sum*presens*envelope,SinOsc.ar(bus)));

}).add;
)
Synth.new(\id,[\fund,400,\attack,1,\decay,4,\bus,]);


(
(e= Pdef(\pat1, Pbind(\instrument, \id,
	\dur,Pwrand([4,2,1,0.5,0.25,0.125],[0.1,0.2,0.3,0.3,0.2,0.1],inf),
       \fund, Pwrand([50,100],[0.1,0.2],inf),
	\b,Pwrand([4/1,5/2,6/3,7/4,8/5,9/6],[0.1,0.6],inf),
	\attack,1,
	\decay,2,
	\fil,440,
	\bus,1.1;
)).play(quant:1));
(d= Pdef(\pat2, Pbind(\instrument, \id,
	\dur,Pwrand([4,2,1,0.5,0.25,0.125],[0.1,0.2],inf),
       \fund, Pwrand([51,101],[0.1,0.2],inf),
	\b,Pwrand([4/1,5/2,6/3],[0.1,0.2,0.3],inf),
	\attack,1,
	\decay,2,
	\fil,220,
	\bus,1.5;
)).play(quant:1))
)


(
Tdef(\sa,
      {

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
TempoClock.default.tempo_(60/29);
);
ServerOptions.inDevices.postln;
s.record(numChannels:2);
s.options.sampleRate =48000;
s.options.device_("USB Sound Device");
s.options.memSize = 65536;
s.options.memSize
s.options.numInputBusChannels=0;
s.record(numChannels:2) ;
