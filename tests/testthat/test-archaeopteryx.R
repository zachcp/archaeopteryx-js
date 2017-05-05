context("Test Archaeopteryx HTMLwidget Construction")

test_that("Archaeopteryx returns an htmlwidget", {

  tree   <- ape::read.tree(text="(mammal,(turtle,rayfinfish,(frog,salamander)));")
  phyJ   <- create_phyloJ(phylo = tree)
  widget <- archaeopteryx(phyJ)

  expect_is(widget, "htmlwidget")
  expect_is(widget, "archaeopteryx")

})
