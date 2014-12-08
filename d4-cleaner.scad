//tetrahedron

//cube([sqrt(1 - pow(a,2)/3.0), sqrt(5), sqrt(5)]);
use <TextGenerator.scad>
use <LiberationSerif-Regular.ttf>

a = 18;

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
//convert to spherical coordinates
n3 = cross(points[2], points[3]) / norm(cross(points[2], points[3]));
p3 = norm(n3);
theta3 = acos(n3[2] /p3);
phi = atan(n3[1] / n3[0]);
//difference() {
  polyhedron(points, faces=faces);
  union() {
//bottom point
// using n1
  translate(.65 * points[0] + .3 * points[2] + .20 * points[1]) {
  /*linear_extrude(height=1, convexity=10) {*/scale([.50, .50, .50]) {rotate([180, 0, 180]) {drawtext("1");}}//}
  }
  translate(.3 * points[0] + .20 * points[2] + .65 * points[1]) {
  /*linear_extrude(height=1, convexity=10) {*/   
      rotate([180, 0, 180 + 360.0/3]) { scale([.50, .50, .50]) {drawtext("4");}//}
  }}
  translate(.20 * points[0] + .65 * points[2] + .3 * points[1]) {
  /*linear_extrude(height=1, convexity=10) {*/scale([.50, .50, .50]) {rotate([180, 0, 180 + 2*360.0/3]) {drawtext("2");}}
  }
  //////////
//using n2
    translate(.65 * points[0] + .3 * points[3] + .20 * points[1]) {
  /*linear_extrude(height=1, convexity=10) {*/scale([.50, .50, .50]) {rotate([180, 0, 180]) {drawtext("1");}}//}
  }
  translate(.3 * points[0] + .20 * points[3] + .65 * points[1]) {
  /*linear_extrude(height=1, convexity=10) {*/
      rotate([180, 0, 180 + 360.0/3]) { scale([.50, .50, .50]) {drawtext("4");}//}
  }}
  translate(.20 * points[0] + .65 * points[3] + .3 * points[1]) {
  /*linear_extrude(height=1, convexity=10) {*/scale([.50, .50, .50]) {rotate([180, 0, 180 + 2*360.0/3]) {drawtext("0");}}
  }
  //////////
//using n3
    translate(.65 * points[0] + .3 * points[2] + .20 * points[3]) {
  /*linear_extrude(height=1, convexity=10) {*/scale([.50, .50, .50]) {rotate([phi3+180, phi3+180, theta3]) {drawtext("1");}}//}
  }
  translate(.3 * points[0] + .20 * points[2] + .65 * points[3]) {
  /*linear_extrude(height=1, convexity=10) {*/
      rotate([phi3, phi3, theta3 + 180 + 360.0/3]) { scale([.50, .50, .50]) {drawtext("0");}//}
  }}
  translate(.20 * points[0] + .65 * points[2] + .3 * points[3]) {
  /*linear_extrude(height=1, convexity=10) {*/scale([.50, .50, .50]) {rotate([phi3, phi3, theta3 + 2*360.0/3]) {drawtext("2");}}
  }
  ////////
    translate(.65 * points[2] + .3 * points[1] + .20 * points[3]) {
  /*linear_extrude(height=1, convexity=10) {*/scale([.50, .50, .50]) {rotate([180, 0, 180]) {drawtext("1");}}//}
  }
  translate(.3 * points[2] + .20 * points[1] + .65 * points[3]) {
  /*linear_extrude(height=1, convexity=10) {*/
      rotate([180, 0, 180 + 360.0/3]) { scale([.50, .50, .50]) {drawtext("4");}//}
  }}
  translate(.20 * points[2] + .65 * points[1] + .3 * points[3]) {
  /*linear_extrude(height=1, convexity=10) {*/scale([.50, .50, .50]) {rotate([180, 0, 180 + 2*360.0/3]) {drawtext("2");}}
  }
}