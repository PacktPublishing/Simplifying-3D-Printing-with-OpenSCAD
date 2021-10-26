module rotate_text(display_text, 
    text_size=10, 
    distance=20, 
    rotation_value=360, 
    tilt=0)
{
    rotate([0,0,tilt])
    for(i=[0:len(display_text)-1])
    {
        rotate([0,0,-i*rotation_value/len(display_text)])
        translate([0,distance,0])
        text(display_text[i], 
        font="Impact:style=Regular", 
        size=text_size,
        halign="center");
    } 
}

rotate_text("HelloOpenSCAD", text_size=15, distance=60);
