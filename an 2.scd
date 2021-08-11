(
var w,v,hexa_points,radius;
var run = true;
var angle=1;
var a=1,r=0;
var partial=100;
///////0/////////////////////////////////////////////////////////////////////////////////////////////////
    Window.closeAll;
    w = Window("S",Rect( 600,100,2000,1000),scroll:false).front.alwaysOnTop_(true);
    w.alpha = 1;  w.view.background = Color.black;
	~slider1= Slider(w,Rect(500,900,850,10)).action_({ arg obj; ~x = obj.value.linlin(0,1,1,3600); v.refresh;});
~slider2= Slider(w,Rect(500,950,850,10)).action_({ arg obj; ~y = obj.value.linlin(0,1,1,3600); v.refresh;});
~x=~x.cos;~y=~y.sin;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////view
v = UserView.new(w,Rect(50,100,1800,800)).background_(Color.black);
v.drawFunc ={
	Pen.translate(900,400);
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////lines
	(partial).do{
		~p1=Polar.new(200,pi/2).asPoint;v.refresh;
				~k=Complex(~x,~y).abs;
               ~a=Complex(~x,~y).angle;
			~z=(((~k)+~a))/(~k);
		~angle=Complex(~z,~k).angle;
		~radius=Complex(~z,~k).abs;
			Pen.width=0.3;
		Color(red:1,green:1,blue:1,alpha:1).set;
		Pen.line(~p1,Polar.new(~radius,~angle.rand).asPoint);Pen.stroke;v.refresh;
		Pen.rotate(pi/(partial/2));Pen.stroke;v.refresh;
			};
////////////////////////////////////////////////////////////////////////////////
};
{ while { run } {v.background_(Color.black); v.refresh; (1/10).wait } }.fork(AppClock);
)

/////////////////////////////////////////////////////////////////////
///////////////////////////////////////////window gfile no animation

(
var radius,f;
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
var partial=32;
///////0/////////////////////////////////////////////////////////////////////////////////////////////////
    Window.closeAll;
   ~w = Window.new("S",Rect( 600,100,1000,500),scroll:false).front.alwaysOnTop_(true);
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////view
//v = UserView.new(w,Rect(100,100,1600,800)).background_(Color.black);
~w.drawHook ={
	Pen.translate(500,250);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////lines
	(partial*100).do{
		~p1=Polar.new(200,pi/2).asPoint;~w.refresh;
			x=x+1;
		y=(((x**b)+a)*90)/(x**(b));
		~k = Complex(x,y).angle;
		t=(((~k**b)-a))/(~k**b);
		~r = Complex(t,~k).abs;


			Pen.width=0.1;
		angle=angle+(~k**b);
		Color(red:1,green:1,blue:1,alpha:1).set;
		Pen.line(~p1,Polar.new(~r*100,angle).asPoint);Pen.stroke;~w.refresh;
		Pen.rotate(pi/(partial/2));Pen.stroke;~w.refresh;
			};
////////////////////////////////////////////////////////////////////////////////
};
~w.background_(Color.black); ~w.refresh;
)
(
    ~i = Image.fromWindow(~w);
~i.dump;
~i.write("~/Desktop/my_image.png".standardizePath);
~i.free;
)

