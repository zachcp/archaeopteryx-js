#' add_sequences
#'
#' add sequence data to your archaeoptreeyx sequences.
#'
#' @param phyJ Required. A \link{phyloJ} object.
#'
#' @export
add_sequences <- function(phyJ) {

  phyJtree      <- phyJ@phytreeJ
  refseq        <- phyJ@refseq

  for (nodeid in names(refseq)) {
    node         <- .jcall(phyJtree, "Lorg/forester/phylogeny/PhylogenyNode;", "getNode", nodeid)
    nodedata     <- .jcall(node, "Lorg/forester/phylogeny/data/NodeData;", "getNodeData")
    nodesequence <- .jnew("org.forester.phylogeny.data.Sequence")

    .jcall(nodesequence, "V", "setMolecularSequence", as.character(refseq[[nodeid]]))
    .jcall(nodesequence, "V", "setName", nodeid)
    .jcall(nodesequence, "V", "setType", "dna")
    .jcall(nodedata, "V", "addSequence", nodesequence)
  }

  phyJ@phytreeJ <- phyJtree
  phyJ
}

