<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 계보</title>
<%@ include file="../include/header.jsp" %>
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {packages:["orgchart"]});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Name(ID)');
        data.addColumn('string', 'Manager');
        data.addColumn('string', 'ID Tooltip');

        // For each orgchart box, provide the name, manager, and tooltip to show.
        data.addRows([
          //[{v:'BioAgency', f:'<div style="color:red; font-style:italic">BioAgency</div>'},'', 'BioAgency'],
           
           ${str}
          
          
        ]);

        //['Alice', 'BioAgency', ''],
        //['Bob', 'BioAgency', 'Bob Sponge'],
        //['Carol', 'Bob', '']
        
        // Create the chart.
        var chart = new google.visualization.OrgChart(document.getElementById('chart_div'));
        // Draw the chart, setting the allowHtml option to true for the tooltips.
        chart.draw(data, {allowHtml:true});
      }
   </script>
</head>

<body>

<%@ include file="../include/menu.jsp" %>

<div class="container-fluid text-center">    
  <div class="row content">
  
<%@ include file="../include/left.jsp" %>

    <div class="col-sm-8 text-left"> 
    <p>
<h1  style="text-align: center">
	<small>회원 전체 계보도</small>
</h1>				
</p>

    <div id="chart_div"></div>

			
	</div>
	
<%@ include file="../include/right.jsp" %>       
    
  </div>
</div>

<%@ include file="../include/footer.jsp" %>       

</body>
</html>