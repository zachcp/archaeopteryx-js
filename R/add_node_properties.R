#' add_node_properties
#'
#' add multiple properties to nodes in a Phylogeny
#'
#' @param phylogeny Required. A Forester Phylogeny Object.
#' @param properties Required. A three column, tidy data frame where the colums represent
#' the node name, the property, and the value. Will apply each property/value pair to the
#' specified node.
add_node_properties <- function(phylogeny, properties) {
  pmap    <- J("org.forester.phylogeny.data.PropertiesMap")
  prop    <- J("org/forester/phylogeny/data/Property")
  applyto <- J("org.forester.phylogeny.data.Property$AppliesTo")$NODE

  names(properties) <- c("node","property", "value")

  nodedfs <- split(properties, properties$node)

  for (nodedf in nodedfs) {
    print(nodedf)
    nodeid    <- unique(nodedf$node)
    print(nodeid)
    node      <- phylogeny$getNode(nodeid)
    print(node)
    nodedata  <- node$getNodeData()
    nodeprops <- nodedata$getProperties()

    if (is.null(nodeprops)) nodeprops <- new(pmap)

    mapply(function(node, property, value) {
      p1 <- new(prop,
                paste0("ref:", property),
                value,
                "unit:string",
                "xsd:string",
                applyto)

      nodeprops$addProperty(p1)
    },
    nodedf$node,
    nodedf$property,
    nodedf$value
    )

    nodedata$setProperties(nodeprops)
  }

  phylogeny
}
