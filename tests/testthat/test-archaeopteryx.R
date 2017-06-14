context("Test Archaeopteryx HTMLwidget Construction")


test_that("Archaeopteryx returns an htmlwidget", {

  tree   <- ape::read.tree(text="(mammal,(turtle,rayfinfish,(frog,salamander)));")
  phyJ   <- create_phyloJ(phylo = tree)
  widget <- archaeopteryx(phyJ)

  expect_is(widget, "htmlwidget")
  expect_is(widget, "archaeopteryx")

})


test_that("Archaeopteryx returns a widget when coloring multiple subclades", {

  data(bird.families)
  phyJ  <- create_phyloJ(bird.families)
  mrca1 <- get_MRCA(phyJ, c("Pardalotidae", "Centropidae"))
  mrca2 <- get_MRCA(phyJ, c("Laridae", "Thinocoridae"))
  red   <- J("java.awt.Color")$RED
  blue  <- J("java.awt.Color")$BLUE
  phyJ  <- set_clade_color(phyJ, mrca1, red)
  phyJ  <- set_clade_color(phyJ, mrca2, blue)

  expect_is(archaeopteryx(phyJ), "htmlwidget")

})
