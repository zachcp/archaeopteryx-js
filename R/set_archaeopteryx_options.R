#' set_archaeopteryx_options
#'
#'
#' @param arch Required. An archaeopteryx htmlwidget
#' @export
#'
set_archaeopteryx_options <- function(
  arch,
  alignPhylogram  = NULL,
  backgroundColorDefault = NULL,
  branchColorDefault = NULL,
  branchDataFontSize = NULL,
  branchWidthDefault = NULL,
  collapsedLabelLength = NULL,
  defaultFont = NULL,
  dynahide = NULL,
  externalNodeFontSize = NULL,
  found0and1ColorDefault = NULL,
  found0ColorDefault = NULL,
  found1ColorDefault = NULL,
  internalNodeFontSize = NULL,
  labelColorDefault = NULL,
  minBranchLengthValueToShow = NULL,
  minConfidenceValueToShow = NULL,
  nameForNhDownload = NULL,
  nameForPhyloXmlDownload = NULL,
  nameForPngDownload = NULL,
  nameForSvgDownload = NULL,
  nodeSizeDefault = NULL,
  nodeVisualizationsOpacity = NULL,
  phylogram = NULL,
  searchIsCaseSensitive = NULL,
  searchIsPartial = NULL,
  searchUsesRegex = NULL,
  showBranchEvents = NULL,
  showBranchLengthValues = NULL,
  showBranchVisualizations = NULL,
  showConfidenceValues = NULL,
  showDisributions = NULL,
  showExternalLabels = NULL,
  showExternalNodes = NULL,
  showInternalLabels = NULL,
  showInternalNodes = NULL,
  showNodeEvents = NULL,
  showNodeName = NULL,
  showNodeVisualizations = NULL,
  showSequence = NULL,
  showSequenceAccession = NULL,
  showSequenceGeneSymbol = NULL,
  showSequenceName = NULL,
  showSequenceSymbol = NULL,
  showTaxonomy = NULL,
  showTaxonomyCode = NULL,
  showTaxonomyCommonName = NULL,
  showTaxonomyRank = NULL,
  showTaxonomyScientificName = NULL,
  showTaxonomySynonyms = NULL,
  showVisualizationsLegend = NULL,
  visualizationsLegendOrientation = NULL,
  visualizationsLegendXpos = NULL,
  visualizationsLegendYpos = NULL) {

  if (!is.null(alignPhylogram)) arch$x$options['alignPhylogram'] <- alignPhylogram
  if (!is.null(backgroundColorDefault)) arch$x$options['backgroundColorDefault'] <- backgroundColorDefault
  if (!is.null(branchColorDefault)) arch$x$options['branchColorDefault'] <- branchColorDefault
  if (!is.null(branchDataFontSize)) arch$x$options['branchDataFontSize'] <- branchDataFontSize
  if (!is.null(branchWidthDefault)) arch$x$options['branchWidthDefault'] <- branchWidthDefault
  if (!is.null(collapsedLabelLength)) arch$x$options['collapsedLabelLength'] <- collapsedLabelLength
  if (!is.null(defaultFont)) arch$x$options['defaultFont'] <- defaultFont
  if (!is.null(dynahide)) arch$x$options['dynahide'] <- dynahide
  if (!is.null(externalNodeFontSize)) arch$x$options['externalNodeFontSize'] <- externalNodeFontSize
  if (!is.null(found0and1ColorDefault)) arch$x$options['found0and1ColorDefault'] <- found0and1ColorDefault
  if (!is.null(found1ColorDefault)) arch$x$options['found1ColorDefault'] <- found1ColorDefault
  if (!is.null(internalNodeFontSize)) arch$x$options['internalNodeFontSize'] <- internalNodeFontSize
  if (!is.null(labelColorDefault)) arch$x$options['labelColorDefault'] <- labelColorDefault
  if (!is.null(minBranchLengthValueToShow)) arch$x$options['minBranchLengthValueToShow'] <- minBranchLengthValueToShow
  if (!is.null(minConfidenceValueToShow)) arch$x$options['minConfidenceValueToShow'] <- minConfidenceValueToShow
  if (!is.null(nameForNhDownload)) arch$x$options['nameForNhDownload'] <- nameForNhDownload
  if (!is.null(nameForPhyloXmlDownload)) arch$x$options['nameForPhyloXmlDownload'] <- nameForPhyloXmlDownload
  if (!is.null(nameForPngDownload)) arch$x$options['nameForPngDownload'] <- nameForPngDownload
  if (!is.null(nameForSvgDownload)) arch$x$options['nameForSvgDownload'] <- nameForSvgDownload
  if (!is.null(nodeSizeDefault)) arch$x$options['nodeSizeDefault'] <- nodeSizeDefault
  if (!is.null(nodeVisualizationsOpacity)) arch$x$options['nodeVisualizationsOpacity'] <- nodeVisualizationsOpacity
  if (!is.null(phylogram)) arch$x$options['phylogram'] <- phylogram
  if (!is.null(searchIsCaseSensitive)) arch$x$options['searchIsCaseSensitive'] <- searchIsCaseSensitive
  if (!is.null(searchIsPartial)) arch$x$options['searchIsPartial'] <- searchIsPartial
  if (!is.null(searchUsesRegex)) arch$x$options['searchUsesRegex'] <- searchUsesRegex
  if (!is.null(showBranchEvents)) arch$x$options['showBranchEvents'] <- showBranchEvents
  if (!is.null(showBranchLengthValues)) arch$x$options['showBranchLengthValues'] <- showBranchLengthValues
  if (!is.null(showBranchVisualizations)) arch$x$options['showBranchVisualizations'] <- showBranchVisualizations
  if (!is.null(showConfidenceValues)) arch$x$options['showConfidenceValues'] <- showConfidenceValues
  if (!is.null(showDisributions)) arch$x$options['showDisributions'] <- showDisributions
  if (!is.null(showExternalLabels)) arch$x$options['showExternalLabels'] <- showExternalLabels
  if (!is.null(showExternalNodes)) arch$x$options['showExternalNodes'] <- showExternalNodes
  if (!is.null(showInternalLabels)) arch$x$options['showInternalLabels'] <- showInternalLabels
  if (!is.null(showInternalNodes)) arch$x$options['showInternalNodes'] <- showInternalNodes
  if (!is.null(showNodeEvents)) arch$x$options['showNodeEvents'] <- showNodeEvents
  if (!is.null(showNodeName)) arch$x$options['showNodeName'] <- showNodeName
  if (!is.null(showNodeVisualizations)) arch$x$options['showNodeVisualizations'] <- showNodeVisualizations
  if (!is.null(showSequence)) arch$x$options['showSequence'] <- showSequence
  if (!is.null(showSequenceAccession)) arch$x$options['showSequenceAccession'] <- showSequenceAccession
  if (!is.null(showSequenceGeneSymbol)) arch$x$options['showSequenceGeneSymbol'] <- showSequenceGeneSymbol
  if (!is.null(showSequenceName)) arch$x$options['showSequenceName'] <- showSequenceName
  if (!is.null(showSequenceSymbol)) arch$x$options['showSequenceSymbol'] <- showSequenceSymbol
  if (!is.null(showTaxonomy)) arch$x$options['showTaxonomy'] <- showTaxonomy
  if (!is.null(showTaxonomyCode)) arch$x$options['showTaxonomyCode'] <- showTaxonomyCode
  if (!is.null(showTaxonomyCommonName)) arch$x$options['showTaxonomyCommonName'] <- showTaxonomyCommonName
  if (!is.null(showTaxonomyRank)) arch$x$options['showTaxonomyRank'] <- showTaxonomyRank
  if (!is.null(showTaxonomyScientificName)) arch$x$options['showTaxonomyScientificName'] <- showTaxonomyScientificName
  if (!is.null(showTaxonomySynonyms)) arch$x$options['showTaxonomySynonyms'] <- showTaxonomySynonyms
  if (!is.null(showVisualizationsLegend)) arch$x$options['showVisualizationsLegend'] <- showVisualizationsLegend
  if (!is.null(visualizationsLegendOrientation)) arch$x$options['visualizationsLegendOrientation'] <- visualizationsLegendOrientation
  if (!is.null(visualizationsLegendXpos)) arch$x$options['visualizationsLegendXpos'] <- visualizationsLegendXpos
  if (!is.null(visualizationsLegendYpos)) arch$x$options['visualizationsLegendYpos'] <- visualizationsLegendYpos

  arch
}
