$fa = 1;
$fs = 0.4;

width = 151.5;

use<top-back.scad>
use<top-middle.scad>

translate([width, 0, 0])
mirror([1,0,0])
Top_back(width);

translate([0, -17.5, -9.1])
rotate([15, 0, 0])
Top_middle(width);