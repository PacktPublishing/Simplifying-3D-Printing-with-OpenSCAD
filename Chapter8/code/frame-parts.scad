use <threads.scad>
$fn=200;

module create_connector_plate_shape()
{
    circle_radius=14.5;
    move_x = 20;
    width = 40;
    height = 20;
    
    intersection()
    {
        circle(circle_radius);
        translate([move_x,0])
        square([width, height], center=true);        
    }
    mirror([1,0,0])intersection()
    {
        circle(circle_radius);
        translate([move_x,0])
        square([width, height], center=true);
    }
}

module create_screw_hole()
{ 
    translate([0,0,-250])cylinder(d=2.5, h=500);
}

module create_connector_plate()
{   
    difference()
    {
        linear_extrude(4)
        create_connector_plate_shape();
        
        translate([11,0,0])
        create_screw_hole();
        
        translate([-11,0,0])
        create_screw_hole();
    } 
}

module create_rod(height)
{
    translate([0,0,-10])
    difference()
    {
        MetricBolt(10, 10, tolerance=0.4);
        cylinder(h=10, d=100);
    }
    
    translate([0,0,-height/2])
    cylinder(h=height, d=15, center=true);   
  
    translate([0,0,-height])
    create_connector_plate();  
}

create_rod(150);

