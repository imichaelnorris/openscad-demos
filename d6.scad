D6_SIDE = 16;
DOT_DIAMETER = 3;
//subtract away part of the sphere / PIP
DOT_INNESS = .25;
DOT_SPHERE_R = 25;

// it turns out the design I'm using has equal spacing between
// both borders and each "pip" for each face, but these are
// configurable
TWO_INSET = 4.0;
FIVE_INSET = 4.0;
SIX_INSET = 4.0;
FOUR_INSET = 4.0;
THREE_INSET = 4.0;

//D6
difference() {
  cube([D6_SIDE, D6_SIDE, D6_SIDE]);

  union() {
    //front, 1 dot  		
    translate([D6_SIDE / 2, 0 ,D6_SIDE / 2]) {
      sphere(d=DOT_DIAMETER, $fn=DOT_SPHERE_R);
    }
    //bottom, 2 dots
    union() {
      translate([0 + TWO_INSET, 0 + TWO_INSET, 0]) {
        sphere(d=DOT_DIAMETER, $fn=DOT_SPHERE_R);
      }
      translate([D6_SIDE - TWO_INSET, D6_SIDE - TWO_INSET, 0]) {
        sphere(d=DOT_DIAMETER, $fn=DOT_SPHERE_R);
      }
    }

    //top, 5 dots
    union() {
      //middle pip
      translate([D6_SIDE / 2, D6_SIDE / 2 , D6_SIDE]) {
        sphere(d=DOT_DIAMETER, $fn=DOT_SPHERE_R);
      }
      translate([0 + FIVE_INSET, 0 + FIVE_INSET, D6_SIDE]) {
        sphere(d=DOT_DIAMETER, $fn=DOT_SPHERE_R);
      }
      translate([0 + FIVE_INSET, D6_SIDE - FIVE_INSET, D6_SIDE]) {
        sphere(d=DOT_DIAMETER, $fn=DOT_SPHERE_R);
      }
      translate([D6_SIDE - FIVE_INSET, 0 + FIVE_INSET, D6_SIDE]) {
        sphere(d=DOT_DIAMETER, $fn=DOT_SPHERE_R);
      }
      translate([D6_SIDE - FIVE_INSET, D6_SIDE - FIVE_INSET, D6_SIDE]) {
        sphere(d=DOT_DIAMETER, $fn=DOT_SPHERE_R);
      }
    }
    
    //back, 6 pips
    union() {
      translate([D6_SIDE / 2, D6_SIDE, SIX_INSET]) {
        sphere(d=DOT_DIAMETER, $fn=DOT_SPHERE_R);
      }
      translate([D6_SIDE / 2, D6_SIDE, D6_SIDE - SIX_INSET]) {
        sphere(d=DOT_DIAMETER, $fn=DOT_SPHERE_R);
      }
      translate([0 + FIVE_INSET, D6_SIDE, 0 + SIX_INSET]) {
        sphere(d=DOT_DIAMETER, $fn=DOT_SPHERE_R);
      }
      translate([0 + FIVE_INSET, D6_SIDE, D6_SIDE - SIX_INSET]) {
        sphere(d=DOT_DIAMETER, $fn=DOT_SPHERE_R);
      }
      translate([D6_SIDE - FIVE_INSET, D6_SIDE, 0 + SIX_INSET]) {
        sphere(d=DOT_DIAMETER, $fn=DOT_SPHERE_R);
      }
      translate([D6_SIDE - FIVE_INSET, D6_SIDE, D6_SIDE - SIX_INSET]) {
        sphere(d=DOT_DIAMETER, $fn=DOT_SPHERE_R);
      }
    }

//left, 4 dots
    union() {
      translate([0, 0 + FIVE_INSET, 0 + FIVE_INSET]) {
        sphere(d=DOT_DIAMETER, $fn=DOT_SPHERE_R);
      }
      translate([0, 0 + FIVE_INSET, D6_SIDE - FIVE_INSET]) {
        sphere(d=DOT_DIAMETER, $fn=DOT_SPHERE_R);
      }
      translate([0, D6_SIDE - FIVE_INSET, 0 + FIVE_INSET]) {
        sphere(d=DOT_DIAMETER, $fn=DOT_SPHERE_R);
      }
      translate([0, D6_SIDE - FIVE_INSET, D6_SIDE - FIVE_INSET]) {
        sphere(d=DOT_DIAMETER, $fn=DOT_SPHERE_R);
      }
    }

    //three, right side
    union() {
      translate([D6_SIDE, D6_SIDE / 2, D6_SIDE / 2]) {
        sphere(d=DOT_DIAMETER, $fn=DOT_SPHERE_R);
      }
      translate([D6_SIDE, 0 + FIVE_INSET, 0 + FIVE_INSET]) {
        sphere(d=DOT_DIAMETER, $fn=DOT_SPHERE_R);
      }
      translate([D6_SIDE, 0 + FIVE_INSET, D6_SIDE - FIVE_INSET]) {
        //sphere(d=DOT_DIAMETER, $fn=DOT_SPHERE_R);
      }
      translate([D6_SIDE, D6_SIDE - FIVE_INSET, 0 + FIVE_INSET]) {
        //sphere(d=DOT_DIAMETER, $fn=DOT_SPHERE_R);
      }
      translate([D6_SIDE, D6_SIDE - FIVE_INSET, D6_SIDE - FIVE_INSET]) {
        sphere(d=DOT_DIAMETER, $fn=DOT_SPHERE_R);
      }
    }

  }
}