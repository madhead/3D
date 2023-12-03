include <knurledFinishLib.scad>

offsetMargin = 0.1;
$fn = 128;

encoderShaftDiameter = 6.0;
encoderShaftFlatLength = 7.0;

knobDiameter = 25.0;
knobHeight = 20;
knurlWidth = 5;            // Knurl polyhedron width
knurlHeight = 5;           // Knurl polyhedron height
knurlDepth = 1;            // Knurl polyhedron depth
endSmoothing = 1;          // Cylinder ends smoothed height
surfaceSmoothing = 0;      // [ 0% - 100% ] Knurled surface smoothing amount

createKnob();

module createKnob()
{
    union()
    {
        difference()
        {
            // Main Knob Body
            knurled_cyl(knobHeight, knobDiameter, knurlWidth, knurlHeight, knurlDepth, endSmoothing, surfaceSmoothing);
            
            // Shaft Cutout
            translate(v = [0, 0, -offsetMargin])
            {
                cylinder(r = encoderShaftDiameter / 2 + offsetMargin, h = encoderShaftFlatLength);
            }
        }
    }
}