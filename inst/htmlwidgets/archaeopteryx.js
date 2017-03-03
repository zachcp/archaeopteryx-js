var tre, prms;

HTMLWidgets.widget({

  name: 'archaeopteryx',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {
        prms = x;
        var options = x.options;
        var settings = x.settings;
        settings["displayHeight"] <- x.height
        settings["displayWidth "] <- x.width


        // what is this decorator doing?
        var decorator = 'ref:';

        var nodeVisualizations = x.nodevisualizations;

        tree = archaeopteryx.parsePhyloXML(x.treestring);
        tre  = tree;
        archaeopteryx.launch(el, tree, options=options, settings=settings, nodeVisualizations=nodeVisualizations);

        // begin with the tree ordered
        orderButtonPressed()
      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
