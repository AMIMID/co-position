(
SynthDef.new(\vokoder, {
	arg a=1,fund=20,b=2,x=0,bus=4;
	var y,sum=0,wave,k,s,envelope;
	var p=0;
	//b=TWChoose.kr(1,[4/1,5/2,6/3,7/4,8/5,9/6],[0.1,0.2,0.5,0.6,0.4,0.1]);
	b=b*(-1);
	//fund=fund/2;
	4.do{
		p=p+((1/4)*pi);
		x=x+1;
		y=((x**b)+a)/(x**(b));
		k=Complex(x,y).abs;
		s=Complex(x,y).angle;
			envelope=EnvGen.ar(Env.perc(4,4,1/k,[-3,-4]),doneAction:2);
		wave=PitchShift.ar(SoundIn.ar(0),4,pitchRatio:(fund*k).linlin(2,130,0,4),mul:envelope);
		sum= sum+wave;
	};
	Out.ar(0,PanAz.ar(2,LeakDC.ar(sum)*envelope,s*SinOsc.ar(0.1)));

}).add;
)

Synth.new(\vokoder)


(e= Pdef(\1, Pbind(\instrument, \vokoder,
	\dur,1;
)).play(quant:1))