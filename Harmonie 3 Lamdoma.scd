
( Pdef(\1, Pbind(\instrument, \id1,
			\dur,Pexprand(1,8,inf),
					\attack,Pexprand(0.01,0.1,inf),
	\interval,Pbrown(1,1,1,inf),
	\a,Prand([0,50],inf),
	\b,Prand([0,50],inf),
	\c,Prand([0,50],inf),
	\d,Prand([0,50],inf),
	\e,Prand([0,50],inf),
	\f,Prand([0,50],inf),
	\g,Prand([0,50],inf),
	\k,Prand([0,50],inf),
	\l,Prand([0,50],inf),
	\m,Prand([0,50],inf),
	\n,Prand([0,50],inf),
	\o,Prand([0,50],inf),
		\p,Prand([0,50],inf),
	\q,Prand([0,50],inf),
		\r,Prand([0,50],inf),
	\s,Prand([0,50],inf),
	\t,Prand([0,50],inf),
		\u,Prand([0,50],inf),
	\v,Prand([0,50],inf),
	\w,Prand([0,50],inf),
		\pr,Prand([0,50],inf),
	\detune,Pexprand(1,8,inf);
)).play(quant:1));

(
SynthDef.new(\id1, {

		arg dur=1,detune=0,attack=4,a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w,interval=1,pr;
	var sig,x=0,amp=1,audio=0,fund=200;
	var env,freq=4,envd,envf,pan=1;
		var x1=0,x2=1,x3,y;
	   envd=EnvGen.ar(Env.perc(attack,10,1/1,[-4,-4]),doneAction:2);
		12.do{
		env=EnvGen.ar(Env.perc(attack,10,1/amp,[-4,-4]));
		envf=EnvGen.ar(Env.new([a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w],[0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand],[-4]));
		sig=PanAz.ar(2,SinOsc.ar(fund+envf,mul:env),LFNoise1.ar(1/pan),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+interval)/x;
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
			\dur,1,
	\m,Pexprand(1,10,inf),
	\n,Pexprand(1,10,inf);
)).play(quant:1));

(
SynthDef.new(\id1, {

		arg n=2,m=1;
	var sig,x=0,amp=1;
	var env,freq=220;
		var y=1;

		24.do{
		env=EnvGen.ar(Env.perc(0.1,4,1/(amp*y),[-4,-4]),doneAction:2);
		sig=PanAz.ar(2,SinOsc.ar(freq*y,mul:env),LFSaw.ar(y));
		x=x+m;
		y=(x+n)/(n);
		y.postln;
			Out.ar(0,sig);
	};
}).add;
)



(
{
	var n=6;
	var x=0,sig,y=1,freq=220,amp=1;
	10.do{
		sig=SinOsc.ar(freq*y,mul:1/(amp*y))!2;
		x=x+5;
		y=(x+n)/(n);
		y.postln;
		Out.ar(0,sig);
	};
}.play)

s.options.device_("USB Sound Device");
s.options.numOutputBusChannels=6
TempoClock.default.tempo_(30/60);
s.options.memSize = 65536;
s.options.numInputBusChannels=0;
s.record(numChannels:2) ;