#' Annotate a Forester Tree
#'
#' @importFrom data.table melt
#' @export
annotate_tree <- function(phyJ) {

  annotationdt  <- phyJ@phy_data
  phyJtree      <- phyJ@phytreeJ
  annotationdt  <- melt(annotationdt, id.vars = "nodes")
  phyJtree      <- add_node_properties(phyJtree, properties=annotationdt)

  phyJ@phytreeJ <- phyJtree

  phyJ

}
