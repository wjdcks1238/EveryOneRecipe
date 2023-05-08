// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';
var viewChart1 = null;
var ctx = document.getElementById("myPieChart");
var cdata = [];
var clabel = [];

function searchdata() {
	fn_data1();
}

function fn_data1(){
	cdata=[];
	clabel=[];
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
			for(i=0;i<data.length;i++) {
				cdata.push(data[i].CNT);
				clabel.push(data[i].KEWORD);
			}
			
			console.log(cdata);
			console.log(clabel);
		}
	});
	
	
	if(viewChart1 != null) {
		$('#myPieChart').remove();
		$('#div_ChartArea').append('<canvas id="myPieChart"></canvas>');
			ctx = document.getElementById("myPieChart");
			fn_draw_data1();
	} else {
		fn_draw_data1();
	}
}


// Pie Chart Example

function fn_draw_data1() { 
 viewChart1 = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: clabel,
    datasets: [{
      data: cdata,
      backgroundColor: ['#0D47A1', '#1E88E5', '#42A5F5', '#64B5F6', '#90CAF9', '#BBDEFB', '#E3F2FD', '#B3E5FC', '#81D4FA', '#4FC3F7'],
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
      display: true
    },
    cutoutPercentage: 80,
  },
});
}
