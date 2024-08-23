$fa = 1;
$fs = 0.4;

width = 113.2;
depth = 153;
height = 6.5;

wall_thickness = 3;

kickstart_label_1 = "1.3";
kickstart_label_2 = "3.1";

use<switch.scad>

module Top_front(width, add_gotek = false, kickstart = false, bootselector = false, osd = false) {
    difference() {
        union() {
            Top_plate(width, add_gotek, kickstart, bootselector, osd);

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

        translate([width - 10 - 0.5, -0.5, -6])
        cube([11, 11, 6]);

        translate([width - wall_thickness - 8, wall_thickness, -0.5])
        cube([8, 8, 2]);

        translate([width - wall_thickness - 8, wall_thickness + 2, 1])
        cube([6, 6, 2.5]);
    }

    // back screw holes
    Back_screw_hole(12.5);
    Back_screw_hole(width - 12.5);

    // front screw holes
    Front_screw_hole(12.5);
    Front_screw_hole(width - 12.5);
}

module Top_plate(width, add_gotek = false, kickstart = false, bootselector = false, osd = false) {
    difference() {
        union() {
            translate([wall_thickness + 2, wall_thickness + 2, height - wall_thickness])
            cube([width- 2*wall_thickness - 4, depth - wall_thickness - 2, wall_thickness]);

            if (kickstart) {
                translate([35, depth - 70, height - wall_thickness])
                Switch_screwholes();
            }

            if (bootselector) {
                translate([75, depth - 70, height - wall_thickness])
                Switch_screwholes();
            }
        }

        if (add_gotek) {
            translate([22, depth - 25, height - 0.5])
            linear_extrude(1)
            text("Gotek", size = 5, font = "Arial");

            // Gotek knob cutout
            translate([28, depth - 34, wall_thickness - 1])
            cylinder(h = wall_thickness + 2, d = 6);

            // Gotek LED cutout
            translate([45, depth - 30, wall_thickness - 1])
            cylinder(h = wall_thickness + 2, d = 3);

            // Gotek buttons cutouts
            translate([45, depth - 38, wall_thickness - 1])
            cylinder(h = wall_thickness + 2, d = 4);
            translate([53, depth - 38, wall_thickness - 1])
            cylinder(h = wall_thickness + 2, d = 4);

            // Gotek display cutout
            translate([width - 47, depth - 40, height - wall_thickness - 1])
            cube([24, 12, wall_thickness + 2]);
        }
        
        if (kickstart) {
            translate([22, depth - 55, height - 0.5])
            linear_extrude(1)
            text("Kickstart", size = 5, font = "Arial");

            translate([25, depth - 61, height - 0.5])
            linear_extrude(1)
            text(kickstart_label_1, size = 3, font = "Arial");

            translate([25, depth - 70, height - 0.5])
            linear_extrude(1)
            text(kickstart_label_2, size = 3, font = "Arial");

            translate([35, depth - 70, height - wall_thickness])
            Switch_hole(height - wall_thickness + 1);
        }

        if (bootselector) {
            translate([62, depth - 55, height - 0.5])
            linear_extrude(1)
            text("Boot Drive", size = 5, font = "Arial");

            translate([65, depth - 61, height - 0.5])
            linear_extrude(1)
            text("DF0", size = 3, font = "Arial");

            translate([65, depth - 70, height - 0.5])
            linear_extrude(1)
            text("DF1", size = 3, font = "Arial");

            translate([75, depth - 70, height - wall_thickness])
            Switch_hole(height - wall_thickness + 1);
        }

        if (osd) {
            translate([22, depth - 85, height - 0.5])
            linear_extrude(1)
            text("OSD", size = 5, font = "Arial");
        
            translate([28, depth - 91, height - wall_thickness - 0.5])
            cylinder(h = wall_thickness + 1, d = 6);
        }
    }
}

module Back_screw_hole(x) {
    difference() {
        translate([x, depth - 5.5, -0.8])
        cylinder(h = 5, d = 8);

        translate([x, depth - 5.5, -1.5])
        cylinder(h = 5.5, d = 2);
    }
}

module Front_screw_hole(x) {
    rotate([-15, 0, 0])
    difference() {
        translate([x, 10, 0])
        cylinder(h = 7.3, d = 8);

        translate([x, 10, -0.5])
        cylinder(h = 5.5, d = 2);
    }
}    

Top_front(width, true, true, true, true);