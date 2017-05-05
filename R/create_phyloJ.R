#' create phyloJ
#'
#' use a phylogentic tree and a data.frame of information.
#'
#' @param phylo Required. A phylogenetic tree of class \code{\link[ape]{phylo}} or \code{\link[phylobase]{phylo4}}
#' @param annotation Optional. A \code{\link[data.table]{data.table}} of annotation information. If a data.table is provided
#'    the first column must be the names of the tips of hte phylogenetic tree. The default value of "None" will allows you
#'    to pass in a phylogentic tree but you will be limited in terms of the visualizations you can use.
#' @param seqs Optional. An \code{\link[Biostrings]{XStringSet}} object. Holds sequences for use in tree.
#'
#' @importFrom ape write.tree
#' @importFrom ape makeNodeLabel
#' @importFrom data.table data.table
#' @export
create_phyloJ <- function(phylo, annotation=NULL, seqs=NULL) {

  phylomessage <- "the phylo input must be a phylogenetic object of class 'phylo' or 'phylo4'"
  if (!class(phylo) %in% c("phylo", "phylo4")) stop(phylomessage)

  annotmessage <- "annotation must be a data.table where the first column is labelled 'nodes' "
  if (is.null(annotation)) {
    annotation <- data.table(nodes=phylo$tip.label, nodenum = seq(phylo$tip.label), stringsAsFactors = FALSE)
  } else {
    if (!inherits(annotation, "data.table")) stop(annotmessage)
    if (!colnames(annotation)[1] == "nodes") stop(annotmessage)
  }

  nodematchmessage <- "all nodes must be found in the tree"
  nodenames <- annotation$nodes
  tiplabels <- phylo$tip.label
  if (!all(nodenames %in% tiplabels)) stop(nodematchmessage)

  # label all internal nodes
  if (class(phylo) == "phylo") {
    phylo <- makeNodeLabel(phylo)
    phylo <- as(phylo, "phylo4")
  } else {
    phylo <- as(phylo, "phylo")
    phylo <- makeNodeLabel(phylo)
    phylo <- as(phylo, "phylo4")
  }


  if (!is.null(seqs)) {
    for (name in names(seqs)) {
     if (!name %in% phylobase::tipLabels(phylo)) {
       stop('DNA reference names do not match phylogenetic tree tips')
     }
    }
  }

  phytreeJ <- parse_newick(write.tree(as(phylo, "phylo")))

  new("phyloJ", phy_tree=phylo, phy_data=annotation, phytreeJ=phytreeJ, refseq=seqs)

}
