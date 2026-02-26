// Xbox 360 Analog Stick - Accurate replacement model
// All dimensions in millimeters
// Based on measurements of an actual Xbox 360 controller thumbstick

$fn = 80;  // smooth curves

// Bottom peg - cross / plus shaped (fits onto potentiometer shaft)
peg_across    = 3.5;    // diameter of circle enclosing the cross
peg_arm_width = 2.0;    // width of each arm of the cross
peg_height    = 4.0;    // depth the peg inserts into the potentiometer

// Base / skirt (rests on controller faceplate)
base_diameter = 16.0;
base_height   = 3.0;

// Main shaft (slightly tapered for grip)
shaft_d_bot   = 11.0;
shaft_d_top   =  9.0;
shaft_height  = 10.0;

// Thumb cap - concave centre with raised textured grip ring
cap_inner_diameter = 13.5;   // diameter of the concave bowl surface
cap_outer_diameter = 18.0;   // outer diameter including grip ring
cap_height         =  5.0;
concave_depth      =  1.5;   // depth of the concave bowl on the top face
grip_ring_height   =  1.0;   // how far the grip ring rises above the cap top
grip_ring_width    =  2.25;  // radial width of the grip ring

// Sphere radius for concave top, derived from chord/sagitta formula:
//   r = c^2 / (8*h) + h/2   (c = cap_inner_diameter, h = concave_depth)
concave_r = ((cap_inner_diameter * cap_inner_diameter) / (8 * concave_depth)
             + concave_depth / 2);

// Cross-shaped peg module
module cross_peg() {
  intersection() {
    cylinder(d = peg_across, h = peg_height);
    union() {
      // Horizontal arm
      translate([-peg_across/2, -peg_arm_width/2, 0])
        cube([peg_across, peg_arm_width, peg_height]);
      // Vertical arm
      translate([-peg_arm_width/2, -peg_across/2, 0])
        cube([peg_arm_width, peg_across, peg_height]);
    }
  }
}

// Thumb cap with concave centre and raised grip ring
module thumb_cap() {
  difference() {
    union() {
      // Main cap body
      cylinder(d = cap_outer_diameter, h = cap_height);
      // Raised grip ring around the outer edge
      translate([0, 0, cap_height])
        difference() {
          cylinder(d = cap_outer_diameter, h = grip_ring_height);
          translate([0, 0, -0.01])
            cylinder(d = cap_outer_diameter - 2 * grip_ring_width,
                     h = grip_ring_height + 0.02);
        }
    }
    // Subtract a large sphere to create the concave top surface
    translate([0, 0, cap_height + concave_r - concave_depth])
      sphere(r = concave_r);
  }
}

module analog_stick() {
  // 1. Cross-shaped bottom peg
  cross_peg();

  // 2. Base / skirt
  translate([0, 0, peg_height])
    cylinder(d = base_diameter, h = base_height);

  // 3. Tapered shaft
  translate([0, 0, peg_height + base_height])
    cylinder(d1 = shaft_d_bot, d2 = shaft_d_top, h = shaft_height);

  // 4. Thumb cap with concave top and grip ring
  translate([0, 0, peg_height + base_height + shaft_height])
    thumb_cap();
}

analog_stick();