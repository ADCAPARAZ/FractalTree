private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .470528199810202015;
PImage bg;

public void setup() 
{   
	size(640,480);    
	noLoop();
	bg = loadImage("forest.jpg");
} 
public void draw() 
{   
	image(bg, 0, 0, 640, 480);
  
	stroke(0,255,0);   
	line(320,480,320,380);   
	//drawBranches(??,??,??,??);  //will add later 
	drawBranches(320,380,100,3*(Math.PI)/2);
}


public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double angle1 = angle + branchAngle;
	double angle2 = angle - branchAngle;
	branchLength = branchLength * fractionLength;
	int endX1 = (int)(branchLength*Math.cos(angle1) + x);
	int endY1 = (int)(branchLength*Math.sin(angle1) + y);
	int endX2 = (int)(branchLength*Math.cos(angle2) + x);
	int endY2 = (int)(branchLength*Math.sin(angle2) + y);
	line(x, y, endX1, endY1);
	line(x, y, endX2, endY2);

	if(branchLength > smallestBranch){
		stroke(255,0,0);
		drawBranches(endX1,endY1, branchLength, angle1);
		stroke(0,0,255);
		drawBranches(endX2,endY2, branchLength, angle2);


	}
} 
