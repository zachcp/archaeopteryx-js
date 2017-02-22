#' decorate the phylogeny
#'
#' use forester's decorate code ot ad informaiton to the phlogeny
#'
#' @param phylogeny Required. A Forester Phylogeny Object
#' @param metadata Required. Metadata table.
#' @export
decorate_phylogeny <- function(phylogeny, metadata) {
  if (!.jclass(phylogeny) ==  "org.forester.phylogeny.Phylogeny") {
    stop( " this function requires a Forester Phylogenetic tree")
  }
  PhyDec   <- J("org.forester.tools.PhylogenyDecorator")
  PhyDec$decorate(phylogeny, metadata, FALSE)
}
