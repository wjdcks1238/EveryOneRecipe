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
		if(data != 0){
			for(i=0;i<data.length;i++) {
				dashLabel.push(data[i].KEWORD);
				dashData.push(data[i].CNT);
			}
			console.log(dashLabel);
			console.log(dashData);
			getChart();
		} else {
			displayData();
		}
	}
});

function displayData() {
	document.getElementById("div_dashPie");
	$('#dashboardPie').remove();
	$('#div_dashPie').append('<h5>현재 1시간 이내에 실시간 검색 데이터가 없습니다.</h5>');
}


// Pie Chart Example
function getChart(){
	var ctx = document.getElementById("dashboardPie");
	var dashboardPie = new Chart(ctx, {
		type: 'pie',
		data: {
			labels: dashLabel,
			datasets: [{
				data: dashData,
				backgroundColor: ['#0D47A1', '#1E88E5', '#42A5F5', '#64B5F6', '#90CAF9', '#BBDEFB', '#E3F2FD', '#B3E5FC', '#81D4FA', '#4FC3F7'],
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
				display: true
			},
			cutoutPercentage: 80,
		},
	});
}
