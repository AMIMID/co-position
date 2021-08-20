TempoClock.default.tempo_(120/60);
s.options.numOutputBusChannels=4;
TempoClock.default.tempo_(120/12);
);
ServerOptions.inDevices.postln;
s.record(numChannels:2);
s.options.sampleRate =48000

s.options.device_("USB Sound Device");
s.options.memSize = 65536;
s.options.memSize
s.options.numInputBusChannels=0;
s.record(numChannels:6) ;
s.options.memSize = 524288//2097152
(
/////////////////////



(
SynthDef.new(\id, {
	arg dur;
	var b=1,x=1,bus=1; var y=1,theta,phi; var k,z,pos; var sig,env,s;

	x=dur.cos; y=dur.sin;
	k=Complex(x,y).abs; theta=Complex(x,y).angle;
	z=(((k)+theta))/(k);
	s= Complex(k,z).abs; phi= Complex(z,k).angle;
	//env=EnvGen.ar(Env.perc(0.01,dur/dur,1/s,[-4,-4]),doneAction:2);
		//sig=PitchShift.ar(SoundIn.ar(0),0.2,pitchRatio:s.linlin(0,4,0,4),mul:1/s);
	sig=FSinOsc.ar(s*220,mul:1/s,iphase:phi*pi);
	Out.ar(2,sig*0.2);
	//Out.ar(0,PanAz.ar(2,LeakDC.ar(sig),SinOsc.ar(phi),width:2));
	//	Out.ar(8,PanAz.ar(4,LeakDC.ar(sig*env*3),theta.linlin(1,2,-1,1),width:2));
	//Out.ar(0,PanAz.ar(4,InFeedback.ar(8)*env,phi.linlin(0.3,0.5,-1,1),width:2));
//	Out.ar(4,PanAz.ar(4,InFeedback.ar(9)*env,phi.linlin(0.3,0.5,-1,1),width:2));

}).add;
)



(
(Synth.new(\id,[\dur,6]));
(Synth.new(\id,[\dur,8]));
(Synth.new(\id,[\dur,9]));
(Synth.new(\id,[\dur,12]));
(Synth.new(\id,[\dur,16]));
(Synth.new(\id,[\dur,18]));
(Synth.new(\id,[\dur,24]));
(Synth.new(\id,[\dur,32]));
(Synth.new(\id,[\dur,36]));

)
/////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////on pattern


(
SynthDef.new(\id, {
	arg dur,pow=0;
	var x=1,y=1,theta,phi; var k,z,pos; var sig,env,s;
	var sum=0;


	dur=dur*(2**pow);
	x=dur.cos; y=dur.sin;
	k=Complex(x,y).abs; theta=Complex(x,y).angle;
	z=(k+theta)/(k);
	s= Complex(k,z).abs;phi= Complex(k,z).angle;
	env=EnvGen.ar(Env.perc(0.01,30,1/s,[-4,-4]),doneAction:2);
  /////////sig=PitchShift.ar(SoundIn.ar(0),0.1,pitchRatio:s,mul:env);
	//sig=PitchShift.ar(InFeedback.ar(2),0.5,pitchRatio:s,mul:env);
	sig=FSinOsc.ar(phi*110*6,mul:env*1/6,iphase:theta*pi);
	//+ FSinOsc.ar(phi*110*8,mul:env*1/8,iphase:theta*pi)
	//+ FSinOsc.ar(phi*110*9,mul:env*1/9,iphase:theta*pi)
	//+ FSinOsc.ar(phi*110*12,mul:env*1/12,iphase:theta*pi) ;

	////////////////sig=BLowPass.ar(VarSaw.ar(s*440,width:s,mul:env),1200);
	Out.ar(0,sig*env);

}).add;
)


Tdef(\sa).play;
Tdef(\sa).stop;

(
Tdef(\sa,
      {
				 1.do({( Pdef(\1, Pbind(\instrument, \id,
			\dur,Pseq([6,8,9,12],inf),
		\pow,Pbrown(1,30,1,inf),
			//\pow,Pgauss(15,15,inf),
			//\pow,Pcauchy(15,5,inf),
			//\pow,Pwhite(1,30,inf);
			)).play(quant:1));  (0).yield});

		 1.do({( Pdef(\2, Pbind(\instrument, \id,
			\dur,Pseq([6,8,9,12],inf),
		\pow,Pbrown(1,30,1,inf),
			//\pow,Pgauss(15,15,inf),
			//\pow,Pcauchy(15,5,inf),
			//\pow,Pwhite(1,30,inf);
			)).play(quant:1));  (0).yield});

		 1.do({( Pdef(\3, Pbind(\instrument, \id,
			\dur,Pseq([6,8,9,12],inf),
		\pow,Pbrown(1,30,1,inf),
			//\pow,Pgauss(15,15,inf),
			//\pow,Pcauchy(15,5,inf),
			//\pow,Pwhite(1,30,inf);
			)).play(quant:1));  (0).yield})

			})
)





