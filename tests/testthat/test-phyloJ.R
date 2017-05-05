context("Test PhyloJ Constructions")

test_that("PhyloJ objects can be created correctly", {

  tree <- ape::read.tree(text="(mammal,(turtle,rayfinfish,(frog,salamander)));")
  dna1 <- Biostrings::DNAStringSet(c("AAA","CCC","TTT","TTG","GTG"))
  names(dna1) <- c("mammal", "turtle", "rayfinfish", "frog", "salamander")

  phyJ <- create_phyloJ(phylo = tree, seqs = dna1)

  expect_is(phyJ@phy_tree, "phylo4")
  expect_is(phyJ@phy_data, "data.table")
  expect_is(phyJ@refseq, "DNAStringSet")
  expect_is(phyJ@phytreeJ, "jobjRef")
  expect_equal(rJava::.jclass(phyJ@phytreeJ), "org.forester.phylogeny.Phylogeny")

})


