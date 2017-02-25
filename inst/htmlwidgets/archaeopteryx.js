var tre, prms;

HTMLWidgets.widget({

  name: 'archaeopteryx',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {
        prms = x;

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
        options.phylogram = true;
        options.searchIsCaseSensitive = false;
        options.searchIsPartial = true;
        options.searchUsesRegex = false;
        options.showBranchEvents = true;
        options.showBranchLengthValues = false;
        options.showConfidenceValues = true;
        options.showDisributions = false;
        options.showExternalLabels = true;
        options.showExternalNodes = false;
        options.showInternalLabels = false;
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
        options.showNodeName = true;
        options.showNodeVisualizations = true;

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
        settings.enableCollapseByBranchLengths = false;
        settings.enableCollapseByFeature = true;
        settings.enableNodeVisualizations = true;
        settings.nhExportWriteConfidences = true;
        settings.reCenterAfterCollapse = false;
        settings.rootOffset = 140;

        // what is this decorator doing?
        var decorator = 'ref:';

        var nodeVisualizations = x.nodevisualizations;





        //tree = archaeopteryx.parseNewHampshire(x.treestring);
        tree = archaeopteryx.parsePhyloXML(x.treestring);
        tre  = tree;
        archaeopteryx.launch(el, tree, options=options, settings=settings, nodeVisualizations=nodeVisualizations);

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
