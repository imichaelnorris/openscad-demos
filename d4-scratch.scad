//tetrahedron

//length of a side
//trying to make this 16 mm tall
a = 19.5959179423;

one = "1";
two = "2";
three = "3";
four = "4";
font = "Liberation Sans";

//top point Z-value in relation to a
w = sqrt(-0.0833333333333333*pow(a,2) + pow(sqrt(3)*a/6 + 0.577350269189626*a,2));

points = [[0, a/sqrt(3), 0], [-a/2, -a/(2*sqrt(3)), 0], [a/2, -a/(2*sqrt(3)), 0], [0, 0, w]];
faces = [[0,3,1], [0, 1, 2], [2, 1, 3], [0, 2, 3]];
edges = [[0, 1], [0, 2], [0, 3], [1, 2], [1, 3], [2, 3]];

polyhedron(points, triangles=faces, edges=edges);
//translate([0, 0, 20]) {
//linear_extrude(height = 325) {
//      text(text = str(one), font = font, size = 45, halign = "center");
//     }
//}
translate([0, 0, -.25]) {
linear_extrude(height=.5) {text("hii",font=font);}}