$fa = 1;
$fs = 0.4;

width = 113.2;
depth = 153;
height = 6.5;

wall_thickness = 3;

module Top_front(width) {
    difference() {
        union() {
            // top
            translate([wall_thickness + 2, wall_thickness + 2, height - wall_thickness])
            cube([width- 2*wall_thickness - 4, depth - wall_thickness - 2, wall_thickness]);

            // left side
            translate([0, wall_thickness + 2, 0])
            cube([wall_thickness, depth - wall_thickness - 2, height - wall_thickness - 2]);

            rotate([90, 0, 90])
            linear_extrude(wall_thickness)
            polygon(points = [[wall_thickness, 0], [depth ,0], [depth, -3.5]]);

            // left rounded edge
            translate([wall_thickness + 2, wall_thickness + 2, wall_thickness - 1.5])
            rotate([270, 0, 0])
            difference() {
                cylinder(h = depth - wall_thickness - 2, r = 5);
                
                translate([-6, 0, -1])
                cube([12, 6, depth + 2]);

                translate([0, -6, -1])
                cube([7, 7, depth + 2]);
            }

            // right side
            translate([width - wall_thickness, wall_thickness + 2, 0])
            cube([wall_thickness, depth - wall_thickness - 2, height - wall_thickness - 2]);

            // right rounded edge
            translate([width - wall_thickness - 2, wall_thickness + 2, wall_thickness - 1.5])
            rotate([270, 90, 0])
            difference() {
                cylinder(h = depth - wall_thickness - 2, r = 5);
                
                translate([-6, 0, -1])
                cube([12, 6, depth + 2]);

                translate([0, -6, -1])
                cube([7, 7, depth + 2]);
            }
        }

        translate([-1, depth - 2.9, -5])
        rotate([-14, 0, 0])
        cube([width + 2, wall_thickness, 14]);
    }

    // front left rounded corner
    difference() {
        union() {
            translate([5, 5, wall_thickness - 1.5])
            sphere(5);

            translate([wall_thickness + 2, wall_thickness + 2, 0])
            cylinder(h = wall_thickness - 1.5, r = 5);
        }

        translate([-0.5, -0.5, -6])
        cube([11, 11, 6]);

        translate([wall_thickness, wall_thickness, -0.5])
        cube([8, 8, 2]);

        translate([wall_thickness + 2, wall_thickness + 2, 1])
        cube([6, 6, 2.5]);
    }

    // front side
    translate([wall_thickness + 2, 0, 0])
    cube([width - 2*wall_thickness - 4, wall_thickness, height - wall_thickness - 2]);

    // front rounded edge
    translate([wall_thickness + 2, wall_thickness + 2, wall_thickness - 1.5])
    rotate([0, 90, 0])
    difference() {
        cylinder(h = width - 2*wall_thickness - 4, r = 5);
        
        translate([-6, 0, -1])
        cube([12, 6, depth + 2]);

        translate([0, -6, -1])
        cube([7, 7, depth + 2]);
    }

    // front right rounded corner
    difference() {
        union() {
            translate([width - 5, 5, wall_thickness - 1.5])
            sphere(5);

            translate([width - wall_thickness - 2, wall_thickness + 2, 0])
            cylinder(h = wall_thickness - 1.5, r = 5);
        }

        translate([width - 10.5, -0.5, -6])
        cube([11, 11, 6]);

        translate([width - wall_thickness - 8, wall_thickness, -0.5])
        cube([8, 8, 2]);

        translate([width - wall_thickness - 8, wall_thickness + 2, 1])
        cube([6, 6, 2.5]);
    }

    // left back screw hole
    difference() {
        translate([20, depth - 5, 0])
        cylinder(h = 4, d = 8);

        translate([20, depth - 5, -0.5])
        cylinder(h = 4.5, d = 2);
    }

    // right back screw hole
    difference() {
        translate([width - 20, depth - 5, 0])
        cylinder(h = 4, d = 8);

        translate([width - 20, depth - 5, -0.5])
        cylinder(h = 4.5, d = 2);
    }

    // left front screw hole
    difference() {
        translate([20, 10, 0])
        cylinder(h = 7.3, d = 8);

        translate([20, 10, -0.5])
        cylinder(h = 5.5, d = 2);
    }

    // right front screw hole
    rotate([-15, 0, 0])
    difference() {
        translate([width - 20, 10, 0])
        cylinder(h = 7.3, d = 8);

        translate([width - 20, 10, -0.5])
        cylinder(h = 5.5, d = 2);
    }

}

Top_front(width);