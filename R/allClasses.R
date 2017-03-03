#' @importClassesFrom Biostrings BStringSet
#' @importClassesFrom Biostrings DNAStringSet
#' @importClassesFrom Biostrings RNAStringSet
#' @importClassesFrom Biostrings AAStringSet
#' @importClassesFrom Biostrings QualityScaledXStringSet
#' @importClassesFrom Biostrings XStringQuality
#' @importClassesFrom Biostrings PhredQuality
#' @importClassesFrom Biostrings SolexaQuality
#' @importClassesFrom Biostrings IlluminaQuality
#' @importClassesFrom Biostrings QualityScaledBStringSet
#' @importClassesFrom Biostrings QualityScaledDNAStringSet
#' @importClassesFrom Biostrings QualityScaledRNAStringSet
#' @importClassesFrom Biostrings QualityScaledAAStringSet
#' @importClassesFrom Biostrings XStringSet
#' @keywords internal
setClassUnion("XStringSetOrNULL", c("XStringSet", "NULL"))


#' An S4 class to hold phylogenetic information.
#'
#'
#' @importClassesFrom data.table data.table
#' @importClassesFrom rJava jobjRef
#' @importClassesFrom phylobase phylo4
#' @importClassesFrom Biostrings XStringSet
#'
#' @name phyloJ
#' @rdname phyloJ-class
#' @exportClass phyloJ
#'
setClass(Class="phyloJ",
         representation=representation(
           phy_tree="phylo4",
           phy_data="data.table",
           refseq="XStringSetOrNULL",
           phytreeJ="jobjRef")
)
