<%def name="draw_chart(chart_type, data, div_name, width, height, theme)">
    <script>
    require(["dojox/charting/Chart", "dojox/charting/themes/${theme}", "dojox/charting/plot2d/${chart_type}", "dojox/charting/plot2d/Markers",
             "dojox/charting/widget/Legend", "dojox/charting/action2d/Tooltip", "dojox/charting/action2d/Magnify",
             "dojox/charting/axis2d/Default","dojo/domReady!"], function(Chart, theme, ${chart_type}Plot, Legend, Tooltip, Magnify) {
        // When the DOM is ready and resources are loaded...
     
        // Define the data
        <%
        labels, data = zip(*data)
        %>
        
        
        var chart_data = [
        %for i in data:
            ${i}, \
        %endfor
        ];
        
        var labels = [
        %for i in labels:
            {value: ${loop.index+1}, text: "${i}"}, \
        %endfor
        ];
     
        // Create the chart within it's "holding" node
        var chart = new Chart("${div_name}");
     
        // Set the theme
        chart.setTheme(theme);
     
        // Add the only/default plot
        chart.addPlot("default", {
            type: "${chart_type}",
            %if chart_type in ('Bars', 'Columns'):
            gap: 5,
            %endif
            markers: true
        });
     
        // Add axes
        %if 'Bars' == chart_type:
        chart.addAxis("x", { labels: labels, vertical: true, natural: true});
        chart.addAxis("y", { fixLower: "minor", fixUpper: "minor", natural: true, includeZero: true});
        %else:
        chart.addAxis("x", { rotation: -30, labels: labels, natural: true});
        chart.addAxis("y", { includeZero: true, min: 0, vertical: true, fixLower: "major", fixUpper: "major" });
        %endif

        // Add the series of data
        chart.addSeries("Data Series", chart_data);
     
        // Render the chart!
        chart.render();
     
    });
     
    </script>
    <div id="${div_name}" style="width:${width}; height:${height};"></div>
</%def>

<%def name="line_chart(data=[], div_name='chart_div', width=400, height=200, theme='Julie')">
    ${draw_chart('Lines', data, div_name, width, height, theme)}
</%def>

<%def name="bar_chart(data=[], div_name='chart_div', width=400, height=200, theme='Julie')">
    ${draw_chart('Bars', data, div_name, width, height, theme)}
</%def>
    
<%def name="column_chart(data=[], div_name='chart_div', width=400, height=200, theme='Julie')">
    ${draw_chart('Columns', data, div_name, width, height, theme)}
</%def>

<%def name="pie_chart(data=[], div_name='chart_div', width=400, height=200, theme='Julie')">
    ${draw_chart('Pie', data, div_name, width, height, theme)}
</%def>