 google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawStuff);


      function drawStuff() {
        var data = new google.visualization.arrayToDataTable([
          ['품목', '진도율'],
          ["A", b/a*100],
          ["B", 31],
          ["C", 12],
          ["D", 10],
          ['E', 100]
        ]);

        var options = {
          title: '납기 진도율',
          width: 800,
          legend: { position: 'none' },
          chart: { title: '납기 진도율'},
          bars: 'horizontal', // Required for Material Bar Charts.
          axes: {
            x: {
              0: { side: 'bottom', label: '진도율'} // Top x-axis.
            }
          },
          bar: { groupWidth: "90%" }
        };

        var chart = new google.charts.Bar(document.getElementById('chart2_div'));
        chart.draw(data, options);
      };