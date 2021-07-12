$fn=200;
difference()
{
    union() {
        difference()
        {
            difference()
            {
                difference()    {
                    cylinder(d1=90, d2=100, h=60);
                    translate([0, 0, -10])cylinder(d=42.5, h=100);
                }
                translate([-100,0,0])cube([200, 200, 200], center=true);
            }
            union() {
                translate([0,0,15])rotate([0,90,0])cylinder(d=3, h=100);
                translate([0,0,35])rotate([0,90,0])cylinder(d=3, h=100);
                translate([45,0,15])rotate([0,90,0])cylinder(d=10, h=50);
                translate([45,0,35])rotate([0,90,0])cylinder(d=10, h=50);
            }
        }
        translate([25,0,45])
        linear_extrude(15)
        intersection()
        {
            translate([20,0])circle(d=80);
            translate([30,0])square([60, 70], center=true);
        }
    }
    
    translate([60,50,70])rotate([90,0,0])cylinder(d=30, h=100);
}
