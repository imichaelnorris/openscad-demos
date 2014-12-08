//8-sided
use <TextGenerator.scad>
use <LiberationSerif-Regular.ttf>

a = 10;

w = sqrt(2) *a;
points=[ [a,a,0],[a,-a,0],[-a,-a,0],[-a,a,0],
           [0,0,w]  ];
faces=[ [0,1,4],[1,2,4],[2,3,4],[3,0,4],             
              [1,0,3],[2,1,3] ];

//this is far our letters pull into the surface.
delta = .03;

//convert to spherical coordinates
//surface normal angle
n1 = cross(points[1], points[4]) / norm(cross(points[1], points[4]));
p1 = norm(n1);
theta1 = acos(n1[2] /p1);
phi1 = atan(n1[1] / n1[0]);

text = ["1", "2", "3", "4", "8", "7", "6", "5"];

difference() {
    union() {
        polyhedron(points=points, faces=faces);
        mirror([0, 0, 1]) {polyhedron(points=points, faces=faces);}
    }

union() {
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
}