Overview
========

TTStyle is a drawing library for defining a visual style from a chain of individual drawing instructions. Each instruction modifies the drawing context to perform common operations; such operations include shadows, fills, borders, and shapes. It allows for multiple style sheets which can be used to theme an application in multiple visual contexts. TTStyle sits on top of CoreGraphics, and does not use WebKit for rendering at all. It is a port of the TTStyle and TTShape classes from the [Three20 project](http://github.com/joehewitt/three20).

The project contains two targets:

* the TTStyle framework, which can be included in your application
* the TTStyleMacTest application, which demonstrates how to use the framework, including multiple stylesheets

Requirements
============

* Mac OS X 10.5+
* 32-bit only currently (mostly because it hasn't been fully tested in 64-bit)

Install
=======

Clone or download the repository, and build the framework. You can also build and run the test application.

Styles
======

* Fills
 * TTSolidFillStyle - Fills the current shape with a solid color
 * TTLinearGradientFillStyle - Fills the current shape with a gradient between two colors
 * TTReflectiveFillStyle - Fills the current shape with a glossy-style gradient between two colors
* Borders
 * TTSolidBorderStyle - Draws a border around the current shape with a solid color
 * TTBevelBorderStyle - Draws a beveled edge border for a 3D effect around the current shape
 * TTFourBorderStyle - Draws a border around the current shape with four colors, one for each edge
* Shadows
 * TTShadowStyle - Draws a shadow behind content with a given color, blur, and offset
 * TTInnerShadowStyle - Draws a shadow inside the content with a given color, blur, and offset
* Positioning
 * TTBoxStyle - Adds a margin or padding to the content area
 * TTInsetStyle - Adds edge insets to the content area
* Content
 * TTTextStyle - Draws text inside the current shape
 * TTImageStyle - Draws an image inside the current shape
 * TTMaskStyle - Clips the drawing area to an image mask
 * TTShapeStyle - Clips the drawing area with a TTShape object

Shapes
======

* TTRectangleShape
* TTRoundedRectangleShape
* TTRoundedLeftArrowShape - a rounded rectangle with a left-facing arrow
* TTRoundedRightArrowShape - a rounded rectangle with a right-facing arrow