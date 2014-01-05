<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Theater.aspx.cs" Inherits="TestReservation_Theater" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Theater</title>
    

<script  type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/jquery.countdown.css"> 
<script type="text/javascript" src="js/jquery.countdown-zh-TW.js"></script>
<script type="text/javascript" src="js/jquery.countdown.js"></script>

<style type="text/css">
#holder{	
 height:300px;	 
 width:330px;
 background-color:#F5F5F5;
 border:1px solid #A4A4A4;
 margin-left:10px;
 padding-left:25px;
}
	
#place {
 position:relative;
 margin:7px;
 width:330px;
 height:300px;
}
	 
#place a{
 font-size:0.6em;
}
	 
#place li
{
 list-style: none outside none;
 position: absolute;   
}    
     
#place li:hover
{
 background-color:yellow;      
} 
     
#place .seat{
 background:url("imgs/available_seat_img.gif") no-repeat scroll 0 0 transparent;
 height:20px;
 width:20px;
 display:block;	 
}
	 
.selectedSeat
{ 
 background-image:url("imgs/booked_seat_img.gif");      	 
}
      
.selectingSeat
{ 
  background-image:url("imgs/selected_seat_img.gif");      	 
}
      
#place.row-3, #place .row-4{
  margin-top:10px;
}

#seatDescription{
 padding:0px;
 float:left;
 width:200px;
}

#seatDescription li
{
 vertical-align:middle;	  
 list-style: none outside none;
 padding-left:35px;
 height:35px;
 float:left;
}

#seatDescription{
 padding:0px;
}

#seatDescription li{
  verticle-align:middle;	  
  list-style: none outside none;
  padding-left:35px;
  height:35px;
  float:left;
}

</style>
    
    

<script type="text/javascript">

$(function(){

    var settings = {
		rows: 5,
		cols: 15,
		rowCssPrefix: 'row-',
		colCssPrefix: 'col-',
		seatWidth: 20,
		seatHeight: 20,
		seatCss: 'seat',
		selectedSeatCss: 'selectedSeat',
		selectingSeatCss: 'selectingSeat'
	};
	
	$('.' + settings.seatCss).click(function () {
        
        if($(this).attr('class')==settings.seatCss){
            $(this).toggleClass(settings.selectingSeatCss);
        }else{
            $(this).toggleClass(settings.seatCss);
        }
		
	});
	
	$("#reservation").click(function(){
	
	    var col,row;
        var seatId;
        
	    $.each($('#place li.' + settings.selectingSeatCss),function (index, value){
	        
	        col = $(this).attr('col');
	        row = $(this).attr('row');
	        
	        $(this).addClass(settings.selectedSeatCss);
			$(this).removeClass(settings.selectingSeatCss);
			TakeReservation(seatId,col,row);
	    });
	   
	})
	
	function TakeReservation(seatId,col,row){
	    $.ajax({
            type:"GET",
            url: "Webservice/Reservation_do.ashx",
            data: { seatId: seatId, col: col,row:row }
        }).done(function(msg) {
            alert( "訂位: " + msg.Msg );
        });

	}

});
</script>

<script type="text/javascript">
$(function () {
	var austDay = new Date();
	austDay = new Date(austDay.getFullYear() + 1, 1 - 1, 26);
	//austDay = Date
	$('#defaultCountdown').countdown({until: +5,expiryUrl:'Expires.html'});
	$('#year').text(austDay.getFullYear());
});
</script>

</head>

  
  
<body>


<div id="container">


<div  id="holder" style="float:left">


<div id="place" style="float:left;">
<div><img src="imgs/screen.png"  style="width:280px"/></div>
<li id="11" row="1" col="1" class="seat" style='top:100px;left:0px;width:20px;height:20px;' ></li>
<li id="12" row="1" col="2" class="road" style='top:100px;left:33px;width:20px;height:20px;' ></li>
<li id="13" row="1" col="3" class="seat" style='top:100px;left:66px;width:20px;height:20px;' ></li>
<li id="14" row="1" col="4" class="seat" style='top:100px;left:99px;width:20px;height:20px;' ></li>
<li id="15" row="1" col="5" class="seat" style='top:100px;left:132px;width:20px;height:20px;' ></li>
<li id="16" row="1" col="6" class="road" style='top:100px;left:165px;width:20px;height:20px;' ></li>
<li id="17" row="1" col="7" class="seat" style='top:100px;left:198px;width:20px;height:20px;' ></li>
<li id="18" row="1" col="8" class="seat" style='top:100px;left:231px;width:20px;height:20px;' ></li>
<li id="19" row="1" col="9" class="seat" style='top:100px;left:264px;width:20px;height:20px;' ></li>

<li id="21" row="2" col="1" class="seat" style='top:150px;left:0px;width:20px;height:20px;' ></li>
<li id="22" row="2" col="2" class="road" style='top:150px;left:33px;width:20px;height:20px;' ></li>
<li id="23" row="2" col="3" class="seat" style='top:150px;left:66px;width:20px;height:20px;' ></li>
<li id="24" row="2" col="4" class="seat" style='top:150px;left:99px;width:20px;height:20px;' ></li>
<li id="25" row="2" col="5" class="seat" style='top:150px;left:132px;width:20px;height:20px;' ></li>
<li id="26" row="2" col="6" class="road" style='top:150px;left:165px;width:20px;height:20px;' ></li>
<li id="27" row="2" col="7" class="seat" style='top:150px;left:198px;width:20px;height:20px;' ></li>
<li id="28" row="2" col="8" class="seat" style='top:150px;left:231px;width:20px;height:20px;' ></li>
<li id="29" row="2" col="9" class="seat" style='top:150px;left:264px;width:20px;height:20px;' ></li>

<li id="31" row="3" col="1" class="seat" style='top:200px;left:0px;width:20px;height:20px;' ></li>
<li id="32" row="3" col="2" class="road" style='top:200px;left:33px;width:20px;height:20px;' ></li>
<li id="33" row="3" col="3" class="seat" style='top:200px;left:66px;width:20px;height:20px;' ></li>
<li id="34" row="3" col="4" class="seat" style='top:200px;left:99px;width:20px;height:20px;' ></li>
<li id="35" row="3" col="5" class="seat" style='top:200px;left:132px;width:20px;height:20px;' ></li>
<li id="36" row="3" col="6" class="road" style='top:200px;left:165px;width:20px;height:20px;' ></li>
<li id="37" row="3" col="7" class="seat" style='top:200px;left:198px;width:20px;height:20px;'></li>
<li id="38" row="3" col="8" class="seat" style='top:200px;left:231px;width:20px;height:20px;' ></li>
<li id="39" row="3" col="9" class="seat" style='top:200px;left:264px;width:20px;height:20px;' ></li>

</div>




<div style="width:300px;text-align:center;overflow:auto"> 
	<ul id="seatDescription">
    <li style="background:url('imgs/available_seat_img.gif') no-repeat scroll 0 0 transparent;">Available Seat</li>
    <li style="background:url('imgs/booked_seat_img.gif') no-repeat scroll 0 0 transparent;">Booked Seat</li>
    <li style="background:url('imgs/selected_seat_img.gif') no-repeat scroll 0 0 transparent;">Selected Seat</li>
	</ul>	  	<input type="button" id="reservation" 
	       name="reservation" value="訂位"
	       style="margin-top:15px"/>
      </div>


</div>

<div id="defaultCountdown" style="float:left;margin-left:20px;width:200px"></div>

</div>

</body>        
</html>
