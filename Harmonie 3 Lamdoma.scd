
( Pdef(\1, Pbind(\instrument, \id1,
			\dur,Pexprand(1,8,inf),
					\attack,Pexprand(0.01,0.1,inf),
	\interval,Pbrown(1,1,1,inf),
	\a,Prand([0,5/4,6/4,7/4],inf),
	\b,Prand([0,5/4,6/4,7/4],inf),
	\c,Prand([0,5/4,6/4,7/4],inf),
	\d,Prand([0,5/4,6/4,7/4],inf),
	\e,Prand([0,5/4,6/4,7/4],inf),
	\f,Prand([0,5/4,6/4,7/4],inf),
	\g,Prand([0,5/4,6/4,7/4],inf),
	\k,Prand([0,5/4,6/4,7/4],inf),
	\l,Prand([0,5/4,6/4,7/4],inf),
	\m,Prand([0,5/4,6/4,7/4],inf),
	\n,Prand([0,5/4,6/4,7/4],inf),
	\o,Prand([0,5/4,6/4,7/4],inf),
		\p,Prand([0,5/4,6/4,7/4],inf),
	\q,Prand([0,5/4,6/4,7/4],inf),
		\r,Prand([0,5/4,6/4,7/4],inf),
	\s,Prand([0,5/4,6/4,7/4],inf),
	\t,Prand([0,5/4,6/4,7/4],inf),
		\u,Prand([0,5/4,6/4,7/4],inf),
	\v,Prand([0,5/4,6/4,7/4],inf),
	\w,Prand([0,5/4,6/4,7/4],inf),
		\pr,Prand([0,5/4,6/4,7/4],inf),
	\detune,Pexprand(1,8,inf);
)).play(quant:1));

(
SynthDef.new(\id1, {

		arg dur=1,detune=0,attack=4,a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w,interval=1,pr;
	var sig,x=0,amp=1,audio=0,fund=1000;
	var env,freq=4,envd,envf,pan=1;
		var x1=0,x2=1,x3,y;
	   envd=EnvGen.ar(Env.perc(attack,10,1/1,[-4,-4]),doneAction:2);
		12.do{
		env=EnvGen.ar(Env.perc(attack,10,0.1/freq,[-4,-4]));
		envf=EnvGen.ar(Env.new([a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w],[0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand],[-4]));
		sig=PanAz.ar(2,SinOsc.ar(fund*freq,mul:env),LFNoise1.ar(1/pan),width:1);
		audio = audio +sig;
		x=x+1;
		freq=x/(x+1);
		fund=(fund*freq);
		amp=(amp*freq);
			x3=x1+x2;
		x1=x2;
		x2=x3;
		y=1+(1/x3);
			pan=pan*y;
	};
	Out.ar(0,audio*envd);
}).add;
)
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
////////////////////////////

( Pdef(\1, Pbind(\instrument, \id1,
			\dur,Pexprand(0.1,1,inf),
	\n,Prand([1,2,3,4],inf);
)).play(quant:1));

(
SynthDef.new(\id1, {

		arg n=1,m=1;
	var sig,x=0,amp=1;
	var env,freq=220;
		var y=1;

	24.do{
		env=EnvGen.ar(Env.perc(0.01,6,1/(amp*y),[-4,-4]),doneAction:2);
		sig=PanAz.ar(2,BLowPass.ar(SinOsc.ar(freq*y,mul:env),2400),LFSaw.ar(1/y));
		x=x+1;
		y=(x+n)/(n);
			Out.ar(0,sig);
	};
}).add;
)



(
{
	var n1=1,n2=2,n3=3;
	var x=0,y1=1, y2=1,y3=1;
	var freq=220,amp=1;
	var sig1,sig2,sig3;
	100.do{
		sig1=SinOsc.ar(freq*y1,mul:1/(amp*y1),phase:pi);
		sig2=SinOsc.ar(freq*y2,mul:1/(amp*y2),phase:pi);
		sig3=SinOsc.ar(freq*y3,mul:1/(amp*y3),phase:pi);
		x=x+1;
		y1=(x+n1)/(n1);
		y2=(x+n2)/(n2);
		y3=(x+n3)/(n3);
		Out.ar(0,sig1);
		Out.ar(1,sig2);
		Out.ar(2,sig3);
	};

}.play)


(
{
	var n=0;
	var x=0,y=1;
	var freq=220,amp=10;
	var sig;
	100.do{
		n=n+1;
	100.do{
		sig=SinOsc.ar(freq*y,mul:1/(amp*y),phase:pi);
		x=x+1;
		y=(x+n)/(n);
		Out.ar(0,sig);
	}};

}.play)
////////////////////////////////////////////////////////////////////////////////////////////
(
{
	var n=1;
	var x=0,y1=1,y2=1;
	var freq=2560,amp=0.1;
	var sig1,sig2;
	16.do{
		sig1=SinOsc.ar(freq*y1,mul:amp/y1,phase:pi);
		sig2=SinOsc.ar(freq*y2,mul:amp/y2,phase:pi);
		x=x+1;
		y1=n/(x+n);
		y2=(x+n)/n;
		y1.postln;
		Out.ar(0,sig1);
	//	Out.ar(1,sig2);
	};

}.play)


s.options.device_("USB Sound Device");
s.options.numOutputBusChannels=3
TempoClock.default.tempo_(120/10);
s.options.memSize = 65536;
s.options.numInputBusChannels=0;
s.record(numChannels:2) ;