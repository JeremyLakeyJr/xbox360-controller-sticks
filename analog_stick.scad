$fn = 100;

ball_diameter = 16;
shaft_diameter = 3.5;
shaft_length = 15;

module analog_stick() {
  // Shaft
  cylinder(d = shaft_diameter, h = shaft_length);
  
  // Ball (sphere on top of shaft)
  translate([0, 0, shaft_length])
    sphere(d = ball_diameter);
}

analog_stick();