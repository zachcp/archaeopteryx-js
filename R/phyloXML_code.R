# Code in this file uses Forester to annotate files with
# https://sites.google.com/site/cmzmasek/home/software/forester/decorator
#
#



#' parse the mapping file
#'
parse_mapping_file <- function(fname) {
  file    <- .jnew("java.io.File", fname)
  PhyDec  <- J("org.forester.tools.PhylogenyDecorator")

  PhyDec$parseMappingTable(file)
}

#' parse_newick
#'
parse_newick <- function(newick) {
  phylo <- J("org.forester.phylogeny.Phylogeny")
  phylo$createInstanceFromNhxString(newick)
}

#' convert a tree to XML
#'
tree_to_XML <- function(phylogeny) {
  zero      <- .jnew("java.lang.Integer", "0")
  phyWriter <- .jnew("org.forester.io.writers.PhylogenyWriter")

  phyWriter$toPhyloXML(phylogeny, zero$intValue())$toString()
}

#' decorate the phylogeny
#'
#' use forester's decorate code ot ad informaiton to the phlogeny
#'
decorate_phylogeny <- function(phylogeny, metadata) {
  PhyDec   <- J("org.forester.tools.PhylogenyDecorator")
  PhyDec$decorate(phylogeny, metadata, FALSE)
}

#' decorate_node
#'
decorate_node <- funciton(tree, nodeid, property, value, appliesto="node") {
  pmap <- J("org.forester.phylogeny.data.PropertiesMap")

  node      <- tree$getNode(nodeid)
  nodedata  <- node$getNodeData()
  nodeprops <- nodedata$getProperties()

  if (is.null(nodeprops)) nodeprops <- new(pmap)

  prop     <- J("org/forester/phylogeny/data/Property")
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



# Collapse subtree
# https://github.com/cmzmasek/forester/blob/master/forester/java/src/org/forester/phylogeny/PhylogenyMethods.java
# collapseSubtreeStructure
# setScientificName
# setTaxonomyCode
# addMolecularSeqsToTree
# setBranchColorValue
#
# org.forester.phylogeny.data.NodeData
# setNodename
# setProperties
#
