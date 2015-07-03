S A S S


Syntax & Formatting
-------------------

Roughly, we want:

* two (2) spaces indents, no tabs;
* ideally, 80-characters wide lines;
* properly written multi-line CSS rules;
* meaningful use of whitespace (1 clear lines between sections)

Commenting
----------

CSS is a tricky language, full of hacks and oddities. Because of this, it should be well commented, especially if you or someone else intend to read and update the code 6 months or 1 year from now. Don’t let you or anybody else be in the position of I-didn’t-write-this-oh-my-god-why.

As simple as CSS can get, there is still a lot of room for comments.

These could be explaining:

* the structure and/or role of a file;
* the goal of a ruleset;
* the idea behind a magic number;
* the reason for a CSS declaration;
* the order of CSS declarations;
* the thought process behind a way of doing things.

Commenting takes very little time when done seamlessly along with the code so do it at the right time. Coming back at a piece of code to comment it is not only completely unrealistic but also extremely annoying.

/**
 * Helper class to truncate and add ellipsis to a string too long for it to fit
 * on a single line.
 * 1. Prevent content from wrapping, forcing it on a single line.
 * 2. Add ellipsis at the end of the line.
 */

.ellipsis {
  white-space: nowrap; /* 1 */
  text-overflow: ellipsis; /* 2 */
  overflow: hidden;
}

Colours
-------

In order to make colours as simple as they can be, respecting the following order of preference for colour formats:

1	CSS color keywords;
2	HSL notation; http://hslpicker.com
3	RGB notation;
4	Hexadecimal notation. Preferably lowercase and shortened when possible.

Keywords often speak for themselves. Great for our marketing team and less experienced CSS editors.

The HSL representation makes it easy for stylesheet authors to tweak the colour by adjusting the hue, saturation and lightness individually.

RGB does not make it easy to build a colour from the three parts.

Lastly, hexadecimals, while simple, are close to indecipherable for the human mind.

Quotations
----------

CSS does not require strings to be quoted, not even those containing spaces. Take font-family names for instance: it doesn’t matter whether you wrap them in quotes for the CSS parser.

Because of this, Sass also does not require strings to be quoted, but we WILL maintain quotes.

There are several reasons for this:

* colour names are treated as colours when unquoted, which can lead to serious issues;
* most syntax highlighters will fail on unquoted strings;
* helps general readability;
* there is no valid reason not to quote strings.

Lists
-----

Lists are the Sass equivalent of arrays. A list is a flat data structure intended to store values of any type (including lists, leading to nested lists).

Lists should respect the following guidelines:
* either inlined or multilines;
* necessarily on multilines if too long to fit on an 80-character line;
* unless used as is for CSS purposes, always comma separated;
* always wrapped in parenthesis;
* trailing comma if multilines, not if inlined.

// Yep
$font-stack: ('Helvetica', 'Arial', sans-serif);

// Nope
$font-stack: 'Helvetica' 'Arial' sans-serif;


Naming Conversions
------------------

For nested elements, or sections that  are styled depending on their hierarchy or
heritage we should strive to style these as clearly and appropriately as possible.

To BEM or not to BEM:

The point of BEM is to tell other developers more about what a piece of markup is doing from its name alone. By reading some HTML with some classes in, you can see how – if at all – the chunks are related; something might just be a component, something might be a child, or element, of that component, and something might be a variation or modifier of that component. To use an analogy/model, think how the following things and elements are related.

The naming convention follows this pattern:

.block {}
.block__element {}
.block--modifier {}
.block represents the higher level of an abstraction or component.
.block__element represents a descendent of .block that helps form .block as a whole.
.block--modifier represents a different state or version of .block.

I agree that BEM does look weird, but the power it brings far outweighs any negatives to do with its appearance by an order of magnitude.

Declaration Sorting
-------------------

Ordering properties by type makes perfect sense e.g. font-related declarations are gathered, top and bottom are reunited and reading a ruleset kind of feels like reading a short story.

* Keep margins/padding/fonts/colours/animations/ etc together

Selector Nesting
----------------

The problem with selector nesting is that it ultimately makes code more difficult to read. One has to mentally compute the resulting selector out of the indentation levels; it is not always quite obvious what the CSS will end up being.

This statement becomes truer as selectors get longer and references to the current selector (&) more frequent. At some point, the risk of losing track and not being able to understand what’s going on anymore is so high that it is not worth it.

To prevent such a situation, we avoid selector nesting as much as possible.

Mixins
------

Mixins are one of the most used features from the whole Sass language. They are the key to reusability and DRY components. And for good reason: mixins allow authors to define styles that can be reused throughout the stylesheet without needing to resort to non-semantic classes such as .float-left.

They can contain full CSS rules and pretty much everything that is allowed anywhere in a Sass document. They can even take arguments, just like functions. Needless to say, the possibilities are endless.

* No longer than 20 lines
* Avoid over-engineering
* Comment well (explain the mixin)

/// Helper to clear inner floats
/// @author Nicolas Gallagher
/// @link http://nicolasgallagher.com/micro-clearfix-hack/ Micro Clearfix
@mixin clearfix {
  &::after {
    content: '';
    display: table;
    clear: both;
  }
}

BURN LIST
---------

To be avoided at all cost.

* Magic Numbers
* Use of !important
* As few loops as possible, no @while;

Documentation
-------------

Every variable, function, mixin and placeholder that is intended to be reused all over the codebase should be documented as part of the global API using SassDoc. - EVENTUALLY

