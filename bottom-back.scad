$fa = 1;
$fs = 0.4;

width = 113.2;

height = 34;
depth = 166;
wall_thickness = 3;

rim_width = 4.5;
back_rim_width = 12.5;

module Bottom_back() {
    // bottom
    translate([rim_width, 0, 0])
    cube([width - 2*rim_width, depth - back_rim_width, wall_thickness]);

    // back side
    translate([rim_width, depth - back_rim_width - wall_thickness, wall_thickness])
    cube([width - 2*rim_width, wall_thickness, 30]);

    // left side
    translate([rim_width, 0, 0])
    cube([wall_thickness, depth - back_rim_width, height - 16.5]);

    // right side
    translate([width - rim_width - wall_thickness, 0, 0])
    cube([wall_thickness, depth - back_rim_width, height - 16.5]);

    // left rim
    translate([0, 0, height - 16.5])
    cube([rim_width + wall_thickness, depth, wall_thickness]);

    translate([0, 0, height - 16.5])
    cube([wall_thickness, depth, 10]);
}

Bottom_back();