// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';
function searchdata() {
	var option = $("[name=inlineRadioOptions]").val();
	var curr = $("[id=currentdate]").val();
	
	console.log(curr);
	console.log(option);
	
	$.ajax({
		url:'/everyrecipe/admin/search/ajaxdataprogress',
		type: "GET",
		data:{
			option: option,
			curr: curr
		},
		dataType: "json",
		async: false,
		success: function(data) {
			console.log(data);
			var cdata = [];
			var clabel = [];
			
			for(i=0;i<data.length;i++) {
				cdata.push(data[i].CNT);
				clabel.push(data[i].KEWORD);
			}
			
			console.log(cdata);
			console.log(clabel);
			
			myPieChart(cdata, clabel);
		}
	});
}


// Pie Chart Example
var ctx = document.getElementById("myPieChart");
function myPieChart(cdata, clabel) { new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: clabel,
    datasets: [{
      data: cdata,
      backgroundColor: ['#01579B', '#0277BD', '#0288D1', '#039BE5', '#03A9F4',
    	  '#29B6F6', '#4FC3F7', '#81D4FA', '#B3Е5FC', '#E1F5FE'],
      hoverBackgroundColor: [],
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
