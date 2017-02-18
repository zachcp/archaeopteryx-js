# Code in this file uses Forester to annotate files with
# https://sites.google.com/site/cmzmasek/home/software/forester/decorator
#
#


#' parse the mapping file
#'
#' @param fname Required. A filename corresponding to the MappingFile
#'
#' @export
#' @seealso \url{https://github.com/cmzmasek/forester/blob/b61cc2dcede0bede317db362472333115756b8c6/forester/java/src/org/forester/application/decorator.java}
#' @seealso \url{https://sites.google.com/site/cmzmasek/home/software/forester/decorator}
#'
parse_mapping_file <- function(fname) {
  file    <- .jnew("java.io.File", fname)
  PhyDec  <- J("org.forester.tools.PhylogenyDecorator")

  PhyDec$parseMappingTable(file)
}

#' parse_newick
#'
#' take a newick stirng and parse int o a Phylogeny object.
#' @param newick Required. A Newick string to parse into a Phylogeny object.
#' @export
parse_newick <- function(newick) {
  phylo <- J("org.forester.phylogeny.Phylogeny")
  phylo$createInstanceFromNhxString(newick)
}

#' convert a tree to XML
#'
#' @param phylogeny Required. A Forester Phylogeny Object
#' @export
tree_to_XML <- function(phylogeny) {
  if (!.jclass(phylogeny) ==  "org.forester.phylogeny.Phylogeny") {
    stop( " this function requires a Forester Phylogenetic tree")
  }

  zero      <- .jnew("java.lang.Integer", "0")
  phyWriter <- .jnew("org.forester.io.writers.PhylogenyWriter")

  phyWriter$toPhyloXML(phylogeny, zero$intValue())$toString()
}

#' decorate the phylogeny
#'
#' use forester's decorate code ot ad informaiton to the phlogeny
#'
#' @param phylogeny Required. A Forester Phylogeny Object
#' @param phylogeny Required. A Forester Phylogeny Object
#' @export
decorate_phylogeny <- function(phylogeny, metadata) {
  if (!.jclass(phylogeny) ==  "org.forester.phylogeny.Phylogeny") {
    stop( " this function requires a Forester Phylogenetic tree")
  }

  PhyDec   <- J("org.forester.tools.PhylogenyDecorator")
  PhyDec$decorate(phylogeny, metadata, FALSE)
}

#' add_node_property
#'
#' @param tree
#' @param nodeid
#' @param property
#' @param value
#' @export
add_node_property <- function(tree, nodeid, property, value) {
  pmap <- J("org.forester.phylogeny.data.PropertiesMap")

  node      <- tree$getNode(nodeid)
  nodedata  <- node$getNodeData()
  nodeprops <- nodedata$getProperties()

  if (is.null(nodeprops)) nodeprops <- new(pmap)

  prop    <- J("org/forester/phylogeny/data/Property")
  applyto <- J("org.forester.phylogeny.data.Property$AppliesTo")$NODE

  # ref,  value, unit, datatype, applies_to
  #new(property,  "ref:test",  "that",  "datatype:200", "xsd:string", node)
  p1 <- new(prop,
            paste0("ref:", property),
            value,
            "unit:NA",
            "xsd:string",
            applyto)

  # can expand this to add properties
  nodeprops$addProperty(p1)
  nodedata$setProperties(pmap)
}



