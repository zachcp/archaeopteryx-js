#' convert a tree to  phyloXML
#'
#' convert a Forester phylogeny object to an XML string.
#'
#' @param phylogeny Required. A Forester Phylogeny Object ora phyloJ
#' @export
#'
#' @docType methods
#' @rdname write_phyloXML-methods
#'
#' @seealso \url{http://www.phyloxml.org/}
#' @seealso \url{https://sites.google.com/site/cmzmasek/home/software/forester}
#' @seealso \url{https://github.com/cmzmasek/forester/blob/master/forester/java/src/org/forester/phylogeny/Phylogeny.java}
setGeneric("write_phyloXML", function(phylogeny) standardGeneric("write_phyloXML"))
#'
#' @rdname write_phyloXML-methods
#' @export
setMethod("write_phyloXML", "jobjRef", function(phylogeny) {

  if (!.jclass(phylogeny) == "org.forester.phylogeny.Phylogeny") {
    stop(" write_phyloXML can only act on tree objects. This Java object is not of the class org.forester.phylogeny.Phylogeny")
  }
  zero      <- .jnew("java/lang/Integer", "0")
  phyWriter <- .jnew("org/forester/io/writers/PhylogenyWriter")
  phyWriter$toPhyloXML(phylogeny, zero$intValue())$toString()
})
#'
#' @rdname write_phyloXML-methods
#' @export
setMethod("write_phyloXML", "phyloJ", function(phylogeny) {
  phyJtree <- phylogeny@phytreeJ
  write_phyloXML(phyJtree)
})
