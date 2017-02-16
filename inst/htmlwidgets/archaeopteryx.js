var tre;

HTMLWidgets.widget({

  name: 'archaeopteryx',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {


        //var CONTROLS_0 = x.CONTROLS_0;
        //var CONTROLS_1 = x.CONTROLS_1;


        var options = {};
        options.alignPhylogram = true;
        options.backgroundColorDefault = '#ffffff';
        options.branchColorDefault = '#909090';
        options.branchDataFontSize = 6;
        options.branchWidthDefault = 1;
        options.collapasedLabelLength = 7;
        options.defaultFont = 'Arial';
        options.dynahide = true;
        options.externalNodeFontSize = 8;
        options.found0and1ColorDefault = '#0000ff';
        options.found0ColorDefault = '#00ff00';
        options.found1ColorDefault = '#ff0000';
        options.internalNodeFontSize = 6;
        options.labelColorDefault = '#202020';
        options.minBranchLengthValueToShow = 0.01;
        options.minConfidenceValueToShow = 0.5;
        options.nameForNhDownload = 'archaeopteryx-js.nh';
        options.nameForPhyloXmlDownload = 'archaeopteryx-js.xml';
        options.nameForPngDownload = 'archaeopteryx-js.png';
        options.nameForSvgDownload = 'archaeopteryx-js.svg';
        options.nodeSizeDefault = 3;
        options.phylogram = false;
        options.searchIsCaseSensitive = false;
        options.searchIsPartial = true;
        options.searchUsesRegex = false;
        options.showBranchEvents = true;
        options.showBranchLengthValues = false;
        options.showConfidenceValues = true;
        options.showDisributions = false;
        options.showExternalLabels = true;
        options.showExternalNodes = false;
        options.showInternalLabels = true;
        options.showInternalNodes = false;
        options.showNodeEvents = true;
        options.showNodeName = false;
        options.showSequence = false;
        options.showSequenceAccession = true;
        options.showSequenceGeneSymbol = true;
        options.showSequenceName = true;
        options.showSequenceSymbol = true;
        options.showTaxonomy = true;
        options.showTaxonomyCode = false;
        options.showTaxonomyCommonName = true;
        options.showTaxonomyRank = false;
        options.showTaxonomyScientificName = true;
        options.showTaxonomySynonyms = false;

        var settings = {};
        settings.border = '1px solid #909090';
        settings.controls0Top = 10;
        settings.controlsBackgroundColor = '#e0e0e0';
        settings.controlsFont = 'Arial';
        settings.controlsFontColor = '#505050';
        settings.controlsFontSize = 8;
        settings.displayHeight = height;
        settings.displayWidth = width;
        settings.enableDownloads = true;
        settings.enableBranchVisualizations = false;
        settings.enableCollapseByBranchLenghts = false;
        settings.enableCollapseByFeature = true;
        settings.enableNodeVisualizations = false;
        settings.nhExportWriteConfidences = true;
        settings.reCenterAfterCollapse = false;
        settings.rootOffset = 140;

        //tree = archaeopteryx.parseNewHampshire(x.treestring);
        tree = archaeopteryx.parsePhyloXML(x.treestring);
        tre  = tree;
        archaeopteryx.launch(el, tree, options={}, settings={});

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
