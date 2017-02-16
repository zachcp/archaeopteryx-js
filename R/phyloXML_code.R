# Code in this file uses Forester to annotate files with
# https://sites.google.com/site/cmzmasek/home/software/forester/decorator
#
#

# write(x = "turtle	TAXONOMY_CODE:BACTN	TAXONOMY_ID:226186	TAXONOMY_ID_PROVIDER:ncbi	TAXONOMY_SN:Bacteroides thetaiotaomicron	SEQ_ACCESSION:29341016	SEQ_ACCESSION_SOURCE:gi	SEQ_SYMBOL:BT3701 SEQ_NAME:SusD",
#       file="temp.txt")
write(x = "turtle	TAXONOMY_CODE:BACTN	TAXONOMY_ID:226186	TAXONOMY_ID_PROVIDER:ncbi	TAXONOMY_SN:Bacteroides thetaiotaomicron	SEQ_ACCESSION:29341016	SEQ_ACCESSION_SOURCE:gi SEQ_NAME:SusD SEQ_SYMBOL:BT3701",
      file="temp.txt")

tree  <- parse_newick("(mammal,(turtle,rayfinfish,(frog,salamander)))")
table <- parse_mapping_file("temp.txt")
decorate_phylogeny(tree, table)
archaeopteryx(treestring=treestring)

tree
treestring <- tree_to_XML(tree)




#' parse the mapping file
#'
parse_mapping_file <- function(fname) {
  file    <- .jnew("java.io.File", fname)
  PhyDec  <- J("org.forester.tools.PhylogenyDecorator")

  PhyDec$parseMappingTable(file)
}

#' parse_newick
#'
parse_newick <- function(newick) {
  phylo <- J("org.forester.phylogeny.Phylogeny")
  phylo$createInstanceFromNhxString(newick)
}

#' convert a tree to XML
#'
tree_to_XML <- function(phylogeny) {
  zero      <- .jnew("java.lang.Integer", "0")
  phyWriter <- .jnew("org.forester.io.writers.PhylogenyWriter")

  phyWriter$toPhyloXML(phylogeny, zero$intValue())$toString()
}

#' decorate the phylogeny
#'
#' use forester's decorate code ot ad informaiton to the phlogeny
#'
decorate_phylogeny <- function(phylogeny, metadata) {
  PhyDec   <- J("org.forester.tools.PhylogenyDecorator")
  PhyDec$decorate(phylogeny, metadata, FALSE)
}
