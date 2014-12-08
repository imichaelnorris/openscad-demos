//tetrahedron

use <TextGenerator.scad>
use <LiberationSerif-Regular.ttf>

a = 18;

font = "Liberation Sans";

w = sqrt(-0.0833333333333333*pow(a,2) + pow(sqrt(3)*a/6 + 0.577350269189626*a,2));

//sqrt(a - pow(a,2)/3.0

points = [[0, a/sqrt(3), 0], [-a/2, -a/(2*sqrt(3)), 0], [a/2, -a/(2*sqrt(3)), 0], [0, 0, w]];
faces = [[0,3,1], [0, 1, 2], [2, 1, 3], [0, 2, 3]];
edges = [[0, 1], [0, 2], [0, 3], [1, 2], [1, 3], [2, 3]];
//convert to spherical coordinates
n2 = cross(points[2],points[1]) / norm(cross(points[2], points[1]));
echo(n2);
echo(n2[2]);
p2 = norm(n2);
theta2 = acos(n2[2], p2);

/*
 * MAJOR and MINOR
 * MAJOR is the scalar weight given to the vector
 * for each of the planes that is closest to the
 * point.
 * MINOR is the scalar weight given to the other
 * two vectors making up the plane.
 *
 * So if we have a plane with vectors v1, v2, v3,
 * we make the linear combination:
 * MAJOR * v1 + MINOR * v2 + MINOR*v3
 * 
 * if MAJOR + 2*MINOR = 1, the letters should appear
 * above each of the four sides of the tetrahedron,
 * which would mean that the technique that I'm using
 * to render the numbers (removing the intersection of the numbers and the solid) will not be successful.  Therefore I recommend that you set:
 * MAJOR + 2*MINOR < 1
 *
 * I realized that the number "1" needs its own Major that's slightly higher, so I added a Major just for "1"
*/
MAJOR = .55;
MAJOR1 = MAJOR + .09;
MINOR = .175;
FONT_SCALE = .65;
FONT_SIZE = FONT_SCALE * [1.0,1.0,1.0];

edge = cross(points[3], points[2]);
//echo(points[2][1]);
n3 = cross(points[2], points[3]) / norm(cross(points[2], points[3]));
p3 = norm(n3);
theta3 = acos(n3[2], p3);
phi = atan(n3[1] / n3[0]);
difference() {
  polyhedron(points, faces=faces);
  union() {
    //face with -y
    translate(MINOR*points[2] + MINOR*points[1] + MAJOR1*points[3]) {
      rotate([phi +10, 0, 0]) {
        scale(FONT_SIZE) {
            drawtext("1", center=true);
        }
      }
    }
    translate(MAJOR*points[2] + MINOR*points[1] + MINOR*points[3]) {
      rotate([phi +10, 0, 0]) { rotate([0, 0, 240]) {
        scale(FONT_SIZE) {
            drawtext("2", center=true);
        }
      }}
    }
    translate(MINOR*points[2] + MAJOR*points[1] + MINOR*points[3]) {
      rotate([phi +10, 0, 0]) { rotate([0,0,120]) {
        scale(FONT_SIZE) {
            drawtext("4", center=true);
        }
      }}
    }
    //face number 2
    rotate([0,0,120]) { //rotation before translation
    translate(MINOR*points[2] + MINOR*points[1] + MAJOR1*points[3]) {
      rotate([phi +10, 0, 0]) {
        scale(FONT_SIZE) {
            drawtext("1", center=true);
        }
      }
    }
    translate(MAJOR*points[2] + MINOR*points[1] + MINOR*points[3]) {
      rotate([phi +10, 0, 0]) { rotate([0, 0, 240]) {
        scale(FONT_SIZE) {
            drawtext("3", center=true);
        }
      }}
    }
    translate(MINOR*points[2] + MAJOR*points[1] + MINOR*points[3]) {
      rotate([phi +10, 0, 0]) { rotate([0,0,120]) {
        scale(FONT_SIZE) {
            drawtext("2", center=true);
        }
      }}
    }
    }//end rotation
    //face number 3
    rotate([0,0,240]) { //rotation before translation
    translate(MINOR*points[2] + MINOR*points[1] + MAJOR1*points[3]) {
      rotate([phi +10, 0, 0]) {
        scale(FONT_SIZE) {
            drawtext("1", center=true);
        }
      }
    }
    translate(MAJOR*points[2] + MINOR*points[1] + MINOR*points[3]) {
      rotate([phi +10, 0, 0]) { rotate([0, 0, 240]) {
        scale(FONT_SIZE) {
            drawtext("4", center=true);
        }
      }}
    }
    translate(MINOR*points[2] + MAJOR*points[1] + MINOR*points[3]) {
      rotate([phi +10, 0, 0]) { rotate([0,0,120]) {
        scale(FONT_SIZE) {
            drawtext("3", center=true);
        }
      }}
    }
    }//end rotation
    translate(MAJOR*points[0] + MINOR*points[1] + MINOR*points[2]) {
        rotate([180,0,180]) {
            scale(FONT_SIZE) {
                drawtext("3", center=true);
                //sphere(5);
            }
        }
    }
    translate(MINOR*points[0] + MAJOR*points[1] + MINOR*points[2]) {
        rotate([180,0,180]) { rotate([0,0,240]) {
            scale(FONT_SIZE) {
                drawtext("4", center=true);
                //sphere(5);
            }
        }}
    }
    translate(MINOR*points[0] + MINOR*points[1] + MAJOR*points[2]) {
        rotate([180,0,180]) { rotate([0,0,120]) {
            scale(FONT_SIZE) {
                drawtext("2", center=true);
                //sphere(5);
            }
        }}
    }
}
}