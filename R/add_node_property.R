#' add_node_property
#'
#' a property to a node based on its name.
#'
#' @param phylogeny Required. A Forester Phylogeny Object.
#' @param nodeid Required. The name of the taget node.
#' @param property Required. Name of the property to add.
#' @param value Required. Value of the proerty to add.
#' @export
add_node_property <- function(phylogeny, nodeid, property, value) {

  #https://sites.google.com/site/cmzmasek/home/software/archaeopteryx/documentation#TOC-To-color-one-subtree

  pmap <- J("org.forester.phylogeny.data.PropertiesMap")
  prop    <- J("org/forester/phylogeny/data/Property")
  applyto <- J("org.forester.phylogeny.data.Property$AppliesTo")$NODE

  node      <- phylogeny$getNode(nodeid)
  nodedata  <- node$getNodeData()
  nodeprops <- nodedata$getProperties()

  if (is.null(nodeprops)) nodeprops <- new(pmap)

  # ref,  value, unit, datatype, applies_to
  #new(property,  "ref:test",  "that",  "datatype:200", "xsd:string", node)
  p1 <- new(prop,
            paste0("ref:", property),
            value,
            "unit:string",
            "xsd:string",
            applyto)

  # can expand this to add properties
  nodeprops$addProperty(p1)
  nodedata$setProperties(nodeprops)

  #return phylogeny to facilitate chaining
  phylogeny
}
