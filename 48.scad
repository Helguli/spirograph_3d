include <BOSL/constants.scad>
use <BOSL/involute_gears.scad>
include <constants.scad>

fokszam=48;
karikak=[0,3,6,9,12,15,18,22,26,30,35,40,46,6,15,30];

radius = root_radius(mm_per_tooth=tooth_size, number_of_teeth=fokszam);

difference() {
    gear(mm_per_tooth=tooth_size, number_of_teeth=fokszam, hole_diameter=0, thickness=gear_thickness);
    for(i=[0:1:len(karikak)-1])rotate([0,0,90+360/fokszam*karikak[i]])translate([radius-hole_distance-i*distance_scale,0,0,])cylinder(h=gear_thickness+0.01,d1=hole_diameter,d2=hole_diameter2,center=true);
    for(i=[60:90:360])rotate([0,0,i])translate([radius-small_hole_distance,0,0])cylinder(h=gear_thickness+1,d=small_hole_diameter,center=true);
}
