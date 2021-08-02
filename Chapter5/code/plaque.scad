display_text="Good Job!"; 
linear_extrude(5) 
text(display_text, font="Courier New:style=Regular"); 
echo(len(display_text)); 
cube([len(display_text)*8.3,9,2]);