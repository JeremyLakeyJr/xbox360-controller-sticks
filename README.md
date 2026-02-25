# Xbox 360 Controller Analog Stick Replacement

This repository contains 3D printable models for replacement analog sticks for the Xbox 360 controller.

## Screenshots

| Front / Isometric View | Side View |
|---|---|
| ![Analog Stick Front View](images/analog_stick_front.png) | ![Analog Stick Side View](images/analog_stick_side.png) |

## Files

- `analog_stick.scad` - OpenSCAD source for the analog stick model
- `analog_stick.stl` - STL file for 3D printing (generate from scad using OpenSCAD)

## Dimensions

- Ball diameter: 16mm
- Shaft diameter: 3.5mm
- Shaft length: 15mm
- Total height: 23mm

## Printing Instructions

- Material: PLA recommended
- Infill: 100% for durability
- Supports: None needed
- Resolution: 0.2mm layer height

## Assembly

1. Disassemble your Xbox 360 controller (refer to iFixit guide or similar).
2. Remove the faulty analog stick from the sensor module.
3. Print the analog_stick.stl file.
4. Attach the new stick to the module (may require glue or press fit depending on fit).

Note: The stick must fit securely in the Hall effect sensor or potentiometer housing. Adjust dimensions if necessary.

## Disclaimer

This is an open-source project for educational purposes. Use at your own risk. Ensure compatibility with your controller model.