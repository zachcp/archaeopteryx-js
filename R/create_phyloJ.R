#' create phyloJ
#'
#' use a phylogentic tree and a data.frame of information.
#'
#' @importFrom ape write.tree
#' @importFrom ape makeNodeLabel
#' @export
create_phyloJ <- function(phylo, annotation) {

  phylomessage <- "the phylo input must be a phylogenetic object of class 'phylo'"
  if (!inherits(phylo, "phylo")) stop(phylomessage)

  annotmessage <- "annotation must be a data.table where the first columnis labelled 'nodes' "
  if (!inherits(annotation, "data.table")) stop(annotmessage)
  if (!colnames(annotation)[1] == "nodes") stop(annotmessage)

  nodematchmessage <- "all nodes must be found in the tree"
  nodenames <- dt$nodes
  tiplabels <- phylo$tip.label
  if (!all(nodenames %in% tiplabels)) stop(nodematchmessage)

  # label all internal nodes
  phylo <-  makeNodeLabel(phylo)

  phytreeJ <- parse_newick(write.tree(phylo))

  new("phyloJ", phy_tree=phylo, phy_data=annotation, phytreeJ=phytreeJ)

}
