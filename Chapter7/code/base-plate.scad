$fn=200;
module create_first_shape()
{
    intersection()
    {
        translate([20,0])circle(d=85);
        translate([30,0])square([60, 70], center=true);
    }   
}

module create_broach_indent(width, height)
{
    translate([0,0,-1])
    color("#dc143c")
    linear_extrude(2)
    square([width, height], center=true);
}

module create_base_plate(
    thickness, 
    scale_factor=1)
{
    difference()
    {
        linear_extrude(thickness)
        scale([scale_factor, 
               scale_factor,
               scale_factor])
        union()
        {
            create_first_shape();
            mirror([1,0,0])create_first_shape();
            circle(d=90);
        }
        create_broach_indent(32, 7);
    }
}

create_base_plate(2.5, 0.7);





