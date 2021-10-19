use<base-plate.scad>
use<name-badge-text.scad>

color("blue")
create_base_plate(2.5, 0.7);

color("gold")
translate([0,0,2])
linear_extrude(2)
create_packt_name_tag_text("Bob Writer", scale_factor = 0.65);
