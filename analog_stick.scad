$fn = 100;

ball_diameter = 16;
shaft_diameter = 3;
shaft_length = 8;
base_diameter = 10;
base_height = 2;
magnet_hole_diameter = 3;
magnet_spacing = 5;

module analog_stick() {
  // Base
  cylinder(d = base_diameter, h = base_height);
  
  // Magnet holes
  translate([magnet_spacing/2, 0, -1]) 
    cylinder(d = magnet_hole_diameter, h = base_height + 2);
  translate([-magnet_spacing/2, 0, -1]) 
    cylinder(d = magnet_hole_diameter, h = base_height + 2);
  
  // Shaft
  translate([0, 0, base_height])
    cylinder(d = shaft_diameter, h = shaft_length);
  
  // Ball
  translate([0, 0, base_height + shaft_length])
    sphere(d = ball_diameter);
}

analog_stick();