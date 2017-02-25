#' set_clade_color
#'
#' given a nodeid and a java.awt.Color apply the color to all descendants
#'
#' @param phyJ Required. a \code{\link{phyloJ}} class object
#' @param nodeid Required. Name of a node.
#' @param color Required. a java.awt.Color
#'
#' https://github.com/cmzmasek/forester/blob/b61cc2dcede0bede317db362472333115756b8c6/forester/java/src/org/forester/phylogeny/data/BranchData.java
#' https://github.com/cmzmasek/forester/blob/b61cc2dcede0bede317db362472333115756b8c6/forester/java/src/org/forester/phylogeny/data/BranchColor.java
#'
#'
#' @export
#'
set_clade_color <- function(phyJ, nodeid, color) {

  phyJtree  <- phyJ@phytreeJ
  node      <- .jcall(phyJtree, "Lorg/forester/phylogeny/PhylogenyNode;", "getNode", nodeid)


  # apply color to node
  bcolor     <- .jnew("org/forester/phylogeny/data/BranchColor", color)
  branchdata <- .jcall(node, "Lorg/forester/phylogeny/data/BranchData;", "getBranchData")
  .jcall(branchdata, "V", "setBranchColor", bcolor)

  # apply color to all descendants
  nodes    <- node$getAllDescendants()
  iternode <- .jnew("org/forester/phylogeny/iterators/LevelOrderTreeIterator", node)

  while(.jrcall(iternode,"hasNext")) {
    subnode    <- .jrcall(iternode,"next")
    branchdata <- .jcall(subnode, "Lorg/forester/phylogeny/data/BranchData;", "getBranchData")
    .jcall(branchdata, "V", "setBranchColor", bcolor)

  }

  phyJ@phytreeJ <- phyJtree

  phyJ
}
