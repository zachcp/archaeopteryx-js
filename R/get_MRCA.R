#' get_MRCA
#'
#' @param phyJ
#' @param tips
#' @importFrom phylobase MRCA
#' @export
get_MRCA <- function(phyJ, tips) {
  if (!inherits(phyJ, "phyloJ")) stop("This functiononly works on pjyloJ objects")

  phy  <- phyJ@phy_tree
  mrca <- MRCA(phy, tips)

  names(mrca)
}
