(
var w,v,hexa_points,radius;
var x_axis,y_axis,z_axis,circle;
var	r1,r2,r3,r4,r5,r6;
var  c_side_1,c_side_2,c_side_3,c_side_4,c_side_5,c_side_6;
var	p1_c,p2_c,p3_c,p4_c,p5_c,p6_c;
var  p1,p2,p3,p4,p5,p6;
var run = true, kapa, y, z,x=1,theta;
var ray=200;
var angle=1,mag=1;
var a=1,t,s;
var b=(-2);
var partial=10;
///////0//////////////////////////////////////////////////////////////////////////////////////////////////
    Window.closeAll;
    w = Window("S",Rect( 600,100,2000,1000),scroll:false).front.alwaysOnTop_(true);
    w.alpha = 1;  w.view.background = Color.black;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////view
v = UserView.new(w,Rect(100,100,1600,800)).background_(Color.black);
v.drawFunc ={
	Pen.translate(800,400);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////lines
	(partial*1000).do{
		~p1=Polar.new(360,pi/2).asPoint;v.refresh;
			x=x+1;
		y=(((x**b)+a)*36)/(x**(b));
		~k = Complex(x,y).angle;
		t=(((~k**b)-a))/(~k**b);
		~r = Complex(t,~k).abs;


			Pen.width=0.1;
		angle=angle+(~k**b);
		Color(red:0,green:0,blue:0,alpha:1).set;
		Pen.line(~p1,Polar.new(~r,angle).asPoint);Pen.stroke;v.refresh;
		Pen.rotate(pi/(partial/2));Pen.stroke;v.refresh;
			};
////////////////////////////////////////////////////////////////////////////////
};
{ while { run } {v.background_(Color.white); v.refresh; (10/1).wait } }.fork(AppClock);
)

~pot1 = MIDIFunc.cc( { arg vel,nn,chan,src; [vel,nn,chan,src].postln;  ~az = vel.linlin(10,92,1,2000)}, 71, 0);
~pot4 = MIDIFunc.cc( { arg vel,nn,chan,src; [vel,nn,chan,src];  ~az1 = vel.linlin(6,78,0.01,1).postln}, 73, 0);

MIDIClient.init;
MIDIIn.connectAll;
