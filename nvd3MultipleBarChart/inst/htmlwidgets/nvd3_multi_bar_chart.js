HTMLWidgets.widget({

  name: 'nvd3_multi_bar_chart',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {
  
          var chart;
          
          var nvd3_container = d3.select('#' + el.id)
              .append('svg')
              .attr('class', 'nvd3-svg');
              
          var data = x.data;
          
          nv.addGraph(function() {
            
              chart = nv.models.multiBarChart()
                  // .color(d3.scale.category20().range())
                  .duration(300)
                  .margin({bottom: 100, left: 70})
                  .rotateLabels(45)
                  .groupSpacing(0.1);
              
              chart.reduceXTicks(false).staggerLabels(true);
              
              chart.xAxis
                  .axisLabel(x.label.x)
                  .axisLabelDistance(35)
                  .showMaxMin(false);
                  // .tickFormat(d3.format(',.6f'));
              
              chart.yAxis
                  .axisLabel(x.label.y)
                  .axisLabelDistance(-5)
                  .tickFormat(d3.format(',.01f'));
              
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
