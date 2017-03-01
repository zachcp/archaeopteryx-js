#' set_archaeopteryx_settings
#'
#'
#' @param arch Required. An archaeopteryx htmlwidget
#' @export
#'
set_archaeopteryx_settings <- function(
  arch,
  border = NULL,
  controls0Top = NULL,
  controlsBackgroundColor  = NULL,
  controlsFont = NULL,
  controlsFontColor = NULL,
  controlsFontSize = NULL,
  enableDownloads = NULL,
  enableBranchVisualizations = NULL,
  enableCollapseByBranchLenghts = NULL,
  enableCollapseByFeature = NULL,
  enableNodeVisualizations = NULL,
  nhExportWriteConfidences = NULL,
  reCenterAfterCollapse = NULL,
  rootOffset = NULL) {

  if (!is.null(border)) arch$x$settings['border'] <- border
  if (!is.null(controls0Top)) arch$x$settings['controls0Top'] <- controls0Top
  if (!is.null(controlsBackgroundColor)) arch$x$settings['controlsBackgroundColor'] <- controlsBackgroundColor
  if (!is.null(controlsFont)) arch$x$settings['controlsFont'] <- controlsFont
  if (!is.null(controlsFontColor)) arch$x$settings['controlsFontColor'] <- controlsFontColor
  if (!is.null(controlsFontSize)) arch$x$settings['controlsFontSize'] <- controlsFontSize
  if (!is.null(enableDownloads)) arch$x$settings['enableDownloads'] <- enableDownloads
  if (!is.null(enableBranchVisualizations)) arch$x$settings['enableBranchVisualizations'] <- enableBranchVisualizations
  if (!is.null(enableCollapseByBranchLenghts)) arch$x$settings['enableCollapseByBranchLenghts'] <- enableCollapseByBranchLenghts
  if (!is.null(enableCollapseByFeature)) arch$x$settings['enableCollapseByFeature'] <- enableCollapseByFeature
  if (!is.null(enableNodeVisualizations)) arch$x$settings['enableNodeVisualizations'] <- enableNodeVisualizations
  if (!is.null(nhExportWriteConfidences)) arch$x$settings['nhExportWriteConfidences'] <- nhExportWriteConfidences
  if (!is.null(reCenterAfterCollapse)) arch$x$settings['reCenterAfterCollapse'] <- reCenterAfterCollapse
  if (!is.null(rootOffset)) arch$x$settings['rootOffset'] <- rootOffset

  arch
}
