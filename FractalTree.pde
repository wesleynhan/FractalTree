private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .7;  
public void setup() 
{ 
	size(640,480);
	//frameRate(2);    
	noLoop(); 
} 

public void mouseMoved()
{
	redraw();
}
public void draw() 
{   
	println( mouseX);
	//branchAngle*=mouseX/640;
	background(0);
	if(mouseX >= 480){
		stroke((640 - mouseX)/160+250,((640 - mouseX)*51/160+179),((640-mouseX)*16/160)+231);
	}
	else if (mouseX>320 && mouseX<480){
	 	stroke((mouseX-320)*50/160+150,((mouseX-320)*55/160)+200,((mouseX-320)*100/160)+200);
	}
	else{
		stroke(0,200,200-mouseX*200/640);
	}   
	line(320,480,320,440);   
	drawBranches(320,440,100,3*Math.PI/2);  //will add later 
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double angle1 = angle + (branchAngle*mouseX/1280) + .15/*(Math.random()*branchAngle)*/;
	double angle2 = angle - (branchAngle*mouseX/1280) - .15/*(Math.random()*branchAngle)*/;
	int endX1 = (int)(branchLength*Math.cos(angle1)+x);
	int endY1 = (int)(branchLength*Math.sin(angle1)+y);
	int endX2 = (int)(branchLength*Math.cos(angle2)+x);
	int endY2 = (int)(branchLength*Math.sin(angle2)+y);
	branchLength*=fractionLength;
	line(x, y, endX1, endY1);
	line(x, y, endX2, endY2);
	if(branchLength > smallestBranch)
	{
		drawBranches(endX1,endY1,branchLength,angle1);
		drawBranches(endX2,endY2,branchLength,angle2);
	}
} 

