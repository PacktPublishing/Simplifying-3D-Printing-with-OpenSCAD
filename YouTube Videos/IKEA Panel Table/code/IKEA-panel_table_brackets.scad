$fn=500;

inside_diameter=44;
outside_diameter=49;
panel_thickness=17;
screw_length=15;
chamfer=10;
post_height=50;
countersink=screw_length-(panel_thickness/2);

module create_chamfer(factor=1)
{
    cylinder(d1=inside_diameter, d2=inside_diameter-chamfer*factor, h=chamfer*factor);
}

module generate_screw_holes(num_screws, distance)
{
    for(i=[0:num_screws-1])
    {
        rotate([0,0,-i*360/num_screws])
        union()
        {
            translate([0,distance,0])
            cylinder(d=4, h=200, center=true);
        
            translate([0,distance,countersink])
            cylinder(d=15, h=200);        
        }
    } 
}

module create_end_cap(scale_factor)
{
    translate([0,0,post_height*scale_factor])
    create_chamfer(scale_factor);
    
    cylinder(h=post_height*scale_factor, d=inside_diameter);
    
    cylinder(h=post_height*(scale_factor*0.4), d=outside_diameter);
}

module create_leg_bracket(num_screws, base_diameter)
{
    translate([0,0,post_height])
    create_chamfer();
    
    cylinder(h=post_height, d=inside_diameter);
    
    difference()
    {
        cylinder(h=countersink+5, d=base_diameter);
        generate_screw_holes(num_screws, base_diameter*0.4);
    }
}

create_leg_bracket(4,100);
//create_end_cap(0.5);




