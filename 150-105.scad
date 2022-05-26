include <BOSL/constants.scad>
use <BOSL/involute_gears.scad>
include <constants.scad>

fokszam1=150;
fokszam2=105;
karikak=[0,10,20,30,40,50,60,70,80,90];

radius = root_radius(mm_per_tooth=tooth_size, number_of_teeth=fokszam1);

difference() {
    intersection() {
        difference() {
            cylinder(h=gear_thickness,d=150,center=true);
            gear(mm_per_tooth=tooth_size, number_of_teeth=fokszam2, hole_diameter=0, thickness=gear_thickness+0.1, interior=true);
        }
        gear(mm_per_tooth=tooth_size, number_of_teeth=fokszam1, hole_diameter=0, thickness=gear_thickness+0.1);
    }
    for(i=[0:1:len(karikak)-1])rotate([0,0,90+360/fokszam1*karikak[i]])translate([radius-hole_distance-i,0,0,])cylinder(h=gear_thickness+1,d=hole_diameter,center=true);
    for(i=[65:90:350])rotate([0,0,i])translate([radius-small_hole_distance-3,0,0])cylinder(h=gear_thickness+1,d=small_hole_diameter,center=true);
}
