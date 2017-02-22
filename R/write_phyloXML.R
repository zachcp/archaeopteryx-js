#' convert a tree to  phyloXML
#'
#'
#' @param phylogeny Required. A Forester Phylogeny Object
#' @export
#'
setGeneric("write_phyloXML", function(tree) standardGeneric("write_phyloXML"))
#'
#'
setMethod("write_phyloXML", "jobjRef", function(tree) {
  if (!.jclass(tree) == "org.forester.phylogeny.Phylogeny") {
    stop(" write_phyloXML can only act on tree objects. This Java object is not of the class org.forester.phylogeny.Phylogeny")
  }
  zero      <- .jnew("java.lang.Integer", "0")
  phyWriter <- .jnew("org.forester.io.writers.PhylogenyWriter")
  phyWriter$toPhyloXML(tree, zero$intValue())$toString()
})
#'
#'
setMethod("write_phyloXML", "phyloJ", function(tree) {
  phyJtree <- tree@phytreeJ
  write_phyloXML(phyJtree)
})
