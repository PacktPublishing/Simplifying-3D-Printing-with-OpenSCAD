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

module create_packt_name_tag_text(
    name,
    name_size=20,
    scale_factor=1)
{
    scale([scale_factor,
           scale_factor,
           scale_factor])
    union()
    {
        rotate_text("PACKT", 12, 30, 75, 30);
        rotate_text("PUB", 12, -40, -75, -23);
        text(name, size=name_size, 
             font="Impact:style=Regular",
             halign="center",
             valign="center");
    }
}

create_packt_name_tag_text("Bob Writer", scale_factor=0.7);





