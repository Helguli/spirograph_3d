include <BOSL/constants.scad>
use <BOSL/involute_gears.scad>
include <constants.scad>

fokszam1=144;
fokszam2=96;

karikak=[0,12,24,36,48,60,72,84,96,108,120];

radius = root_radius(mm_per_tooth=tooth_size, number_of_teeth=fokszam1);

difference() {
    intersection() {
        difference() {
            cylinder(h=gear_thickness,d=150,center=true);
            gear(mm_per_tooth=tooth_size, number_of_teeth=fokszam2, hole_diameter=0, thickness=gear_thickness+1, interior=true);
        }
        gear(mm_per_tooth=tooth_size, number_of_teeth=fokszam1, hole_diameter=0, thickness=gear_thickness+1);
    }
    for(i=[0:1:len(karikak)-1])rotate([0,0,90+360/fokszam1*karikak[i]])translate([radius-hole_distance-i*distance_scale,0,0,])cylinder(h=gear_thickness+0.01,d1=hole_diameter,d2=hole_diameter2,center=true);
    for(i=[45:90:350])rotate([0,0,i])translate([radius-small_hole_distance-3,0,0])cylinder(h=gear_thickness+1,d=small_hole_diameter,center=true);
}
