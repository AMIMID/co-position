//////////////////////////////////a wave  fundamental as notes////bell pare ta arxidia mou///tetraedro apla pramata

(
(
SynthDef.new(\id, {
	arg a=1,fund=2,b=1,o=10,x=1;
	var y,decay=4,sum=0,wave;
	var envelope;
	b=TChoose.kr(Dust.ar(1),[2,2.1,2.3,2.4,2.5,2.6,2.7,2.8,2.9,3]);
	fund=fund*b;

	4.do{
		x=x+1;
		y=((x**b)+a)/(x**(1/b));
		envelope=EnvGen.ar(Env.perc(0.01,decay,1/b,[-2,-4]),doneAction:2);
		wave=BLowPass.ar(LFSaw.ar(y*fund,mul: (1/y)),y*fund,1);
		sum= sum+wave;
	};
	Out.ar(0,wave*10*envelope!2);

}).add;
);
)
.
Synth.new(\id)
/////////////////////////////////////

    (
        SynthDef(\RmOctaver, { |out|
            var in, freq, hasFreq;
            in = SoundIn.ar(0);
            # freq, hasFreq = Pitch.kr(in);
            Out.ar(out, SinOsc.ar(freq: freq * 0.5) * in + in);
        }).add;
    )

    Synth.new(\RmOctaver);

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

