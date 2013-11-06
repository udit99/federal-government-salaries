var GovSalaries = GovSalaries || {}
GovSalaries.showSalaryHighCharts = function(data){
    $('#all-salaries-container').highcharts({
          chart: {
              type: 'column'
          },
          credits:{
            text: 'Enigma.io',
            href: 'https://twitter.com/enigma_io/status/385166410063691776'
          },
          title: {
              text: ''
          },
          xAxis: {
              categories: [
                  '0',
                  '10',
                  '20',
                  '30',
                  '40',
                  '50',
                  '60',
                  '70',
                  '80',
                  '90',
                  '100',
                  '110',
                  '120',
                  '130',
                  '140',
                  '150',
                  '160',
                  '170',
                  '180',
                  '190',
                  '200',
                  '210',
                  '220',
                  '230',
                  '240',
                  '250',
                  '260',
                  '270',
                  '280',
                  '290',
                  '300',
                  '310',
                  '320',
                  '330',
                  '340',
                  '350',
                  '360',
                  '370',
                  '380',
                  '390',
                  '400'
              ]
          },
          yAxis: {
              min: 0,
              title: {
                  text: 'Number of Jobs'
              }
          },
          tooltip: {
              headerFormat: '<span style="font-size:10px">${point.key}K</span><table>',
              pointFormat: '<tr><td style="padding:0"><b>{point.y} jobs</b></td></tr>',
              footerFormat: '</table>',
              shared: true,
              useHTML: true
          },
          plotOptions: {
              column: {
                  pointPadding: 0.2,
                  borderWidth: 0
              }
          },
          series: [{
              name: 'Salaries in Thousands of Dollars<br><h3>Rounded to nearest 10K</h3>',
              data: data
  
          }]
      });
}
GovSalaries.showMedianSalaryHighCharts = function(data, categories){
    $('#median-salaries-container').highcharts({
          chart: {
              type: 'column'
          },
          credits:{
            text: 'Enigma.io',
            href: 'https://twitter.com/enigma_io/status/385166410063691776'
          },
          title: {
              text: ''
          },
          xAxis: {
              labels: {
                enabled: false
              },
              categories: categories
          },
          yAxis: {
              min: 0,
              title: {
                  text: 'Salary in $'
              }
          },
          tooltip: {
              headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
              pointFormat: '<tr><td style="padding:0"><b>${point.y} </b></td></tr>',
              footerFormat: '</table>',
              shared: true,
              useHTML: true
          },
          plotOptions: {
              column: {
                  pointPadding: 0.2,
                  borderWidth: 0
              }
          },
          series: [{
              name: 'Median Salaries by Job Title',
              data: data
  
          }]
      });
}
GovSalaries.showAgencyMedianSalaryHighCharts = function(data, categories){
    $('#agency-median-salaries-container').highcharts({
          chart: {
              type: 'column'
          },
          credits:{
            text: 'Enigma.io',
            href: 'https://twitter.com/enigma_io/status/385166410063691776'
          },
          title: {
              text: ''
          },
          xAxis: {
              labels: {
                enabled: false
              },
              categories: categories
          },
          yAxis: {
              min: 0,
              title: {
                  text: 'Salary in $'
              }
          },
          tooltip: {
              headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
              pointFormat: '<tr><td style="padding:0"><b>${point.y} </b></td></tr>',
              footerFormat: '</table>',
              shared: true,
              useHTML: true
          },
          plotOptions: {
              column: {
                  pointPadding: 0.2,
                  borderWidth: 0
              }
          },
          series: [{
              name: 'Median Salaries by Agency',
              data: data
  
          }]
      });
}
GovSalaries.getSalaryData = function(data){
  var path = '/salaries'
  var url = data ? (path + "?" + data) : path

  GovSalaries.showThrobber();
  $.get(url, function(data){
    GovSalaries.hideThrobber();
    GovSalaries.showSalaryHighCharts(data);
  })
};
GovSalaries.getMedianSalaryData = function(data){
  var path = '/median_salaries'

  $.getJSON(path, function(median_salaries){
    var categories = _.map(median_salaries, function(salary){return salary.job_title});
    var data = _.map(median_salaries, function(salary){return salary.salary})
    GovSalaries.showMedianSalaryHighCharts(data, categories);
  })
};
GovSalaries.getAgencyMedianSalaryData = function(data){
  var path = '/agency_median_salaries'

  $.getJSON(path, function(median_salaries){
    var categories = _.map(median_salaries, function(salary){return salary.agency});
    var data = _.map(median_salaries, function(salary){return salary.median_salary})
    GovSalaries.showAgencyMedianSalaryHighCharts(data, categories);
  })
};
GovSalaries.submitSalaryDataForm = function(){
  $(".search-form select").change(function(){
    var data = $(".search-form").serialize();
    GovSalaries.getSalaryData(data);
  })
}
GovSalaries.toggleTopTenSalariesAndBonii = function(){
  //Coz Bonii are way cooler than Bonuses
  $("a.top_ten_salary_bonus_toggle").click(function(e){
    $("#top_ten_salaries").toggle();
    $("#top_ten_bonuses").toggle();
    $(".salary_bonus_toggle").toggleClass("active")
    e.preventDefault();
  });
}
GovSalaries.showThrobber = function(){
  $("#throbber").removeClass("transparent");
}
GovSalaries.hideThrobber = function(){
  $("#throbber").addClass("transparent");
}
var ready = function(){
  if($("body.home").length > 0){
    GovSalaries.getSalaryData();
    GovSalaries.submitSalaryDataForm();
  } else if ($("body.median_salaries").length > 0) {
    GovSalaries.getMedianSalaryData();
  } else if ($("body.agency_median_salaries").length > 0) {
    GovSalaries.getAgencyMedianSalaryData();
  } else if ($("body.top_ten").length > 0) {
    GovSalaries.toggleTopTenSalariesAndBonii();
  } else if ($("body.salary_charts").length > 0) {
    console.log("got in body salary charts");
    var data = document.URL.split('?')[1];
    console.log("split data", data);
    data ? GovSalaries.getSalaryData(data) : GovSalaries.getSalaryData();
    console.log("post");
  }
};
$(document).ready(ready);
$(document).on('page:load', ready);
