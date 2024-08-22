$fa = 1;
$fs = 0.4;

switch_width = 3.5;
switch_depth = 5;
switch_height = 4.5;

wall_thickness = 0.8;
delta = 0.2;

hat_width = switch_width + 2*wall_thickness + delta;
hat_depth = switch_depth + 2*wall_thickness + delta;
hat_height = switch_height + wall_thickness + delta;

rim_width = 8;
rim_depth = 12;
rim_height = wall_thickness;

mount_width = 15;
mount_depth = 40;
mount_height = 5;

hole_width = hat_width + delta;
hole_depth = 8 + 2*wall_thickness + 2*delta;


module Switch_hat() {
    difference() {
        union() {
            translate([-(rim_width - hat_width)/2, -(rim_depth - hat_depth)/2, 0])
            cube([rim_width, rim_depth, rim_height]);

            translate([0, 0, rim_height])
            cube([hat_width, hat_depth, hat_height]);
        }

        translate([(hat_width - switch_width)/2, (hat_depth - switch_depth)/2, -delta])
        cube([switch_width + delta, switch_depth + delta, switch_height + wall_thickness + 2*delta]);
    }
}

module Switch_mount() {
    translate([-(mount_width - hole_width)/2, -(mount_depth - hole_depth)/2, 0])
    difference() {
        union() {
            translate([0, mount_width/2, 0])
            cube([mount_width, mount_depth - mount_width, mount_height]);

            translate([mount_width/2, mount_width/2, 0])
            cylinder(h = mount_height, d = mount_width);

            translate([mount_width/2, mount_depth - mount_width/2, 0])
            cylinder(h = mount_height, d = mount_width);
        }

        translate([(mount_width - rim_width)/2, (mount_depth - rim_depth - 4)/2, mount_height - rim_height - delta])
        cube([rim_width + delta, rim_depth + 4, rim_height + 1]);

        translate([(mount_width - 7)/2, (mount_depth - 23)/2, mount_height - rim_height - 0.5])
        cube([7 + delta, 23 + delta, 4]);

        translate([(mount_width - 7)/2, (mount_depth - 15)/2, -0.5])
        cube([7 + delta, 15 + delta, mount_height + 1]);

        translate([mount_width/2, mount_width/2 - 3, -0.5])
        cylinder(h = mount_height + 1, d = 2);

        translate([mount_width/2, mount_depth - (mount_width/2 - 3), -0.5])
        cylinder(h = mount_height + 1, d = 2);
    }
}

module Switch_hole(height) {
    translate([0, 0, -delta])
    cube([hole_width, hole_depth, height + 2*delta]);
}



Switch_mount();

translate([mount_width + 5, 0, 0])
Switch_hat();
