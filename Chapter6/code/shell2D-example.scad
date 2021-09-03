use <Round-Anything/roundAnythingExamples.scad>

shell2d(0, -5)
{
    intersection()
    {
        translate([20,0])circle(d=80);
        translate([30,0])square([60, 70], center=true);
    }
    gridpattern(iter=50);
}
