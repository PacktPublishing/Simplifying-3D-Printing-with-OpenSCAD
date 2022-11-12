$fn=200;

contour = "contour.svg";
diameter = 49;
screw_hole_height = 100;
screw_length = 65;
countersink = 30;

radius = diameter/2;
screw_hole_distance = radius + 40;



module generate_shape()
{
    difference()
    {
        union()
        {
            rotate_extrude(convexity = 10)
            translate([diameter/2, 0, 0])
            import(contour);
        }
        
          generate_screw_holes(100, radius + 40, 30); 
    }
}


module generate_screw_holes()
{
    translate([0,0,height])
    rotate([0,90,0])
    {
        translate([0,distance,0])
        cylinder(d=4, h=screw_length, center=true);
    
        translate([0,distance,countersink])
        cylinder(d=20, h=screw_length);
    
        translate([0,-distance,0])
        cylinder(d=4, h=screw_length, center=true);
    
        translate([0,-distance,countersink])
        cylinder(d=20, h=screw_length);
    }      
}

module create_front_half()
{
    difference()
    {   
        generate_shape();
        
        translate([-5000,0,0])
        cube([10000,10000,10000], center=true);
    }
}

module create_back_half()
{
    difference()
    {   
        generate_shape();
        
        translate([5000,0,0])
        cube([10000,10000,10000], center=true);
    }
}

translate([-30,0,0])create_back_half();
translate([30,0,0])create_front_half();
//generate_screw_holes(100, radius + 40, 30); 
//generate_shape();



