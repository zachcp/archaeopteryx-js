#' Create Node Visualizations
#'
#' @importFrom data.table melt
#'
create_node_visualizations <- function(phyJ) {

  annotationdt <- phyJ@phy_data
  nodecols     <- names(annotationdt)[2:ncol(annotationdt)]
  nodeviz      <- list()

  for (nodecol in nodecols) {
    nodeviz[[nodecol]] <- list(
      label = nodecol,
      description = nodecol,
      field = NULL,
      cladeRef = paste0("ref:", nodecol),
      regex  = FALSE,
      shapes = list('square', 'diamond', 'triangle-up', 'triangle-down', 'cross', 'circle'),
      colors = 'category20',
      sizes  = NULL)
  }

  nodeviz

}
