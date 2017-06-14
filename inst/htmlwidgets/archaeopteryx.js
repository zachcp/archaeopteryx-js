var tre, prms;

HTMLWidgets.widget({

  name: 'archaeopteryx',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(params) {
        prms = params;
        var options = params.options;
        var settings = params.settings;
        settings.displayHeight = height
        settings.displayWidth  = width
        settings.controls0     = el.id + "-controls0"
        settings.controls1     = el.id + "-controls1"

        // what is this decorator doing?
        var decorator = 'ref:';

        var nodeVisualizations = params.nodevisualizations;

        tree = archaeopteryx.parsePhyloXML(params.treestring);
        tre  = tree;
        archaeopteryx.launch(el, tree, options=options, settings=settings, nodeVisualizations=nodeVisualizations);

         // activate the controls
        if (params.maincontrols == "visible") {
          maincontrols  = document.getElementById( el.id + "-controls0")
          maincontrols.style.visibility = "visible"
        }

        if (params.colorcontrols == "visible") {
          colorcontrols  = document.getElementById( el.id + "-controls1")
          colorcontrols.style.visibility = "visible"
        }


        // begin with the tree ordered
        // this is an internal function to archaeopteryx
        // orderButtonPressed()
      },

      drawExtras: function(params) {


      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
