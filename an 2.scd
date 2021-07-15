(
var w,v,hexa_points,radius;
var x_axis,y_axis,z_axis,circle;
var	r1,r2,r3,r4,r5,r6;
var  c_side_1,c_side_2,c_side_3,c_side_4,c_side_5,c_side_6;
var	p1_c,p2_c,p3_c,p4_c,p5_c,p6_c;
var  p1,p2,p3,p4,p5,p6;
var run = true, kapa, y, z,x=1,theta;
var ray=100;
var angle1=1,angle2=0;
var a=1;
var b=3;
///////0//////////////////////////////////////////////////////////////////////////////////////////////////
    Window.closeAll;
    w = Window("S",Rect(600,100,1000,1000),scroll:false).front.alwaysOnTop_(true);
    w.alpha = 1;  w.view.background = Color.black;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////waves_radius
v = UserView.new(w,Rect(100,100,800,800)).background_(Color.black);
v.drawFunc ={
	Pen.translate(400,400);
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////points
	//b=~az1;
	1000.do{
			x=x+1;
		y=((x**b)+a)/(x**(1/b));
		~k = Complex(x,y).angle;
			Pen.width=0.3;
		angle1=angle1+(~k**~az1);
		Color(red:1,green:1,blue:1,alpha:1).set;
		~p1=Polar.new(~az,pi/2).asPoint;
		Pen.line(~p1,Polar.new(~az/3,angle1).asPoint);Pen.stroke;v.refresh;
		Pen.rotate(pi/~az1);Pen.stroke;v.refresh;
			};

};
{ while { run } {v.background_(Color.black); v.refresh; (1/10).wait } }.fork(AppClock);
)

~pot1 = MIDIFunc.cc( { arg vel,nn,chan,src; [vel,nn,chan,src].postln;  ~az = vel.linlin(4,86,20,2000).round}, 71, 0);
~pot4 = MIDIFunc.cc( { arg vel,nn,chan,src; [vel,nn,chan,src].postln;  ~az1 = vel.linlin(14,125,1,100).round}, 73, 0);

MIDIClient.init;
MIDIIn.connectAll;
