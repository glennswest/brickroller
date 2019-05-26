
/*  3 5/8 x 2 1/4 x 7 5/8 */

inch = 25.4;
brick_width=inch * 7.625; // 7 5/8
brick_height=inch * 2.25;  // 2 1/4
caulk_width= .375 * inch;  // 3/8
roller_width = 8 * brick_width + 8 * caulk_width;
roller_diameter = (brick_height * 8) + (caulk_width * 9);
$fn=256;

module outerbody()
{
    cylinder(r=roller_diameter/2,h=roller_width);
    caulk();
}

module caulk()
{
      for (i = [0:8]) {
         echo(360*i/9, sin(360*i/9)*80, cos(360*i/9)*80);
         translate([sin(360*i/6)*roller_diameter/2, cos(360*i/6)*roller_diameter/2, 0 ])  cylinder(h = roller_width, r=caulk_width/2);
         }    
    
}

module body ()
{
    difference(){
        outerbody();
        translate([0,0,-1]) cylinder(r=roller_diameter/2-10,h=roller_width+2);
        }
}


body();

