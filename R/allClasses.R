################################################################################
#' An S4 placeholder of the main phylogenetic tree class from the ape package.
#'
#' See the \code{\link[ape]{ape}} package for details about this type of
#' representation of a phylogenetic tree.
#' It is used throughout the ape package.
#'
#' @seealso \code{\link[ape]{phylo}}, \code{\link{setOldClass}}
#'
#' @name phylo-class
#' @rdname phylo-class
#' @exportClass phylo
setOldClass("phylo")


#' An S4 class to hold phylogenetic information.
#'
#' @importClassesFrom data.table data.table
#' @importClassesFrom rJava jobjRef
#' @impo
#' @exportClass phyloJ
#'
setClass(Class="phyloJ",
         representation=representation(
           phy_tree="phylo",
           phy_data="data.table",
           phytreeJ="jobjRef")
)
