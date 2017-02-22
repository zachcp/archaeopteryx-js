#' parse_newick
#'
#' take a newick stirng and parse int o a Phylogeny object.
#' @param newick Required. A Newick string to parse into a Phylogeny object.
#' @export
parse_newick <- function(newick) {
  phylo <- J("org.forester.phylogeny.Phylogeny")
  phylo$createInstanceFromNhxString(newick)
}
