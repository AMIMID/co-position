s.options.memSize = 2097152
TempoClock.default.tempo_(120/60);

(
SynthDef.new(\idvoc, {
	arg a=1,fund=180,b=1,x=0,bus=1,attack=1,decay=1;
	var y,sum=0,wave;
	var envelope,p=0;
	var k,kpos,z,zpos,l,lpos,m,mpos,j,jpos,i,ipos,ay,apos;
	b=b*(-1);
	//fund=fund/2;
	6.do{
		p=p+(1/6);
		x=x+1;
		y=((x**b)+a)/(x**(b));
		k=Complex(x,y).abs;
		kpos=Complex(x,y).angle;

			z=(((k**b)-a)*fund)/(k**b);
		zpos=((kpos**b)-a)/(kpos**b);

		l=Complex(k,z).abs;
		lpos=Complex(kpos,zpos).angle;

		envelope=EnvGen.ar(Env.perc(attack,decay,20/k,[-4,-4]),doneAction:2);
		wave=PitchShift.ar(InFeedback.ar(3),6,pitchRatio:l.linlin(360,1399860,0,4),mul:envelope,timeDispersion:p);
			//wave=FreqShift.ar(InFeedback.ar(3),freq:l,mul:envelope,phase:p);
		sum= sum+wave;
		Out.ar(0,PanAz.ar(2,LeakDC.ar(sum*envelope),lpos*bus,width:1));
	};
}).add;
)

(
Tdef(\sa,{
				 1.do({(e= Pdef(\1, Pbind(\instrument, \idvoc,
	\dur,Pwrand([4,2,1,0.5,0.25],[1,2,4,2,1].normalizeSum,inf),
           \fund, 180,
\b,Pwrand([1,2,3,4,5],[1,2,4,2,1].normalizeSum,inf),
\attack,5,
	\decay,6,
		\bus,Prand([0.5,0.25,0.2,0,(-0.2),(-0.25),(-0.5)],inf);
		)).play(quant:1));  (0).yield});
			 1.do({(e= Pdef(\2, Pbind(\instrument, \idvoc,
	\dur,Pwrand([4,2,1,0.5,0.25],[1,2,4,2,1].normalizeSum,inf),
      	\fund, 180.03,
\b,Pwrand([1,2,3,4,5],[1,2,4,2,1].normalizeSum,inf),
\attack,5,
		\decay,6,
	\bus,Prand([0.5,0.25,0.2,0,(-0.2),(-0.25),(-0.5)],inf);
)).play(quant:1));  (3600).yield});


Pdef(\2).stop; 0.yield;
Pdef(\1).stop; 6.yield;

			})
)
(
({Out.ar(3,SoundIn.ar(0))}.play);
Tdef(\sa).play;
)
Tdef(\sa).stop;
s.options.numOutputBusChannels=6;
TempoClock.default.tempo_(120/120);
ServerOptions.inDevices.postln;
s.record(numChannels:2);
s.options.sampleRate =48000;
s.options.device_("Aggregate Device");
s.options.memSize = 524288
s.options.memSize
s.options.memSize
s.options.numInputBusChannels=2;
s.record(numChannels:6) ;
/////////////////////////////////////////////////////////////////////////vokoder only

(
SynthDef.new(\voc, {
	arg a=1,fund=360,b=1,x=0,bus=(-1),attack=1,decay=1;
	var y,sum=0,wave;
	var p=0;
	var k,kpos,z,zpos,l,lpos,m,mpos,j,jpos,i,ipos,ay,apos;
	b=b*(-1);
	//fund=fund/2;
	12.do{
		p=p+(1/12);
		x=x+1;
		y=((x**b)+a)/(x**(b));
		k=Complex(x,y).abs;
		kpos=Complex(x,y).angle;

			z=(((k**b)-a)*fund)/(k**b);
		zpos=((kpos**b)-a)/(kpos**b);

		l=Complex(k,z).abs;
		lpos=Complex(kpos,zpos).angle;

		wave=PitchShift.ar(InFeedback.ar(2),4,pitchRatio:l.linlin(0,4000,0,4),mul:1/k,timeDispersion:p);
		sum= sum+wave;
		Out.ar(0,PanAz.ar(2,LeakDC.ar(sum),lpos,width:1));
		Out.ar(0,PanAz.ar(2,LeakDC.ar(sum),lpos*bus,width:1));
	};
}).add;
)

(
(Synth.new(\voc));
({Out.ar(2,SoundIn.ar(0))}.play);
)

s.options.numOutputBusChannels=6;
TempoClock.default.tempo_(120/30);
ServerOptions.inDevices.postln;
s.record(numChannels:2);
s.options.sampleRate =48000;
s.options.device_("Aggregate Device");
s.options.memSize = 524288
s.options.memSize
s.options.memSize
s.options.numInputBusChannels=1

s.record(numChannels:6) ;
/////////////////////////////////////voc buff

///////////////////////////////////////////////////vok
a= Buffer.readChannel(s,channels:0,path:"/Users/petrostatsiopoulos/Dokuments/portfolio/sound/wav/untitled 2.wav")
(
SynthDef.new(\voc, {
	arg a=1,fund=440,b=1,x=0,bus=1,attack=1,decay=1;
	var y,sum=0,wave0,wave,sum1=0;
	var p=0;
	var k,kpos,z,zpos,l,lpos,m,mpos,j,jpos,i,ipos,ay,apos;
	b=b*(-1);
	//fund=fund/2;
	12.do{
		p=p+(1/26);
		x=x+1;
		y=((x**b)+a)/(x**(b));
		k=Complex(x,y).abs;
		kpos=Complex(x,y).angle;

			z=(((k**b)-a)*fund)/(k**b);
		zpos=((kpos**b)-a)/(kpos**b);

		l=Complex(k,z).abs;
		lpos=Complex(kpos,zpos).angle;
         wave0=FreqShift.ar(PlayBuf.ar(1,0,BufRateScale.kr(0),loop:inf);,freq:l,mul:1/k,phase:p);
		wave=PitchShift.ar(wave0,6,pitchRatio:l.linlin(0,4000,0,4),mul:1/k,timeDispersion:p);
		sum= sum+wave;
		Out.ar(0,PanAz.ar(2,LeakDC.ar(sum),lpos,width:2));
	};
}).add;
)
(Synth.new(\voc))