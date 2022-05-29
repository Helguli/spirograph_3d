include <BOSL/constants.scad>
use <BOSL/involute_gears.scad>
include <constants.scad>

fokszam=80;
karikak=[0,3,6,9,12,15,18,21,25,29,33,38,43,48,54,0,7,15,25,38,54];

radius = root_radius(mm_per_tooth=tooth_size, number_of_teeth=fokszam);
beta_fok=360*30/fokszam;
magassag=sqrt(radius^2-(radius*sin(beta_fok/2))^2);


difference() {
    union() {
        translate([0,-magassag,0])rotate([0,0,beta_fok/2-360/fokszam/2])gear(mm_per_tooth=tooth_size, number_of_teeth=fokszam, hole_diameter=0, thickness=gear_thickness,teeth_to_hide=fokszam-30);
        translate([0,magassag,0])rotate([0,0,180+beta_fok/2-360/fokszam/2])gear(mm_per_tooth=tooth_size, number_of_teeth=fokszam, hole_diameter=0, thickness=gear_thickness,teeth_to_hide=fokszam-30);
    }
    color([1,0,0])translate([-(radius-1.2031),-0.105,-2.5])cube([1,0.105*2,5]);
    color([1,0,0])translate([(radius-2.2031),-0.105,-2.5])cube([1,0.105*2,5]);
    for(i=[0:1:4])translate([-(radius-2.2031)+hole_distance+distance_scale+i*5*distance_scale,0,0])cylinder(h=gear_thickness+0.01,d1=hole_diameter,d2=hole_diameter2,center=true);
    for(j=[0:1:2])for(i=[5,9,12,15])translate([0,magassag,0])rotate([0,0,-(5+i)*360/fokszam+360/fokszam/2])translate([radius-hole_distance-distance_scale-distance_scale*5*j,0,0])cylinder(h=gear_thickness+0.01,d1=hole_diameter,d2=hole_diameter2,center=true);
}