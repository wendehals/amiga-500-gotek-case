$fa = 1;
$fs = 0.4;

width = 113.2;
depth = 27;

wall_thickness = 3;

module Top_middle(width, logo_right=true) {
    difference() {
        union() {
            difference() {
                union() {
                    // top
                    translate([wall_thickness + 2, -2, 33])
                    cube([width - 2*wall_thickness - 4, depth + 4, wall_thickness]);

                    // left side
                    translate([0, depth, 36])
                    rotate([90, 0 , 90])
                    linear_extrude(wall_thickness)
                    polygon(points=[[0, 0], [-27.5, 0], [-30, -11], [-25.5, -27], [4.5, -35], [7, -26]]);

                    // right side, inside strengthening
                    translate([wall_thickness, depth, 36])
                    rotate([90, 0 , 90])
                    linear_extrude(2)
                    polygon(points=[[0, 0], [-27.5, 0], [-30, -11], [-27.75, -19], [6.5, -28.4], [7, -26]]);

                    // right side
                    translate([width - wall_thickness, depth, 36])
                    rotate([90, 0, 90])
                    linear_extrude(wall_thickness)
                    polygon(points=[[0, 0], [-27.5, 0], [-30, -11], [-25.5, -27], [4.5, -35], [7, -26]]);

                    // right side, inside strengthening
                    translate([width - wall_thickness - 2, depth, 36])
                    rotate([90, 0 , 90])
                    linear_extrude(2)
                    polygon(points=[[0, 0], [-27.5, 0], [-30, -11], [-27.75, -19], [6.5, -28.4], [7, -26]]);
                }

                // left top edge
                translate([-1, -2, 31])
                cube([6, depth + 4, 6]);

                // top right edge
                translate([width - wall_thickness - 2, -2, 31])
                cube([6, depth + 4, 6]);

                // logo recess
                if (logo_right) {
                    translate([width - 19 - 67, 6.5, 35.5])
                    cube([67, 14, 1]);
                } else {
                    translate([19, 6.5, 35.5])
                    cube([67, 14, 1]);
                }
            }

            // Commodore logo
            if (logo_right) {
                translate([width - 73, 16.5, 34])
                import("Commodore_logo_v7.stl");
            } else {
                translate([32, 16.5, 34])
                import("Commodore_logo_v7.stl");
            }

            Rounded_edge(5, 0);
            Rounded_edge(width - 5, 90);
        }

        // back slope
        translate([0, depth + 1.5, 30])
        rotate([15, 0, 0])
        cube([width + 2, 4, 7]);

        // front slope
        translate([0, -5.8, 31])
        rotate([-14, 0, 0])
        cube([width + 2, 4, 7]);
    }

    Back_screw_hole(12.5);
    Back_screw_hole(width - 12.5);

    Middle_screw_hole(0);
    mirror([1, 0, 0])
    Middle_screw_hole(- width);

    Front_screw_hole(12.5);
    Front_screw_hole(width - 12.5);
}

module Rounded_edge(x, rotation_y) {
    translate([x, depth, 31])
    rotate([90, rotation_y, 0])
    difference() {
        translate([0, 0, -2])
        cylinder(h = depth + 4, r = 5);

        translate([0, -6, -3])
        cube([7, 12, 33]);

        translate([-6, -6, -3])
        cube([7, 6, 33]);
    }
}

module Back_screw_hole(x) {
    rotate([-15, 0, 0])
    difference() {
        union() {
            translate([x, 23.5, 27])
            cylinder(h = 5, d = 8);

            translate([x- 4, 12.5, 32])
            cube([8, 5, 7]);

            translate([x - 4, 12.5, 27])
            cube([8, 11, 5]);
        }

        translate([x, 23.5, 26])
        cylinder(h = 7, d = 2);
    }    
}

module Middle_screw_hole(x) {
    rotate([-15, 0, 0])
    difference() {
        union() {
            translate([x + wall_thickness, 10, 9.1])
            cube([4, 8, 5]);

            translate([x + wall_thickness + 4, 14, 9.1])
            cylinder(h = 5, d = 8);
        }

        translate([x + wall_thickness + 4, 14, 8])
        cylinder(h = 6, d = 2);
    }
}    

module Front_screw_hole(x) {
    translate([x, 4, 23])
    cylinder(h = 10, d = 8);

    difference() {
        union() {
            translate([x - 4, -6, 23])
            cube([8, 10, 5]);

            translate([x, -6, 23])
            cylinder(h = 5, d = 8);
        }

        translate([x, -6, 22.5])
        cylinder(h = 6, d = 2);
    }
}


Top_middle(width);