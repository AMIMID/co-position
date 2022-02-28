(
SynthDef.new(\id1, {

		arg dur=1,detune=1,attack=4,a,b,c,d,e,f,g,k,l,m,n,o;
	var sig,x=0,amp=1,audio=0,fund=120;
	var env,freq=4,envd,envf;
	   envd=EnvGen.ar(Env.perc(attack,12,1/1,[-4,-4]),doneAction:2);
		32.do{
		env=EnvGen.ar(Env.perc(attack.rand,12,1/amp,[-4,-4]));
		envf=EnvGen.ar(Env.new([a,b,c,d,e,f,g,k,l,m,n,o],[1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand],[-4]));
		sig=PanAz.ar(2,SinOsc.ar(fund+envf,mul:env),LFNoise1.ar(amp),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+1)/x;
		fund=(fund*freq+detune);
		amp=(amp*freq+detune);
	};
	Out.ar(0,audio*envd);
}).add;
);



( Pdef(\1, Pbind(\instrument, \id1,
		\dur,Pexprand(1,6,inf),
		\attack,Pbrown(0.1,2,0.1,inf),
	\a,Pexprand(1,20,inf),
	\b,Pexprand(1,20,inf),
	\c,Pexprand(1,20,inf),
	\d,Pexprand(1,20,inf),
	\e,Pexprand(1,20,inf),
	\f,Pexprand(1,20,inf),
	\g,Pexprand(1,20,inf),
	\k,Pexprand(1,20,inf),
	\l,Pexprand(1,20,inf),
	\m,Pexprand(1,20,inf),
	\n,Pexprand(1,20,inf),
	\o,Pexprand(1,20,inf),
	\detune,Pbrown(1,2,1,inf);
)).play(quant:1));



EnvGen.ar(Env.new([10,20,40,30],[1,1,1],[-4,4,-4]));



(Env.new([10,20,40,30],[1,1,1],[-8,8,-8])).plot


(
(
SynthDef.new(\id1, {

		arg dur=1,detune=1,attack=4,a,b,c,d,e,f,g,k,l,m,n,o;
	var sig,x=0,amp=1,audio=0,fund=240;
	var env,freq=4,envd,envf;
	   envd=EnvGen.ar(Env.perc(attack,12,1/1,[-4,-4]),doneAction:2);
		32.do{
		env=EnvGen.ar(Env.perc(attack,12,1/amp,[-4,-4]));
		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2],[1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand],[-8]));
		sig=PanAz.ar(2,SinOsc.ar(fund+envf,mul:env),LFNoise1.ar(amp.rand),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+1)/x;
		fund=(fund*freq+detune);
		amp=(amp*freq+detune);
	};
	Out.ar(0,audio*envd);
}).add;
);
(
SynthDef.new(\id2, {

		arg dur=1,detune=1,attack=4,a,b,c,d,e,f,g,k,l,m,n,o;
	var sig,x=0,amp=1,audio=0,fund=240;
	var env,freq=4,envd,envf;
	   envd=EnvGen.ar(Env.perc(attack,12,1/1,[-4,-4]),doneAction:2);
		32.do{
		env=EnvGen.ar(Env.perc(attack,12,1/amp,[-4,-4]));
		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2],[1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand],[-8]));
		sig=PanAz.ar(2,SinOsc.ar(fund+envf,mul:env),LFNoise1.ar(amp.rand),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+1)/x;
		fund=(fund*freq+detune);
		amp=(amp*freq+detune);
	};
	Out.ar(0,audio*envd);
}).add;
);
(
SynthDef.new(\id3, {

		arg dur=1,detune=1,attack=4,a,b,c,d,e,f,g,k,l,m,n,o;
	var sig,x=0,amp=1,audio=0,fund=320;
	var env,freq=4,envd,envf;
	   envd=EnvGen.ar(Env.perc(attack,12,1/2,[-4,-4]),doneAction:2);
		32.do{
		env=EnvGen.ar(Env.perc(attack,12,1/amp,[-4,-4]));
		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2],[1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand],[-8]));
		sig=PanAz.ar(2,SinOsc.ar(fund+envf,mul:env),LFNoise1.ar((amp.rand)),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+1)/x;
		fund=(fund*freq+detune);
		amp=(amp*freq+detune);
	};
	Out.ar(0,audio*envd);
}).add;
);
(
SynthDef.new(\id4, {

		arg dur=1,detune=1,attack=4,a,b,c,d,e,f,g,k,l,m,n,o;
	var sig,x=0,amp=1,audio=0,fund=320;
	var env,freq=4,envd,envf;
	   envd=EnvGen.ar(Env.perc(attack,12,1/2,[-4,-4]),doneAction:2);
		32.do{
		env=EnvGen.ar(Env.perc(attack,12,1/amp,[-4,-4]));
		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2],[1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand],[-8]));
		sig=PanAz.ar(2,SinOsc.ar(fund+envf,mul:env),LFNoise1.ar((amp.rand)),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+1)/x;
		fund=(fund*freq+detune);
		amp=(amp*freq+detune);
	};
	Out.ar(0,audio*envd);
}).add;
);
(
SynthDef.new(\id5, {

		arg dur=1,detune=1,attack=4,a,b,c,d,e,f,g,k,l,m,n,o;
	var sig,x=0,amp=1,audio=0,fund=320;
	var env,freq=4,envd,envf;
	   envd=EnvGen.ar(Env.perc(attack,12,1/2,[-4,-4]),doneAction:2);
		32.do{
		env=EnvGen.ar(Env.perc(attack,12,1/amp,[-4,-4]));
		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2],[1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand],[-8]));
		sig=PanAz.ar(2,SinOsc.ar(fund+envf,mul:env),LFNoise1.ar(amp.rand),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+1)/x;
		fund=(fund*freq+detune);
		amp=(amp*freq+detune);
	};
	Out.ar(0,audio*envd);
}).add;
);
(
SynthDef.new(\id6, {

		arg dur=1,detune=1,attack=4,a,b,c,d,e,f,g,k,l,m,n,o;
	var sig,x=0,amp=1,audio=0,fund=360;
	var env,freq=4,envd,envf;
	   envd=EnvGen.ar(Env.perc(attack,12,1/3,[-4,-4]),doneAction:2);
		32.do{
		env=EnvGen.ar(Env.perc(attack,12,1/amp,[-4,-4]));
		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2],[1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand],[-8]));
		sig=PanAz.ar(2,SinOsc.ar(fund+envf,mul:env),LFNoise1.ar(amp.rand),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+1)/x;
		fund=(fund*freq+detune);
		amp=(amp*freq+detune);
	};
	Out.ar(0,audio*envd);
}).add;
);
(
SynthDef.new(\id7, {

		arg dur=1,detune=1,attack=4,a,b,c,d,e,f,g,k,l,m,n,o;
	var sig,x=0,amp=1,audio=0,fund=360;
	var env,freq=4,envd,envf;
	   envd=EnvGen.ar(Env.perc(attack,12,1/3,[-4,-4]),doneAction:2);
		32.do{
		env=EnvGen.ar(Env.perc(attack,12,1/amp,[-4,-4]));
		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2],[1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand],[-8]));
		sig=PanAz.ar(2,SinOsc.ar(fund+envf,mul:env),LFNoise1.ar(amp.rand),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+1)/x;
		fund=(fund*freq+detune);
		amp=(amp*freq+detune);
	};
	Out.ar(0,audio*envd);
}).add;
);
(
SynthDef.new(\id8, {

		arg dur=1,detune=1,attack=4,a,b,c,d,e,f,g,k,l,m,n,o;
	var sig,x=0,amp=1,audio=0,fund=360;
	var env,freq=4,envd,envf;
	   envd=EnvGen.ar(Env.perc(attack,12,1/3,[-4,-4]),doneAction:2);
		32.do{
		env=EnvGen.ar(Env.perc(attack,12,1/amp,[-4,-4]));
		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2],[1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand],[-8]));
		sig=PanAz.ar(2,SinOsc.ar(fund+envf,mul:env),LFNoise1.ar(amp.rand),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+1)/x;
		fund=(fund*freq+detune);
		amp=(amp*freq+detune);
	};
	Out.ar(0,audio*envd);
}).add;
);
(
SynthDef.new(\id9, {

		arg dur=1,detune=1,attack=4,a,b,c,d,e,f,g,k,l,m,n,o;
	var sig,x=0,amp=1,audio=0,fund=360;
	var env,freq=4,envd,envf;
	   envd=EnvGen.ar(Env.perc(attack,12,1/3,[-4,-4]),doneAction:2);
		32.do{
		env=EnvGen.ar(Env.perc(attack,12,1/amp,[-4,-4]));
		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2],[1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand],[-8]));
		sig=PanAz.ar(2,SinOsc.ar(fund+envf,mul:env),LFNoise1.ar(amp.rand),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+1)/x;
		fund=(fund*freq+detune);
		amp=(amp*freq+detune);
	};
	Out.ar(0,audio*envd);
}).add;
);
(
SynthDef.new(\id10, {

		arg dur=1,detune=1,attack=4,a,b,c,d,e,f,g,k,l,m,n,o;
	var sig,x=0,amp=1,audio=0,fund=480;
	var env,freq=4,envd,envf;
	   envd=EnvGen.ar(Env.perc(attack,12,1/4,[-4,-4]),doneAction:2);
		32.do{
		env=EnvGen.ar(Env.perc(attack,12,1/amp,[-4,-4]));
		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2],[1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand,1.rand],[-8]));
		sig=PanAz.ar(2,SinOsc.ar(fund+envf,mul:env),LFNoise1.ar(amp.rand),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+1)/x;
		fund=(fund*freq+detune);
		amp=(amp*freq+detune);
	};
	Out.ar(0,audio*envd);
}).add;
)
)


//////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
(

( Pdef(\1, Pbind(\instrument, \id1,
			\dur,Pexprand(1,12,inf),
					\attack,Pbrown(1,2,0.1,inf),
	\a,Pexprand(1,100,inf),
	\b,Pexprand(1,100,inf),
	\c,Pexprand(1,100,inf),
	\d,Pexprand(1,100,inf),
	\e,Pexprand(1,100,inf),
	\f,Pexprand(1,100,inf),
	\g,Pexprand(1,100,inf),
	\k,Pexprand(1,100,inf),
	\l,Pexprand(1,100,inf),
	\m,Pexprand(1,100,inf),
	\n,Pexprand(1,100,inf),
	\o,Pexprand(1,100,inf),
	\detune,Pexprand(1,4,inf);
)).play(quant:1));

( Pdef(\2, Pbind(\instrument, \id2,
		\dur,Pexprand(1,12,inf),
				\attack,Pbrown(1,2,0.1,inf),
	\a,Pexprand(1,100,inf),
	\b,Pexprand(1,100,inf),
	\c,Pexprand(1,100,inf),
	\d,Pexprand(1,100,inf),
	\e,Pexprand(1,100,inf),
	\f,Pexprand(1,100,inf),
	\g,Pexprand(1,100,inf),
	\k,Pexprand(1,100,inf),
	\l,Pexprand(1,100,inf),
	\m,Pexprand(1,100,inf),
	\n,Pexprand(1,100,inf),
	\o,Pexprand(1,100,inf),
	\detune,Pexprand(1,4,inf);
)).play(quant:1));

( Pdef(\3, Pbind(\instrument, \id3,
		\dur,Pexprand(1,12,inf),
						\attack,Pbrown(1,2,0.1,inf),
	\a,Pexprand(1,100,inf),
	\b,Pexprand(1,100,inf),
	\c,Pexprand(1,100,inf),
	\d,Pexprand(1,100,inf),
	\e,Pexprand(1,100,inf),
	\f,Pexprand(1,100,inf),
	\g,Pexprand(1,100,inf),
	\k,Pexprand(1,100,inf),
	\l,Pexprand(1,100,inf),
	\m,Pexprand(1,100,inf),
	\n,Pexprand(1,100,inf),
	\o,Pexprand(1,100,inf),
	\detune,Pexprand(1,4,inf);
)).play(quant:1));

( Pdef(\4, Pbind(\instrument, \id4,
		\dur,Pexprand(1,12,inf),
						\attack,Pbrown(1,2,0.1,inf),
	\a,Pexprand(1,100,inf),
	\b,Pexprand(1,100,inf),
	\c,Pexprand(1,100,inf),
	\d,Pexprand(1,100,inf),
	\e,Pexprand(1,100,inf),
	\f,Pexprand(1,100,inf),
	\g,Pexprand(1,100,inf),
	\k,Pexprand(1,100,inf),
	\l,Pexprand(1,100,inf),
	\m,Pexprand(1,100,inf),
	\n,Pexprand(1,100,inf),
	\o,Pexprand(1,100,inf),
	\detune,Pexprand(1,4,inf);
)).play(quant:1));

( Pdef(\5, Pbind(\instrument, \id5,
		\dur,Pexprand(1,12,inf),
						\attack,Pbrown(1,2,0.1,inf),
	\a,Pexprand(1,100,inf),
	\b,Pexprand(1,100,inf),
	\c,Pexprand(1,100,inf),
	\d,Pexprand(1,100,inf),
	\e,Pexprand(1,100,inf),
	\f,Pexprand(1,100,inf),
	\g,Pexprand(1,100,inf),
	\k,Pexprand(1,100,inf),
	\l,Pexprand(1,100,inf),
	\m,Pexprand(1,100,inf),
	\n,Pexprand(1,100,inf),
	\o,Pexprand(1,100,inf),
	\detune,Pexprand(1,4,inf);
)).play(quant:1));

( Pdef(\6, Pbind(\instrument, \id6,
		\dur,Pexprand(1,12,inf),
					\attack,Pbrown(1,2,0.1,inf),
	\a,Pexprand(1,100,inf),
	\b,Pexprand(1,100,inf),
	\c,Pexprand(1,100,inf),
	\d,Pexprand(1,100,inf),
	\e,Pexprand(1,100,inf),
	\f,Pexprand(1,100,inf),
	\g,Pexprand(1,100,inf),
	\k,Pexprand(1,100,inf),
	\l,Pexprand(1,100,inf),
	\m,Pexprand(1,100,inf),
	\n,Pexprand(1,100,inf),
	\o,Pexprand(1,100,inf),
	\detune,Pexprand(1,4,inf);
)).play(quant:1));

( Pdef(\7, Pbind(\instrument, \id7,
		\dur,Pexprand(1,12,inf),
						\attack,Pbrown(1,2,0.1,inf),
	\a,Pexprand(1,100,inf),
	\b,Pexprand(1,100,inf),
	\c,Pexprand(1,100,inf),
	\d,Pexprand(1,100,inf),
	\e,Pexprand(1,100,inf),
	\f,Pexprand(1,100,inf),
	\g,Pexprand(1,100,inf),
	\k,Pexprand(1,100,inf),
	\l,Pexprand(1,100,inf),
	\m,Pexprand(1,100,inf),
	\n,Pexprand(1,100,inf),
	\o,Pexprand(1,100,inf),
	\detune,Pexprand(1,4,inf);
)).play(quant:1));

( Pdef(\8, Pbind(\instrument, \id8,
		\dur,Pexprand(1,12,inf),
						\attack,Pbrown(1,2,0.1,inf),
	\a,Pexprand(1,100,inf),
	\b,Pexprand(1,100,inf),
	\c,Pexprand(1,100,inf),
	\d,Pexprand(1,100,inf),
	\e,Pexprand(1,100,inf),
	\f,Pexprand(1,100,inf),
	\g,Pexprand(1,100,inf),
	\k,Pexprand(1,100,inf),
	\l,Pexprand(1,100,inf),
	\m,Pexprand(1,100,inf),
	\n,Pexprand(1,100,inf),
	\o,Pexprand(1,100,inf),
	\detune,Pexprand(1,4,inf);
)).play(quant:1));

( Pdef(\9, Pbind(\instrument, \id9,
		\dur,Pexprand(1,12,inf),
				\attack,Pbrown(1,2,0.1,inf),
	\a,Pexprand(1,100,inf),
	\b,Pexprand(1,100,inf),
	\c,Pexprand(1,100,inf),
	\d,Pexprand(1,100,inf),
	\e,Pexprand(1,100,inf),
	\f,Pexprand(1,100,inf),
	\g,Pexprand(1,100,inf),
	\k,Pexprand(1,100,inf),
	\l,Pexprand(1,100,inf),
	\m,Pexprand(1,100,inf),
	\n,Pexprand(1,100,inf),
	\o,Pexprand(1,100,inf),
	\detune,Pexprand(1,4,inf);
)).play(quant:1));

( Pdef(\10, Pbind(\instrument, \id10,
		\dur,Pexprand(1,12,inf),
						\attack,Pbrown(1,2,0.1,inf),
		\a,Pexprand(1,100,inf),
	\b,Pexprand(1,100,inf),
	\c,Pexprand(1,100,inf),
	\d,Pexprand(1,100,inf),
	\e,Pexprand(1,100,inf),
	\f,Pexprand(1,100,inf),
	\g,Pexprand(1,100,inf),
	\k,Pexprand(1,100,inf),
	\l,Pexprand(1,100,inf),
	\m,Pexprand(1,100,inf),
	\n,Pexprand(1,100,inf),
	\o,Pexprand(1,100,inf),
	\detune,Pexprand(1,4,inf);
)).play(quant:1));

)