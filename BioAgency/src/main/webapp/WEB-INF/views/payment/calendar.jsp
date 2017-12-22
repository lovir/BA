<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bio Agency 달력</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load("current", {packages:["calendar"]});
      google.charts.setOnLoadCallback(drawChart);

   function drawChart() {
       var dataTable = new google.visualization.DataTable();
       
       dataTable.addColumn({ type: 'date', id: 'Date' });
       dataTable.addColumn({ type: 'number', id: 'Payment' });         
       
        dataTable.addRows( 
			${str}               
		);                   
        
        /* dataTable.addRows([          
                           [ new Date(2017, 3, 13), 37032 ],
                           [ new Date(2017, 3, 14), 38024 ],
                           [ new Date(2017, 3, 15), 38024 ],
                           [ new Date(2017, 9, 30), 38447 ]
                           
                         ]);
 */
       var chart = new google.visualization.Calendar(document.getElementById('calendar_basic'));

       var options = {
         title: "B.A 달력",
         height: 350,
         calendar: { cellSize: 13 },
       };

       chart.draw(dataTable, options);
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
    
    <div id="calendar_basic" style="width: 100%; height: 350px;"></div>
    

	</div>
<%@ include file="../include/right.jsp" %>       
    
  </div>
</div>

<%@ include file="../include/footer.jsp" %>       

</body>
</html>