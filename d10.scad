//8-sided
use <TextGenerator.scad>
use <LiberationSerif-Regular.ttf>

a = 10;
b=9;

w = .7*sqrt(2) *a;
angle = 360.0/5;
//10-sided has a brim.
height = .5;
points=[ [a*sin(0),a*cos(0),height],
         [a*sin(-1*angle),a*cos(-1*angle),height],
         [a*sin(-2*angle), a*cos(-2*angle),height],
         [a*sin(-3*angle), a*cos(-3*angle),height],
         [a*sin(-4*angle), a*cos(-4*angle),height],
         [0,0,w], [0,0,-w]];

   //"brim"
   /*[b*sin(0-angle/2),b*cos(0-angle/2),0],[b*sin(-1*angle-angle/2),b*cos(-1*angle-angle/2),0],[b*sin(-2*angle-angle/2), b*cos(-2*angle-angle/2),0],[b*sin(-3*angle-angle/2), b*cos(-3*angle-angle/2),0],[b*sin(-4*angle-angle/2), b*cos(-4*angle-angle/2),0],*/

faces=[ [0,1,5],[1,2,5],[2,3,5],[3,4,5], [4,0,5]];
        //[5,1,0], [6,2,1], [7,3,2], [8,4,3],  [9,0,4],
        /*[5,11,6]*///];

//this is far our letters pull into the surface.
delta = .03;

//convert to spherical coordinates
//surface normal angle
n1 = cross(points[1], points[4]) / norm(cross(points[1], points[4]));
p1 = norm(n1);
theta1 = acos(n1[2] /p1);
phi1 = atan(n1[1] / n1[0]);

text = ["1", "2", "3", "4", "8", "7", "6", "5"];

//difference() {
//    union() {
        translate([0,0,-.5]) {polyhedron(points=points, faces=faces);}
        translate([0,0,.5]) {mirror([0, 0, 1]) {rotate([0,0,360/10]) {polyhedron(points=points, faces=faces);}}}
//    }*/

/*union() {
for (i = [0:7]) {
   if (i > 3) {
      mirror([0, 0, 1]) {
      translate((1.0/3 - delta)*(points[faces[i-4][0]] +
          points[faces[i-4][1]] +
          points[faces[i-4][2]])) {
         rotate([phi1+10, 0, 90 - i*90]) {
            drawtext(text[i], center=true);  
         }
      }
      }
   } else { 
      translate((1.0/3 - delta)*(points[faces[i][0]] +
          points[faces[i][1]] +
          points[faces[i][2]])) {
         rotate([phi1+10, 0, 90 - i*90]) {
            drawtext(text[i], center=true);  
         }
      }
   }
}
}
}*/