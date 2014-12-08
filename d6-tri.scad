//tetrahedron

//cube([sqrt(1 - pow(a,2)/3.0), sqrt(5), sqrt(5)]);
use <TextGenerator.scad>
use <LiberationSerif-Regular.ttf>

a = 19;
font_scale = .8;

//a=12;
//font_scale = .6;

fs = font_scale;

one = "1";
two = "2";
three = "3";
four = "4";
font = "Liberation Sans";

w = sqrt(-0.0833333333333333*pow(a,2) + pow(sqrt(3)*a/6 + 0.577350269189626*a,2));

//sqrt(a - pow(a,2)/3.0

points = [[0, a/sqrt(3), 0], [-a/2, -a/(2*sqrt(3)), 0], [a/2, -a/(2*sqrt(3)), 0], [0, 0, w]];
faces = [[0,3,1], [0, 1, 2], [2, 1, 3], [0, 2, 3]];
edges = [[0, 1], [0, 2], [0, 3], [1, 2], [1, 3], [2, 3]];

//negated Z values
pointsR = [[0, a/sqrt(3), 0], [-a/2, -a/(2*sqrt(3)), 0], [a/2, -a/(2*sqrt(3)), 0], [0, 0, -w]];

//convert to spherical coordinates
n1 = cross(points[0], points[3]) / norm(cross(points[0], points[3]));
p1 = norm(n1);
theta1 = acos(n1[2] /p1);
phi1 = atan(n1[1] / n1[0]);

n2 = cross(points[0], points[3]) / norm(cross(points[0], points[3]));
p2 = norm(n2);
theta2 = acos(n2[2] /p2);
phi2 = atan(n2[1] / n2[0]);

n3 = cross(points[1], points[3]) / norm(cross(points[1], points[3]));
p3 = norm(n3);
theta3 = acos(n3[2] /p3);
phi3 = atan(n3[1] / n3[0]);

//convert to spherical coordinates
n4 = cross(pointsR[0], pointsR[3]) / norm(cross(pointsR[0], pointsR[3]));
p4 = norm(n4);
theta4 = acos(n4[2] /p4);
phi4 = atan(n4[1] / n4[0]);

n5 = cross(pointsR[0], pointsR[3]) / norm(cross(pointsR[0], pointsR[3]));
p5 = norm(n5);
theta5 = acos(n5[2] /p5);
phi5 = atan(n5[1] / n5[0]);

n6 = cross(pointsR[1], pointsR[3]) / norm(cross(pointsR[1], pointsR[3]));
p6 = norm(n6);
theta6 = acos(n6[2] /p6);
phi6 = atan(n6[1] / n6[0]);



difference() {
  union() {
    polyhedron(points, faces=faces);
    mirror([0, 0, 180]) {
        polyhedron(points, faces=faces);
    }
  }
  union() {
  translate(.67*(.35 * points[2] + .65 * points[1] + .30 * points[3])) {
    scale([fs, fs, fs]) {rotate([theta3-20, theta3-90, phi3 + -60 + 1*360.0/3]) {drawtext("1");}}
  }
  mirror([0, 0, 180]) {
    translate(.67*(.35 * points[1] + .65 * points[2] + .30 * points[3])) {
    scale([fs, fs, fs]) {rotate([theta3-20, theta3-90, phi3 + -60 + 1*360.0/3]) {mirror([180, 0, 0]) {drawtext("6");}}}
  }  
  }
  translate(.67*(.35 * points[1] + .65 * points[0] + .30 * points[3])) {
    scale([fs, fs, fs]) {rotate([theta1-20+180, theta1-90+180, phi1 + -60 + 1*360.0/3]) {drawtext("3");}}
  }
  mirror([0, 0, 180]) {
     translate(.67*(.35 * points[0] + .65 * points[1] + .30 * points[3])) {
    scale([fs, fs, fs]) {rotate([theta1-20+180, theta1-90+180, phi1 + -60 + 1*360.0/3]) {mirror([180, 0, 0]) {drawtext("4");}}}
  } 
  }

  translate(.67*(.35 * points[3] + .65 * points[2] + .30 * points[0])) {
    scale([fs, fs, fs]) {rotate([theta2+-15+180, theta2-90+180, phi2 + 60 + 2*360.0/3]) {drawtext("5");}}
  }

  mirror([0, 0, 180]) {translate(.67*(.35 * points[2] + .65 * points[0] + .30 * points[3])) {
    scale([fs, fs, fs]) {rotate([theta2+-15+180, theta2-90+180, phi2 + 60 + 2*360.0/3]) {mirror([180, 0, 0]) {drawtext("2");}}}
  }
  }
}}
  
  /*mirror([0, 0, 180]) {translate(.67*(.35 * points[3] + .55 * points[2] + .50 * points[0])) {
    scale([.8, .8, .8]) {rotate([theta2+-15+180, theta2-90+180, phi2 + 60 + 2*360.0/3]) {mirror([180, 0, 0]) {drawtext("5");}}}
  }
  }*/
  
  
  
  
  
  

  /*translate(1.0*(.35 * pointsR[0] + .65 * pointsR[2] + .30 * pointsR[3])) {
    scale([.8, .8, .8]) {rotate([theta5-15+180, theta5-90+180, (phi5 + 60 + 2*360.0/3)]) {drawtext("2");}}*/