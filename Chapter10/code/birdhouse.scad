$fn=200;
screw_hole_distance = 88;

module generate_first_shape()
{
    hull()
    {
        translate([0,0,180/2])
        resize([180,180,180])
        minkowski()
        {
            cube([10,10,10], center=true);
            rotate([0,0,45])cube([25,25,55], center=true);
            cylinder(h=40, d1=30, d2=2, center=true);
        }
        translate([0,0,150])sphere(65);
    }
}
module create_post_mounts()
{

    translate([screw_hole_distance,0,0])
    cylinder(h=15,d=20);

    translate([-screw_hole_distance,0,0])
    cylinder(h=15,d=20);

}
module create_hook()
{
    translate([0,0,215])
    rotate([90,0,0])
    difference()
    {
        cylinder(h=30, d=40, center=true);
        cylinder(h=30, d=30, center=true);
    }
}

module create_screw_holes(diameter)
{
    translate([screw_hole_distance,0,0])
    cylinder(d=diameter, h=200, center=true);
    
    translate([-screw_hole_distance,0,0])
    cylinder(d=diameter, h=200, center=true);
}

module create_frame()
{
    difference()
    {
        union()
        {
            difference()
            {
                union()
                {
                    generate_first_shape();
                    create_hook();
                }
                //hollow out first shape
                translate([0,0,-2])
                scale([0.95,0.95,1])
                generate_first_shape();
                
                //create doorway
                rotate([90,0,0])
                scale([1,2,1])
                cylinder(h=1000, d=80,center=true);
            }
            create_post_mounts();
        }
        create_screw_holes(2.5);  
    }
}


module create_bottom_plate()
{
    difference()
    {
        difference()
        {
            cylinder(h=20, d=215, center=true);
            cylinder(h=10, d=210);
        }
        create_screw_holes(3);
    }
}


//uncomment out to create top frame
//create_frame();

//uncomment out to create bottom plate   
//create_bottom_plate();

















