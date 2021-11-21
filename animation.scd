(
var w,v;
var run = true, kapa, y, z,x=0,theta;
var ray=300;
var angle=1,angle2=0;
var a=2;
///////0//////////////////////////////////////////////////////////////////////////////////////////////////
    Window.closeAll;
    w = Window("S",Rect(600,100,1000,1000),scroll:false).front.alwaysOnTop_(true);
    w.alpha = 1;  w.view.background = Color.black;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////waves_radius
v = UserView.new(w,Rect(100,100,800,800)).background_(Color.black);
v.drawFunc ={
	Pen.translate(400,400);
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////points
	~p1=Polar.new(150,pi).asPoint;
1000.do{
		Pen.width=0.1;
		Pen.line(~p1,Polar.new(ray,angle).asPoint);Pen.stroke;v.refresh;
			Color(red:1,green:1,blue:1,alpha:1).set;
		Pen.rotate(pi/64);Pen.stroke;v.refresh;
			x=x+1;
		y=(x+1)/x;
			angle=angle*y;
		//ray=ray*y

			};

};
{ while { run } {v.background_(Color.black); v.refresh; (1/10).wait } }.fork(AppClock);
)

///////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
(
var w,run = true, kapa, y, z,x=0,theta;
var ray=150;
var angle=1,angle2=0;
var a=2;
(
SynthDef.new(\id1, {

		arg dur=1,pr,pass=1,n=1,b=0,sp=10000,a=4,f=110,l=440;
	var sig;
	var env;
	var freq=1,audio=0,x=0,amp=1;

	//freq=n*6*f;
	    env=EnvGen.ar(Env.perc(a,4,1,[-4,-4]),doneAction:2);
		32.do{
		sig=PanAz.ar(2,BLowPass.ar(SinOsc.ar(f*2,mul:1/amp),l),LFSaw.ar(amp),width:2);
		//sig=BLowPass.ar(SinOsc.ar(f*2,mul:1/amp),l);
		audio = audio +sig;
		x=x+1;
		freq=(x+1)/x;
		f=f*freq;
		amp=amp*freq;
	};
		//+BBandPass.ar(PlayBuf.ar(1,b,BufRateScale.kr(0),startPos:sp),freq,pass,mul:(0.1/pass)),LFSaw.ar(2/6),width:2);
~a = Amplitude.ar(audio*env, 0.01, 0.25);
	SendReply.ar(Impulse.ar(100), '/a', ~a);
		Out.ar(0,audio*env);
}).add;
);

(
( Pdef(\1, Pbind(\instrument, \id1,
	\dur,Pbrown(1,6,2,inf),
	\l,Pbrown(220,2400,100,inf),
	\sp,Pbrown(1,20324015,10000,inf),
		\pr,Pexprand(1,1,inf),
	\a,Pbrown(0.01,2,0.1,inf),
	\f,Prand([60,60*(9/8),60*(9/8)*(9/8),80,90,90*(9/8),90*(9/8)*(9/8),120],inf),
	\pass,Pexprand(0.0005,5,inf),
	\n,Pbrown(1,4,1,inf);)).play(quant:1))
);
(OSCdef(\amp1, { |msg|
	~a = msg[3];
	defer { ~v.refresh };
}, '/a', s.addr));

(
///////0//////////////////////////////////////////////////////////////////////////////////////////////////
    Window.closeAll;
    w = Window("S",Rect(600,100,1000,1000),scroll:false).front.alwaysOnTop_(true);
    w.alpha = 1;  w.view.background = Color.black;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////waves_radius
~v = UserView.new(w,Rect(100,100,800,800)).background_(Color.black);
~v.drawFunc ={
	Pen.translate(400,400);
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////points
	~p1=Polar.new(150,pi).asPoint;
1000.do{
		Pen.width=0.1;
		Pen.line(~p1,Polar.new(ray,angle).asPoint);Pen.stroke;~v.refresh;
			Color(red:1,green:1,blue:1,alpha:1).set;
		Pen.rotate(pi/120);Pen.stroke;~v.refresh;
			x=x+1;
		y=(x+1)/x;
			angle=angle*y;
		//ray=ray*y

			};

};
{ while { run } {~v.background_(Color.black); ~v.refresh; (1/1000).wait } }.fork(AppClock);
)
)