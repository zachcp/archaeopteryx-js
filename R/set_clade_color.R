#' set_clade_color
#'
#'
#' @param phyJ Required.
#' @param nodeid Required.
#' @param color Required.
#'
#' https://github.com/cmzmasek/forester/blob/b61cc2dcede0bede317db362472333115756b8c6/forester/java/src/org/forester/phylogeny/data/BranchData.java
#' https://github.com/cmzmasek/forester/blob/b61cc2dcede0bede317db362472333115756b8c6/forester/java/src/org/forester/phylogeny/data/BranchColor.java
#'
#'
#' @export
#'
set_clade_color <- function(phyJ, nodeid, color) {

  # set color: to remove
  colorr   <- J("java.awt.Color")
  red      <- colorr$RED
  bcolor   <- .jnew("org.forester.phylogeny.data.BranchColor", red)

  phyJtree   <- phyJ@phytreeJ
  node       <- phyJtree$getNode(nodeid)

  # apply color to node
  branchdata <- node$getBranchData()
  branchdata$setBranchColor(bcolor)

  # apply color to all descendants
  nodes <- node$getAllDescendants()

  lapply(nodes, FUN = function(node){
    #node       <- phyJtree$getNode(nodeid)
    branchdata <- node$getBranchData()
    branchdata$setBranchColor(bcolor)
  })

  phyJ@phytreeJ <- phyJtree

  phyJ
}
