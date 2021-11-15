use <Round-Anything/roundAnythingExamples.scad>
$fn=200;

thickness=5;
front_circle = [62,-42,12];
back_circle = [-80,-30,20];

module create_screw_hole()
{ 
    cylinder(d=11, h=500);
    translate([0,0,-500])
    cylinder(d=16, h=500);
}

module create_frame()
{   
    difference()
    {
        linear_extrude(thickness)
        union()
        {
            shell2d(0, -12)
            {
                import("frame.svg",center=true);
            }
            
            translate([front_circle[0],front_circle[1]])
            circle(front_circle[2]);
            
            translate([back_circle[0],back_circle[1]])
            circle(back_circle[2]);
        }
        
        translate([front_circle[0],front_circle[1],thickness/2])
        create_screw_hole();
        
        translate([back_circle[0],back_circle[1],thickness/2])
        create_screw_hole();
    }
}

create_frame();