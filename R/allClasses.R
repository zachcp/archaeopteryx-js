#' An S4 class to hold phylogenetic information.
#'
#'
#' @importClassesFrom data.table data.table
#' @importClassesFrom rJava jobjRef
#' @importClassesFrom phylobase phylo4
#'
#' @name phyloJ
#' @rdname phyloJ-class
#' @exportClass phyloJ
#'
setClass(Class="phyloJ",
         representation=representation(
           phy_tree="phylo4",
           phy_data="data.table",
           phytreeJ="jobjRef")
)
