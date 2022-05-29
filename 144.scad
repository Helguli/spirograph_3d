include <BOSL/constants.scad>
use <BOSL/involute_gears.scad>
include <constants.scad>

fokszam=24;
fokszam2=60;
karikak=[0,3,7,13,20];

radius = root_radius(mm_per_tooth=tooth_size, number_of_teeth=fokszam);
base_radius = base_radius(mm_per_tooth=tooth_size, number_of_teeth=fokszam);
pitch_radius = pitch_radius(mm_per_tooth=tooth_size, number_of_teeth=fokszam);
outer_radius = outer_radius(mm_per_tooth=tooth_size, number_of_teeth=fokszam);

difference() {
    union() {
        rotate([0,0,172.5])gear(mm_per_tooth=tooth_size, number_of_teeth=fokszam, hole_diameter=0, thickness=gear_thickness, teeth_to_hide=12);
        translate([tooth_size/2,pitch_radius,0])rack(mm_per_tooth=tooth_size, number_of_teeth=fokszam2, thickness=gear_thickness, height=outer_radius);
        translate([fokszam2*tooth_size,0,0])rotate([0,0,-7.5])gear(mm_per_tooth=tooth_size, number_of_teeth=fokszam, hole_diameter=0, thickness=gear_thickness, teeth_to_hide=12);
        translate([fokszam2*tooth_size-tooth_size/2,-pitch_radius,0])rotate([0,0,180])rack(mm_per_tooth=tooth_size, number_of_teeth=fokszam2, thickness=gear_thickness, height=outer_radius);
    }
    for(i=[0:fokszam2*tooth_size/3:fokszam2*tooth_size])translate([i,0,0])cylinder(h=gear_thickness+1,d=small_hole_diameter,center=true);
}