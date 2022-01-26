$fn=200;
d_actual=41.7;
motor_height=70;
motor_diameter=18.5;
thrust_ring=14;
ring_thickness=4;
screw_hole_distance=16;
mount_post_diameter=15;

module create_centering_ring(type=18)
{
    difference()
    {
        cylinder(h=ring_thickness, d=d_actual);
        if(type==18)
        {
            translate([0,0,ring_thickness/2])
            cylinder(h=500, d=motor_diameter);
            cylinder(h=500, d= thrust_ring, center=true);
        }
        else{
            translate([0,0,ring_thickness/2])
            cylinder(h=500, d=motor_diameter+6);
            cylinder(h=500, d= thrust_ring+6, center=true);
        }
    }
}

module create_mount_post(type=18)
{
    difference()
    {
        translate([screw_hole_distance, 0, 0])
        cylinder(d=mount_post_diameter, h=motor_height);
        
        if(type==18)
        {
            cylinder(d=motor_diameter, h=500, center=true);
        }
        else
        {
            cylinder(d=motor_diameter+6, h=500, center=true);
        }
        
        difference()
        {
            cylinder(d=100, h=500, center=true);
            cylinder(d=d_actual, h=500, center=true);   
        }
    }
}

module create_screw_holes(diameter)
{
    translate([screw_hole_distance,0,0])
    cylinder(d=diameter, h=500, center=true);
    
    translate([-screw_hole_distance,0,0])
    cylinder(d=diameter, h=500, center=true);
}

module create_main_bracket(type=18)
{
    difference()
    {
        union()
        {
            mirror([1,0,0])
            create_mount_post(type);
            create_mount_post(type);
        }
        create_screw_holes(2.5);
    }
    create_centering_ring(type);
}

module create_bottom_bracket(type=18)
{
    difference()
    {
        create_centering_ring(type);
        create_screw_holes(3);
        
        rotate([0,0,90])
        create_screw_holes(6);
    }
}

create_main_bracket(24);
//create_bottom_bracket(24);



