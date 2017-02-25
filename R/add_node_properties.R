  #' add_node_properties
#'
#' add multiple properties to nodes in a Phylogeny
#'
#' @param phylogeny Required. A Forester Phylogeny Object.
#' @param properties Required. A three column, tidy data.table where the colums represent
#' the node name, the property, and the value. Will apply each property/value pair to the
#' specified node.
#'
#' @export
add_node_properties <- function(phylogeny, properties) {
  pmap    <- J("org/forester/phylogeny/data/PropertiesMap")
  prop    <- J("org/forester/phylogeny/data/Property")
  applyto <- J("org/forester/phylogeny/data/Property$AppliesTo")$NODE

  names(properties) <- c("node","property", "value")

  nodedfs <- split(properties, by="node", variable.factor = FALSE)

  # iterate over nodes and add all properties to each node.
  for (nodedf in nodedfs) {
    nodeid    <- unique(nodedf$node)
    node      <- .jcall(phylogeny, "Lorg/forester/phylogeny/PhylogenyNode;", "getNode", nodeid)
    nodedata  <- .jcall(node, "Lorg/forester/phylogeny/data/NodeData;", "getNodeData")
    nodeprops <- .jcall(nodedata, "Lorg/forester/phylogeny/data/PropertiesMap;", "getProperties")

    if (is.null(nodeprops)) nodeprops <- new(pmap)

    mapply(function(property, value) {
        p1 <- new(prop, paste0("ref:", property), as.character(value), "unit:string", "xsd:string" , applyto)
        .jcall(nodeprops, "V", "addProperty", p1)

      },
      nodedf$property,
      nodedf$value
  )

  .jcall(nodedata, "V", "setProperties", nodeprops)

  }

  phylogeny
}
