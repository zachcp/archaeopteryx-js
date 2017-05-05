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

  phyJtree <- phyJ@phytreeJ
  trt      <- phyJtree$getNode("turtle")
  expect_equal(rJava::.jclass(trt), "org.forester.phylogeny.PhylogenyNode")

  trtdata  <- trt$getNodeData()
  expect_equal(rJava::.jclass(trtdata), "org.forester.phylogeny.data.NodeData")

})


test_that("Adding Sequence data to phyloXML outputs", {

  tree <- ape::read.tree(text="(mammal,(turtle,rayfinfish,(frog,salamander)));")
  seqs <- c("AAA","CCC","TTT","TTG","GTG")
  dna  <- Biostrings::DNAStringSet(seqs)
  names(dna) <- c("mammal", "turtle", "rayfinfish", "frog", "salamander")

  phyJ  <- create_phyloJ(phylo = tree, seqs = dna)

  # sequences are NOT found in treestring1
  expect_true(
    all.equal(
      as.logical(lapply(seqs,  function(s) { grepl(s, write_phyloXML(phyJ))})),
      c(FALSE, FALSE, FALSE, FALSE, FALSE)))

  # add the sequences to the tree
  add_sequences(phyJ)

  # sequences ARE found in treestring2
  expect_true(
    all.equal(
      as.logical(lapply(seqs,  function(s) { grepl(s, write_phyloXML(phyJ))})),
      c(TRUE, TRUE, TRUE, TRUE, TRUE)))
})

