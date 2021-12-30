$fn=200;
height=70;
diameter=43.5;
thickness=1.2;
guide_diameter=3;
fins=3;
fin_shape=[[0,0],[height,0],[100,35],[100,45],[35,35]];

module create_fin(angle=0){
    rotate([0,0,angle])
    translate([diameter/2, 0, height])
    rotate([90,90,0])
    linear_extrude(height=thickness, center=true)
    polygon(fin_shape);
}

module generate_fin_can()
{
    difference(){
        union()
        {
            cylinder(h=height, d=diameter+thickness);
            for ( i = [0 : fins-1] ){
                create_fin(i*(360/fins));
            }
            
            rotate([0,0,180/fins])
            translate ([diameter/2+guide_diameter/2+thickness/2,
                        0, 0]) 
            difference(){
                cylinder(h=height, d=guide_diameter+thickness);
                cylinder(h=height, d=guide_diameter);
            }	
        }
        cylinder(h=1000, d=diameter, center=true);

    }
}

generate_fin_can();



