HTMLWidgets.widget({

  name: 'nvd3LineChart',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {

           var formatTime = d3.time.format("%Y-%m-%d");
           var data = x.data;
           data.forEach(function(d) { d.values.forEach(function(p) { p.x = formatTime.parse(p.x); }); });
           
           nv.addGraph(function() {

           var chart = nv.models.lineWithFocusChart();

           var nvd3_container = d3.select('#' + el.id)
            .append('svg')
            .attr('class', 'nvd3-svg');

           chart.brushExtent([1449464335860,1469464335860]);

           chart.xAxis.tickFormat(function(d) { return d3.time.format('%b %d')(new Date(d)); }).axisLabel("Date");
           chart.x2Axis.tickFormat(function(d) { return d3.time.format('%b %d')(new Date(d)); });

           chart.yTickFormat(d3.format(",.2f"));

           chart.useInteractiveGuideline(true);

           d3.select('#' + el.id + ' .nvd3-svg')
                .datum(data)
                .call(chart);

           nv.utils.windowResize(chart.update);

           return chart;

          });

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
