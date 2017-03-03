#' base Archaeopteryx Options
get_default_options <- function() {
  options <- list()
  options["alignPhylogram"]               <- TRUE
  options["backgroundColorDefault"]       <- '#f0f0f0'
  options["branchColorDefault"]           <- '#909090'
  options["branchDataFontSize"]           <-  6
  options["branchWidthDefault"]           <-  1
  options["collapsedLabelLength"]         <-  7
  options["defaultFont"]                  <- 'Times'
  options["dynahide"]                     <- TRUE
  options["externalNodeFontSize"]         <-  10
  options["found0and1ColorDefault"]       <- '#0000ff'
  options["found0ColorDefault"]           <- '#00ff00'
  options["found1ColorDefault"]           <- '#ff0000'
  options["internalNodeFontSize"]         <- 6
  options["labelColorDefault"]            <- '#202020'
  options["minBranchLengthValueToShow"]   <- 0.01
  options["minConfidenceValueToShow"]     <- 0.5
  options["nameForNhDownload"]            <- 'archaeopteryx-js.nh'
  options["nameForPhyloXmlDownload"]      <- 'archaeopteryx-js.xml'
  options["nameForPngDownload"]           <- 'archaeopteryx-js.png'
  options["nameForSvgDownload"]           <- 'archaeopteryx-js.svg'
  options["nodeSizeDefault"]              <- 3
  options["nodeVisualizationsOpacity"]    <- 1.0
  options["phylogram"]                    <- TRUE
  options["searchIsCaseSensitive"]        <- FALSE
  options["searchIsPartial"]              <- TRUE
  options["searchUsesRegex"]              <- FALSE
  options["showBranchEvents"]             <- TRUE
  options["showBranchLengthValues"]       <- FALSE
  options["showBranchVisualizations"]     <- FALSE
  options["showConfidenceValues"]         <- TRUE
  options["showDisributions"]             <- TRUE
  options["showExternalLabels"]           <- TRUE
  options["showExternalNodes"]            <- TRUE
  options["showInternalLabels"]           <- FALSE
  options["showInternalNodes"]            <- FALSE
  options["showNodeEvents"]               <- TRUE
  options["showNodeName"]                 <- TRUE
  options["showNodeVisualizations"]       <- TRUE
  options["showSequence"]                 <- TRUE
  options["showSequenceAccession"]        <- TRUE
  options["showSequenceGeneSymbol"]       <- TRUE
  options["showSequenceName"]             <- TRUE
  options["showSequenceSymbol"]           <- TRUE
  options["showTaxonomy"]                 <- TRUE
  options["showTaxonomyCode"]             <- TRUE
  options["showTaxonomyCommonName"]       <-TRUE
  options["showTaxonomyRank"]             <- TRUE
  options["showTaxonomyScientificName"]   <- TRUE
  options["showTaxonomySynonyms"]         <- TRUE
  options["showVisualizationsLegend"]     <- TRUE
  options["visualizationsLegendOrientation"]   <- 'vertical'
  options["visualizationsLegendXpos"]     <- 160
  options["visualizationsLegendYpos"]     <- 30

  options
}

get_default_settings <- function() {
  settings["border"]                        <- '1px solid #909090'
  settings["controls0Top"]                  <- 10
  settings["controlsBackgroundColor"]       <- '#e0e0e0'
  settings["controlsFont"]                  <- 'Arial'
  settings["controlsFontColor"]             <- '#505050'
  settings["controlsFontSize"]              <- 8
  settings["enableDownloads"]               <- TRUE
  settings["enableBranchVisualizations"]    <- FALSE
  settings["enableCollapseByBranchLengths"] <- FALSE
  settings["enableCollapseByFeature"]       <- TRUE
  settings["enableNodeVisualizations"]      <- TRUE
  settings["nhExportWriteConfidences"]      <- TRUE
  settings["reCenterAfterCollapse"]         <- FALSE
  settings["rootOffset"]                    <- 140

  settings
}
