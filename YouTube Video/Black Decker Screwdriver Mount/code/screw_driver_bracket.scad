$fn=200;

thickness=5;
width=130;
height=35;
driver_ring_diameter=35;
extension_ring_diameter=20;
driver_hook_pos=[-20,-35];
ext_ring_pos=[32,-25];

module create_driver_hook(hook=true)
{
    if(hook)
    {
        difference()
        {
            cylinder(h=thickness, d=driver_ring_diameter+30,center=true);
            cylinder(h=thickness, d=driver_ring_diameter,center=true);
            
            translate([0,-504,0])
            cube([1000,1000,1000], center=true);
        }
    }
    else
        cylinder(h=thickness*2, d=driver_ring_diameter+30,center=true);
}

module create_ext_ring(ring=true)
{
    if(ring)
    {
        difference()
        {
            cylinder(h=thickness, d=extension_ring_diameter+28,center=true);
            cylinder(h=thickness, d=extension_ring_diameter,center=true);
        }
    }
    else
        cylinder(h=thickness*2, d=extension_ring_diameter+28,center=true);
}

module create_backing_plate()
{   
    linear_extrude(thickness)
    union()
    {
        square([width, height], center=true);
        translate([width/2,0])circle(d=height);
        translate([-width/2,0])circle(d=height);
    }
    difference()
    {
        translate([0,0,height/2])
        cube([width-35,thickness,height], center=true);
        
        rotate([-90,0,0])
        translate([driver_hook_pos[0], driver_hook_pos[1], 0])
        create_driver_hook(false);
        
        rotate([-90,0,0])
        translate([ext_ring_pos[0], ext_ring_pos[1], 0])
        create_ext_ring(false);
    }
}
module create_bracket()
{
    difference()
    {
        create_backing_plate();
        create_screw_holes(width/2);
    }
    rotate([-90,0,0])
    translate([driver_hook_pos[0], driver_hook_pos[1],0])
    create_driver_hook();
    
    rotate([-90,0,0])
    translate([ext_ring_pos[0], ext_ring_pos[1],0])
    create_ext_ring();
}

module create_screw_holes(screw_hole_distance)
{
    translate([screw_hole_distance,0,0])
    cylinder(d=2.5, h=200, center=true);
    
    translate([screw_hole_distance,0,100+thickness/2])
    cylinder(d=10, h=200, center=true);
    
    translate([-screw_hole_distance,0,0])
    cylinder(d=2.5, h=200, center=true);
    
    translate([-screw_hole_distance,0,100+thickness/2])
    cylinder(d=10, h=200, center=true);
}

create_bracket();



