#' parse the mapping file
#'
#' @param fname Required. A filename corresponding to the MappingFile
#'
#' @export
#' @seealso \url{https://github.com/cmzmasek/forester/blob/b61cc2dcede0bede317db362472333115756b8c6/forester/java/src/org/forester/application/decorator.java}
#' @seealso \url{https://sites.google.com/site/cmzmasek/home/software/forester/decorator}
#'
parse_mapping_file <- function(fname) {
  file    <- .jnew("java/io/File", fname)
  PhyDec  <- J("org/forester/tools/PhylogenyDecorator")

  PhyDec$parseMappingTable(file)
}
