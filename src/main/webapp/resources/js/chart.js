google.charts.load('current', {
  packages: ['corechart', 'bar']
});
google.charts.setOnLoadCallback(drawMultSeries);

function drawMultSeries() {
  var data = google.visualization.arrayToDataTable([
    ['품목', '진행 수량', '남은 수량'],
    ['A', 1000, 500],
    ['B', 1500, 800],
    ['C', 2000, 1700],
    ['D', 2500, 2000],
    ['E', 3000, 3000]
  ]);

  var options = {
    isStacked: 'percent',
    title: '납기 진도율',
    chartArea: {
      width: '50%'
    },
    hAxis: {
      title: '진행율',
      minValue: 0
    },
    vAxis: {
      title: '품목'
    }
  };

  var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
  chart.draw(data, options);
}