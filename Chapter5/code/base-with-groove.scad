$fn=200;
difference()
{
    scale([1,1,3])
    rotate_extrude(angle=360)
    difference()
    {
        translate([100,0])square(200, true);
        translate([200,0])circle(80);
    }
    translate([0,0,545])
    rotate([90,0,0])
    linear_extrude(10)
    import("ThumbsUp.svg", center=true); 
}
