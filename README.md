<!-- README.md is generated from README.Rmd. Please edit that file -->
archaeopteryx
=============

The goal of archaeopteryx is to wrap the wonderful [archaeopteryx.js](https://sites.google.com/site/cmzmasek/home/software/archaeopteryx-js) library and make it accessible as an htmlwidget. Currently the basics work but I will be exploring changes to the API to try to make it work with R's pipe-based workflow.

Mini Roadmap
------------

A few thoughts on how to improve this code (no guarantees):

-   To be able to get all of the control-elements, we will need to specify the DOM elements.
-   If we want to have multiple trees on an RMD page, the DOM elements need to be labelled in the RMB code using htmlwidget tags.
-   To do this is not-trivial since the code names are hardcoded in the archeompertyx.js code and at first look they do not seem to be replaces usign the `options` or `settings` features that allow you to customize the chart.
-   provide access to some reasonably complete set of options that can be passed to users.
-   right now newick strings are passed/parsed. Can a direct JSON blob be transferred in order to save the encode/decode step? THis would also allow us to adorn information on each node.
-   be able to specify per-node attributes - which measn being able to pass in the information and using an API to modify the nodes.

Simple Usage.
-------------

``` r
## basic example code
library(archaeopteryx)
archaeopteryx(treestring = "((raccoon:19.19959,bear:6.80041):0.84600,((sea_lion:11.99700,seal:12.00300):7.
```