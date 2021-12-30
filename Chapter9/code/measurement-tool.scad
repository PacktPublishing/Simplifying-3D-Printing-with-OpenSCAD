$fn=200;
d_tool=40.7;
d_tool_offset=3;
tool_height=60;

module create_measurement_tool()
{
    cylinder(h=tool_height, 
    d1=d_tool+d_tool_offset, 
    d2=d_tool-d_tool_offset); 
}

create_measurement_tool();


