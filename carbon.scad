cube([20,3,4]);
//test on the bottom
translate([0,3,0]) {
	cube([3,12,4]);
}

//bottom bounding line
translate([-5, -5, 0]) {
   color("black") {
	cube([1, 100, 1]);
   }
}

//top bounding line
translate([-16, -5, 0]) {
	color("black") {
		cube([1, 100, 1]);
   }
}

//C
translate([-10, 0, 0]) {
   difference() {
   difference() {
		cylinder(h = 10, d1 = 10, d2 = 10, center = true);
      cylinder(h = 10, d1 = 5, d2 = 5, center = true);
	}
   translate([-5, 1, -5]) {
   cube([10, 10, 10]);
   }
   }
}

//A
translate([-15, 6, -5]) {
   rotate(-20) {
 	cube([10.25, 1.75, 10]);
   }
}

translate([-14.65, 6, -5]) {
	rotate(20) {
		cube([10.25, 1.75, 10]);
   }
}

//crossbar of A
translate([-9.4, 5, -5]) {
	cube([1.75, 3, 10]);
}

//end A

//R
translate([-15, 12, -5]) {
	cube([10, 1.75, 10]);
}