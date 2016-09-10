dot_thickness = 1.25;
oval_thickness = 2.5;
clip_thickness = 2.5;
spacer_thickness = 1.8;

dot_diameter = 5;
oval_width = 10;

clip_width = 10;
clip_depth = max( 12, clip_width );

$fs = .1;
$fa = 1;

rotate([0, -90, 0]) {
    translate([dot_diameter/2, 0, clip_thickness]) cylinder( r=dot_diameter/2, h=dot_thickness + oval_thickness + spacer_thickness );

    translate([dot_diameter/2, 0, clip_thickness + spacer_thickness]) {
        translate([0, (oval_width - dot_diameter ) / 2, 0]) cylinder( r=dot_diameter/2, h=oval_thickness );
        translate([0, -(oval_width - dot_diameter ) / 2, 0]) cylinder( r=dot_diameter/2, h=oval_thickness );
        translate([-dot_diameter/2, -(oval_width - dot_diameter)/2, 0]) cube([dot_diameter, oval_width - dot_diameter, oval_thickness]) ;
    }

    translate([0, -clip_width / 2, 0]) {
        cube([clip_depth - ( clip_width / 2 ), clip_width, clip_thickness]);
        translate([clip_depth - ( clip_width / 2 ), clip_width / 2, 0]) cylinder(r=clip_width/2, h=clip_thickness);
    }


    translate([0, -clip_width / 2, clip_thickness]) rotate([0, 90, 0 ]) {
        cube([clip_depth - ( clip_width / 2 ), clip_width, clip_thickness]);
        translate([clip_depth - ( clip_width / 2 ), clip_width / 2, 0]) cylinder(r=clip_width/2, h=clip_thickness);
    }

    translate([clip_thickness, -clip_thickness/2, 0]) rotate([-90, 0, 0]) linear_extrude(clip_thickness) polygon(points = [[0, 0], [clip_depth - clip_thickness - clip_thickness, 0], [0, clip_depth - clip_thickness - clip_thickness]]);
}