// Xbox 360 Analog Stick - Accurate replacement model
// All dimensions in millimeters

// Bottom peg (inserts into potentiometer housing)
peg_diameter  = 4.5;
peg_height    = 7.0;

// Base / skirt (rests on controller faceplate)
base_diameter = 16.0;
base_height   = 3.0;

// Main shaft (slightly tapered for grip)
shaft_d_bot   = 11.0;
shaft_d_top   =  9.0;
shaft_height  = 10.0;

// Thumb cap
cap_diameter  = 13.5;
cap_height    =  5.0;
concave_depth =  1.5;   // depth of the concave bowl on the top face

// Sphere radius for concave top, derived from chord/sagitta formula:
//   r = c^2 / (8*h) + h/2   (c = cap_diameter, h = concave_depth)
concave_r = (cap_diameter * cap_diameter) / (8 * concave_depth) + concave_depth / 2;

module thumb_cap() {
  difference() {
    cylinder(d = cap_diameter, h = cap_height);
    // Subtract a large sphere to create the concave top surface
    translate([0, 0, cap_height + concave_r - concave_depth])
      sphere(r = concave_r);
  }
}

module analog_stick() {
  // 1. Bottom peg
  cylinder(d = peg_diameter, h = peg_height);

  // 2. Base / skirt
  translate([0, 0, peg_height])
    cylinder(d = base_diameter, h = base_height);

  // 3. Tapered shaft
  translate([0, 0, peg_height + base_height])
    cylinder(d1 = shaft_d_bot, d2 = shaft_d_top, h = shaft_height);

  // 4. Thumb cap with concave top
  translate([0, 0, peg_height + base_height + shaft_height])
    thumb_cap();
}

analog_stick();