#' parse_newick
#'
#' take a newick string and parse into a Phylogeny object.
#' @param newick Required. A Newick string to parse into a Phylogeny object.
#' @export
parse_newick <- function(newick) {
  phylo <- J("org/forester/phylogeny/Phylogeny")
  phylo$createInstanceFromNhxString(newick)
}
