#' get_MRCA
#'
#' for a given character vector of tips, find the MRCA.
#'
#' @param phyJ a  phyloJ object.
#' @param tips a vector of tips. will find the MRCA.
#' @importFrom phylobase MRCA
#' @export
get_MRCA <- function(phyJ, tips) {
  if (!inherits(phyJ, "phyloJ")) stop("This function only works on phyloJ objects")

  phy  <- phyJ@phy_tree
  mrca <- MRCA(phy, tips)

  names(mrca)
}
