module create_3D_from_svg(path)
{
    
    
    rotate([90,0,0])
    linear_extrude(10)
    import(path, center=true);
}



module create_base(shape=1)
{
    
    scale([1,1,3])
    rotate_extrude(angle=360)
    difference()
    {
        translate([100,0])square(200, true);
        translate([200,0])circle(80 * (1/shape));
    }
}

module create_plaque(display_text, scale_factor=1)
{
    size=len(display_text)*(8.3);
    scale([scale_factor,scale_factor,scale_factor])
    translate([-size/2,0,0])
    union()
    {
        linear_extrude(5)
        text(display_text, font="Courier New:style=Regular");
        translate([0,-9,0])
        cube([size,20,2]);
    }
}


$fn=200;
create_base(2);

translate([0,0,545])
create_3D_from_svg("ThumbsUp.svg");

translate([0,-10,310])rotate([90,0,0])create_plaque("Good Job!",4);