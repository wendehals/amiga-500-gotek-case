wall_thickness = 1.2;

switch_width = 4;
switch_depth = 5.5;
switch_height = 5;

difference() {
    union() {
        cube([switch_width + 6*wall_thickness, switch_depth + 4*wall_thickness + 10, wall_thickness]);

        translate([2*wall_thickness, wall_thickness + 5, wall_thickness])
        cube([4 + 2*wall_thickness, 5.5 + 2*wall_thickness, 5 + wall_thickness]);
    }

    translate([3*wall_thickness, 2*wall_thickness + 5, -0.5])
    cube([switch_width, switch_depth, switch_height + wall_thickness + 0.5]);
}


translate([-3*wall_thickness - 1.5, -1, wall_thickness + 0.25])
difference() {
    cube([20, 30, 3]);

    translate([switch_width + 2*wall_thickness + 0.5, switch_depth + wall_thickness, -0.5])
    cube([switch_width + 2*wall_thickness + 1, switch_height + 2*wall_thickness + 9, 4]);
}


difference() {
    translate([60, 0, 0])
    cube([20, 30, 3]);

    translate([60 + switch_width + 2*wall_thickness + 0.5, switch_depth + wall_thickness, -0.5])
    cube([switch_width + 2*wall_thickness + 1, switch_height + 2*wall_thickness + 9, 4]);
}

