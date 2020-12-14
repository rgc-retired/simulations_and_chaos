---
title: "Readme"
author: "R. G. Cronce"
date: "9/29/2020"
output: html_document
---


## Simulations from Deep Simplicity

These are toy simulations described in the
book *Deep Simplicity: Bringing Order to Chaos and Complexity* by John Gribbin
(published 2004, ISBN 0-7394-6008-0).  Some of these have sufficient detail
to implement a simulation but some will require additional investigation.


1. Avalanche, p. 171-172 (see avalanche.Rmd)

    Illustrates some of the problems seen in real avalanches in sand piles (or rice piles).

2. Gasket, p. 94-95 (see sierpinski_gasket.Rmd)

    Sierpinski Triangle (Gasket) construction via interval halving.  Given an equilateral
    triangle with vertices that serve as anchors with a random starting point.  For each
    trial, generate a random value (1,2,3) and progress half-way to the corresponding vertex
    of the basic equilateral triangle.  The locus of points will eventually trace out the
    Sierpinski gasket.

3. Fractal Fern, p. 97 (see fern.Rmd)

    Need an algorithm.  No details in the book, just a picture.  Turns out Wikipedia
    has a good example of this.

4. Koch Snowflake, p. 98-100 (see koch_snowflake.Rmd)

    There is enough detail but will require some work.
    
5. Logistic Equation, p. 78-82 (see logistic_map.Rmd)

    Given: `x[n+1]=B*x[n]*(1-x[n])` with 0<x[0]<1
    
    Generating solutions is boring when B is small.  Once B reaches (about) a value of 3,
    lots of fun things happen.
    
6. Feigenbaum Number, p. 84 (Wikipedia talks about it under Fractals)

    Need to find an algorithm for calculating it.  Not enough detail in the book.

7. The Peano Curve, p. 88-89 (many plane filling curves exist)

    Not sure what to do with this.

8. Daisyworld, p. 225-229 (lots of links on a Google Search with on-line sims)

    I wonder if such simulations are available on-line.  I could create some models
    and tweak on them to get the results in the book - but this might be reinventing
    the wheel and I should check first.

