// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

var dashLabel=[];
var dashData=[];

$.ajax({
	url: '/everyrecipe/admin/dashboardchartajax',
	type: "GET",
	dataType: "json",
	success: function(data) {
		console.log(data);
		for(i=0;i<data.length;i++) {
			dashLabel.push(data[i].KEWORD);
			dashData.push(data[i].CNT);
			
			console.log(dashLabel);
			console.log(dashData);
		}
	}
});


// Pie Chart Example
function getChart(){
	var ctx = document.getElementById("dashboardPie");
	var dashboardPie = new Chart(ctx, {
		type: 'doughnut',
		data: {
			labels: dashLabel,
			datasets: [{
				data: dashData,
				backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc'],
				hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
				hoverBorderColor: "rgba(234, 236, 244, 1)",
			}],
		},
		options: {
			maintainAspectRatio: false,
			tooltips: {
				backgroundColor: "rgb(255,255,255)",
				bodyFontColor: "#858796",
				borderColor: '#dddfeb',
				borderWidth: 1,
				xPadding: 15,
				yPadding: 15,
				displayColors: false,
				caretPadding: 10,
			},
			legend: {
				display: false
			},
			cutoutPercentage: 80,
		},
	});
}
