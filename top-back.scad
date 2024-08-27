$fa = 1;
$fs = 0.4;

width = 113.2;

height = 31;
depth = 150;
wall_thickness = 3;

rim_width = 4.5;

module Top_back(width) {
    difference() {
        union () {
            // left lower rim
            cube([wall_thickness, depth, 10]);

            translate([0, 0, 10 - wall_thickness])
            cube([rim_width + wall_thickness, depth, wall_thickness]);

            // back lower rim
            difference() {
                translate([0, depth - wall_thickness, 0])
                cube([width, wall_thickness, 10]);

                translate([10, depth - wall_thickness - 1, -1])
                cube([width - 20, wall_thickness + 2, 8]);
            }
            
            // right lower rim
            translate([width - wall_thickness, 0, 0])
            cube([wall_thickness, depth, 10]);

            translate([width - wall_thickness - rim_width, 0, 10 - wall_thickness])
            cube([rim_width + wall_thickness, depth, wall_thickness]);

            // left side
            translate([rim_width, 0, 10 - wall_thickness])
            cube([wall_thickness, 112, 20 + wall_thickness]);

            // top
            translate([rim_width, 0, height - wall_thickness])
            cube([width - 9, 112, wall_thickness]);

            Ventilation_grid(width);

            // right side
            translate([width - wall_thickness - rim_width, 0, 10 - wall_thickness])
            cube([wall_thickness, 112, 20 + wall_thickness]);

            // floppy drive bay, inner cover
            translate([width - rim_width - 2*wall_thickness, 12, 9])
            cube([wall_thickness + 2, 100, 22]);

            translate([width - rim_width - wall_thickness, 41, 2])
            cube([wall_thickness + 2, 45, 7]);

            // back ribs and screw holes
            difference() {
                union() {
                    Back_ribs(width);

//                    // left mounting cylinder
//                    difference() {
//                        translate([24.5, 142, height - 24])
//                        cylinder(h = 6.5, d = 8);
//
//                        translate([20.5, 142, height - 25])
//                        cube([10, 5, 8]);
//                    }
//
//                    // right mounting cylinder
//                    difference() {
//                        translate([width - 24.5, 142, height - 24])
//                        cylinder(h = 6.5, d = 8);
//
//                        translate([width - 28.5, 142, height - 25])
//                        cube([10, 5, 8]);
//                    }
                }

                // left screw hole
                translate([24.5, 144, height - 25])
                cylinder(h = wall_thickness + 2, d = 2);

                // right screw hole
                translate([width - 24.5, 144, height - 25])
                cylinder(h = wall_thickness + 2, d = 2);
            }
        }

        Vents(width);

        // back left corner
        translate([-1, depth - 5, -1])
        cube([6, 6, 12]);

        // back right corner
        translate([width - 5, depth - 5, -1])
        cube([6, 6, 12]);
        
        // floppy drive bay
        translate([width - rim_width - 3.5, 42, height + 1])
        rotate([90, 0, 90])
        linear_extrude(4)
        polygon(points = [[0, 0], [34, 0], [32.5, -21], [1.5, -21]]);

        translate([width - rim_width - wall_thickness - 1, 13, 10])
        cube([wall_thickness + 2, 94, 6]);

        translate([width - 6.5, 45, 3])
        cube([7, 26, 8]);
        
        // USB A opening
        translate([width - rim_width - 2*wall_thickness - 1, 52, 10])
        cube([wall_thickness + 2, 14, 6.5]);
        
        // front slope
        translate([-1, -0.1 , -0.5])
        rotate([90, 0, 90])
        linear_extrude(width + 2)
        polygon(points = [[0, height + 1], [13, 10], [13, 0], [0,0]]);
    }

    // back left rounded corner
    difference() {
        translate([5, depth - 5, 0])
        cylinder(h = 10, r = 5);
        
        translate([3, depth - 10, -1])
        cube([7, 7, 8]);
    }

    // back right rounded corner
    difference() {
        translate([width - 5, depth - 5, 0])
        cylinder(h = 10, r = 5);
        
        translate([width - 10, depth - 10, -1])
        cube([7, 7, 8]);
    }

    // front left screw hole
    difference() {
        translate([rim_width + wall_thickness + 5, 6, height - wall_thickness - 5])
        cylinder(h = 5, d = 8);

        translate([rim_width + wall_thickness + 5, 6, height - wall_thickness - 6])
        cylinder(h = 5, d = 2);
    }

    // front rigth screw hole
    difference() {
        translate([width - rim_width - wall_thickness - 5, 6, height - wall_thickness - 5])
        cylinder(h = 5, d = 8);

        translate([width - rim_width - wall_thickness - 5, 6, height - wall_thickness - 6])
        cylinder(h = 5, d = 2);
    }
}

module Ventilation_grid(width) {
    grid_width = width - 2*rim_width - 2*wall_thickness - 8;
    grid_depth = 49.98;
    
    // grid under ventilation
    translate([rim_width + wall_thickness, 46.88, height - wall_thickness - 3.5])
    cube([grid_width, 4, 3.5]);

    translate([rim_width + wall_thickness, 95.04, height - wall_thickness - 3.5])
    cube([grid_width, 4, 3.5]);

    translate([rim_width + wall_thickness + grid_width - 4, 48, height - wall_thickness - 3.5])
    cube([4, grid_depth, 3.5]);

    for(delta_y = [5.88:5.88:43])
        translate([rim_width + wall_thickness, 48 + delta_y, height - wall_thickness - 3.5])
        cube([grid_width, 2.94, 2.5]);

    for(delta_x = [29:29:grid_width - 3])
        translate([rim_width + wall_thickness + delta_x, 48, height - wall_thickness - 3.5])
        cube([3, grid_depth, 4.5]);
}

module Vents(width) {
    for(delta_y = [0:5.88:48])
        translate([rim_width - 1, 48 + delta_y - 0.01, height - 4.5])
        cube([width - wall_thickness - rim_width - 13 + 1, 2.95, 6]);
}

module Small_rib() {
    rotate([90, 0, 90])
    linear_extrude(3.2)
    polygon(points = [[0, 0], [2.6, -6], [27, -6], [31, -21], [38, -21], [38, -24], [28, -24], [24, -9], [0, -9]]);
};

module Big_rib() {
    rotate([90, 0, 90])
    linear_extrude(3.2)
    polygon(points = [[0, 0], [1.3, -3], [30, -3], [34, -21], [38, -21], [38, -24], [28, -24], [24, -9], [0, -9]]);
};

module Back_ribs(width) {
    for(delta_x = [0:6.4:width - 2*rim_width - 6.5])
        translate([rim_width + 2.5 + delta_x, 112, height])
        Small_rib();

    for(delta_x = [0:6.4:width - 2*rim_width - 13])
        translate([rim_width + 3.2 + 2.5 + delta_x, 112, height])
        Big_rib();

    translate([rim_width, 112, height])
    rotate([90, 0, 90])
    linear_extrude(2.5)
    polygon(points = [[0, 0], [9.1, -21], [0, -21]]);

    translate([width - rim_width - 2.5, 112, height])
    rotate([90, 0, 90])
    linear_extrude(2.5)
    polygon(points = [[0, 0], [9.1, -21], [0, -21]]);

    // left closure
    translate([rim_width + 2.5, 112, 10])
    cube([wall_thickness, 27, 15]);

    // right closure
    translate([width - rim_width - 2.5 - 3.2, 112, 10])
    cube([wall_thickness, 27, 15]);
}

Top_back(width);


