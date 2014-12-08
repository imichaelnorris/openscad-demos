use <TextGenerator.scad>

D6_SIDE = 16;
delta = .8;

//D6
difference() {
  cube([D6_SIDE, D6_SIDE, D6_SIDE], center=true);

    union() {
        translate([D6_SIDE/2-delta, 0, 0]) {
            rotate([90,0,90]) {drawtext("1",center=true); }
        }
        translate([-D6_SIDE/2+delta, 0, 0]) {rotate([90,180,270]) {drawtext("6",center=true); }}
        translate([0,-D6_SIDE/2+delta, 0]) {rotate([270,-90,180]) {drawtext("4",center=true); }}
        translate([0,+D6_SIDE/2-delta, 0]) {rotate([90,90,180]) {drawtext("3",center=true); }}
        translate([0,0,+D6_SIDE/2-delta]) {rotate([0,0,90]) {drawtext("2",center=true); }}
        translate([0,0,-D6_SIDE/2+delta]) {rotate([180,0,90]) {drawtext("5",center=true); }}
    }
}