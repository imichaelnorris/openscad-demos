
DIE = 16;
RADIUS = 16*4.5/2;
echo(RADIUS);

WIDTH = 7;
HEIGHT_OFFSET = 10;
HEIGHT = 100;
echo(RADIUS-WIDTH);
difference() {
  union() {
    cylinder(h=HEIGHT, r=RADIUS);
    for (i = [0 : 18 : 359]) {
      echo(i);
      translate([cos(i)*(RADIUS-3), sin(i)*(RADIUS-3), 0]) {
          cylinder(h=100, r=5);
      }
    }
  }
  translate([0, 0, HEIGHT_OFFSET]) {
    cylinder(h=HEIGHT-HEIGHT_OFFSET, r=RADIUS-WIDTH);
  }
}