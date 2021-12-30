$fn=200;
diameter_in=41.7;
diameter_out=42.5;
cone_height=65;
shoulder_height=20;
taper=1;

module create_shoulder()
{
    difference()
    {
        cylinder(h=shoulder_height,
        d1=diameter_in-taper, 
        d2=diameter_in);
       
        rotate([0,90,0])
        linear_extrude(height=10, center=true)
        difference()
        {
            circle(15);
            circle(5);
        }
    }
}

module create_cone()
{
    translate ([0,0,shoulder_height]) 
    resize([diameter_out, diameter_out, cone_height])
    difference() 
    {
        sphere(d=diameter_out);
        translate([0,0,-500])
        cube([1000,1000,1000],center=true);
    }          
}
create_shoulder();
create_cone();