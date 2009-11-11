Overview
========

VillainousStyle is a drawing library for defining a visual style from a chain of individual drawing instructions. Each instruction modifies the drawing context to perform common operations; such operations include shadows, fills, borders, and shapes. It allows for multiple style sheets which can be used to theme an application in multiple visual contexts. VillainousStyle sits on top of CoreGraphics, and does not use WebKit for rendering at all. It is a port of the VSStyle and VSShape classes from the [Three20 project](http://github.com/joehewitt/three20).

The project contains two targets:

* the VillainousStyle framework, which can be included in your application
* the MacDemo application, which demonstrates how to use the framework, including multiple stylesheets

Requirements
============

* Mac OS X 10.5+
* 32-bit only currently (mostly because it hasn't been fully tested in 64-bit)

Install
=======

Clone or download the repository, and build the framework. You can also build and run the test application.

Stylesheets
===========

VSStyleSheet is an abstract superclass for a set of styles. Subclass it and add methods for each style you wish to add. You will likely want to create a protocol for your styles to implement, to ensure that your stylesheet implements all the necessary styles.

There is a global stylesheet, which can be thought of as the "active" stylesheet. Call `+[VSStyleSheet setGlobalStyleSheet:]` to change the active theme, which will fire a `VSStyleSheetChangedNotification`. When that gets fired, you'll want to tell your views to update their styles and redraw.

Styles
======

Styles affect drawing and positioning. Most will affect the next VSStyle objects in the chain.

* Fills
 * VSSolidFillStyle - Fills the current shape with a solid color
 * VSLinearGradientFillStyle - Fills the current shape with a gradient between two colors
 * VSReflectiveFillStyle - Fills the current shape with a glossy-style gradient between two colors
* Borders
 * VSSolidBorderStyle - Draws a border around the current shape with a solid color
 * VSBevelBorderStyle - Draws a beveled edge border for a 3D effect around the current shape
 * VSFourBorderStyle - Draws a border around the current shape with four colors, one for each edge
* Shadows
 * VSShadowStyle - Draws a shadow behind content with a given color, blur, and offset
 * VSInnerShadowStyle - Draws a shadow inside the content with a given color, blur, and offset
* Positioning
 * VSBoxStyle - Adds a margin or padding to the content area
 * VSInsetStyle - Adds edge insets to the content area
* Content
 * VSTextStyle - Draws text inside the current shape
 * VSImageStyle - Draws an image inside the current shape
 * VSMaskStyle - Clips the drawing area to an image mask
 * VSShapeStyle - Clips the drawing area with a VSShape object

Shapes
======

Shapes affect the fills and borders, but do not clip the content styles.

* VSRectangleShape
* VSRoundedRectangleShape
* VSRoundedLeftArrowShape - a rounded rectangle with a left-facing arrow
* VSRoundedRightArrowShape - a rounded rectangle with a right-facing arrow

Future Ideas
============

* File-based stylesheets that can be read/written from VSStyleSheet objects
* GUI builder for styles
* More styles!

Screenshots
===========

![Light Test Style](http://github.com/amazingsyco/TTStyleMac/raw/master/Screenshots/light-test-style.png "Light Test Style") ![Dark Test Style](http://github.com/amazingsyco/TTStyleMac/raw/master/Screenshots/dark-test-style.png "Dark Test Style")