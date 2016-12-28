<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>::- Organization Site-Admin Setup -::</title>
<%@ include file="/jsp/common/common.jsp"%>
</head>
<style>
#popup_size{
    padding-right: 10px;
    padding-bottom: 20px;
    padding-left: 15px;
    margin-left: 38%;
    width: 25%;
    background: #FFF;
    display: inline-block;
    position: absolute;
    border: 2px solid #8E8E8E;
    }
</style>
<script>
	/* function for adding new row in the table */
	function add() {
		var $body = $('body');
		$(".addExpenseType").css("display", "block");
	}
	/*function for adding new expense type to that data base*/
	function addExpenseType() {
		var expenseType = $('#expenseType1').val();
		if(document.getElementById('checkBoxFlag').checked){
			
			expenseFlag=document.getElementById('checkBoxFlag').value ='Y';
        }
        else{
        	
        	expenseFlag=document.getElementById('checkBoxFlag').value ='N';
       }
		if(document.getElementById('checkBoxActive').checked){
			
			active=document.getElementById('checkBoxActive').value ='Y';
        }
        else{
        
        	active=document.getElementById('checkBoxActive').value ='N';
       }
		
		if (expenseType == null || expenseType.length < 1) {
			alert("expenseType should not be null");
		} else {
			$.ajax({
				url : "/ezXpense/siteadmin/addexpensetype.do",
				type : 'POST',
				data : {
					expenseType : expenseType,
					expenseFlag : expenseFlag,
					active : active,
				},
				success : function(data) {

					if (data == "success") {
						alert("Ezxpense Type added Successfully ");
					} else {
						alert(data);
					}
				},
			});
		}
	}
	/*function for getting types data and displying in update popup page*/
	function div_update(expenseType,checkBoxFlag,checkBoxActive) {
	$('#expenseType').val(expenseType);
	$('#update').fadeIn(500).css('display','block');
	if(checkBoxFlag == 'Y'){
		
		document.getElementById('checkMilageFlag').checked=true;
    }else{
    	
    	document.getElementById('checkMilageFlag').checked=false;
   		}
	if(checkBoxActive == 'Y'){
		
		document.getElementById('checkActiveFlag').checked=true;
    }else{
    	
    	document.getElementById('checkActiveFlag').checked=false;
    	}
	}
	/*function for updating existing expense type and passing to the controller*/
	function update() {
		alert("inside upadate");
		if(document.getElementById('checkBoxFlag').checked){
			expenseFlag=document.getElementById('checkBoxFlag').value ='Y';
        }
        else{
        	expenseFlag=document.getElementById('checkBoxFlag').value ='N';
       }
		if(document.getElementById('checkBoxActive').checked){
			active=document.getElementById('checkBoxActive').value ='Y';
        }
        else{
        	active=document.getElementById('checkBoxActive').value ='N';
       }
		alert("type" + expenseType);
		$('#update').fadeIn(500).css('display','block');
		if (expenseType == null || expenseType.length < 1) {
			
			alert("expenseType should not be null");
			
		} else {
			$.ajax({
				url : "/ezXpense/siteadmin/updateexpensetype.do",
				type : 'POST',
				data : {
					expenseType : expenseType,
					expenseFlag : expenseFlag,
					active : active,
				},
				success : function(data) {

					if (data == "success") {
						alert("Ezxpense Type Updated Successfully ");
					} else {
						alert(data);
					}
				},
			});
		}
		}
	function div_hidden() {
		 var $body=$('body');
		  $("#update").fadeOut(500);
		  $body.removeClass('loading');
	}
</script>
<body class="full-layout  nav-right-hide nav-right-start-hide  nav-top-fixed responsive clearfix"data-active="dashboard " data-smooth-scrolling="1">
	
	<div class="vd_body">
		<!-- Header Start -->
		<%@ include file="/jsp/common/header.jsp"%>
		<!-- Header Ends -->
		<div class="content">
			<div class="container">
				<div
					class="vd_navbar vd_nav-width vd_navbar-tabs-menu vd_navbar-left">
					<div class="navbar-menu clearfix">
						<div class="vd_menu">
							<nav class="navbar navbar-default" role="navigation">
								<!-- Main Menu -->
								<div class="side-menu-container vd_menu">
									<ul class="nav navbar-nav">
										<%@ include file="/jsp/common/leftContentFile.jsp"%>
									</ul>
								</div>
							</nav>
						</div>
					</div>
				</div>
				<div class="vd_content-wrapper">
					<div class="vd_container">

						<div class="panel panel-default">
							<div class="panel-heading">
								Expense Type <a href="#" onclick="add()" class="add_row"style="float: right"><i class="fa fa-plus"aria-hidden="true"></i></a>
							</div>
							<div class="panel-body mn_panel_org">
								<table class="responstable">
									<tr>
										<th>Expense Type</th>
										<th>Mileage Flag</th>
										<th>Active Flag</th>
										<th>Status</th>
									</tr>
									<tr>
									<td>
											<div class="addExpenseType" id="addExpenseType"	style="display: none;">
												<div class="org_in">
													<input type="text" id="expenseType1"	placeholder="expenseType" name="expenseType"class="mn_organi mn_ma_0" />	
												</div>
											</div>
										</td>
										<td>
										<div class="addExpenseType" id="addExpenseType"style="display: none;">
												<div class="org_in">
													<input type="checkbox" class="checkBoxClass" id="checkBoxFlag" name="flags">
												</div>
										</div>
										</td>
										<td>
										<div class="addExpenseType" id="addExpenseType"style="display: none;">
												<div class="org_in">
													<input type="checkbox" class="checkBoxClass" id="checkBoxActive" name="active">
												</div>
										</div>
										</td>
										<td>
										<div class="addExpenseType" id="addExpenseType"	style="display: none;">
												<div class="org_in">
													<button class="org_submit" type="submit"onclick="addExpenseType()">
														<i class="fa fa-floppy-o"></i> Save
													</button>
												</div>
										</div>
										</td>
									</tr>
									
									<c:forEach var="expenseTypeDto" items="${expenseTypeDto}">
									<tr>
										<td>${expenseTypeDto.expenseType}</td>										
										<td>
										<c:choose >
										<c:when test="${expenseTypeDto.mileage_flag eq 'Y'}">
										<input type="checkbox" class="checkBoxClass" id="checkBoxFlag2" name="flag" value="1" checked disabled readonly/>								
										</c:when>
										<c:otherwise>
										<input type="checkbox" class="checkBoxClass" id="checkBoxFlag2" name="flag" value="0" readonly/>
										</c:otherwise>
										</c:choose>
										</td>
										<td>
										<c:choose >
										<c:when test="${expenseTypeDto.active_flag eq 'Y'}">
										<input type="checkbox" class="checkBoxClass"id="checkBoxActive2" name="active" value="1" checked disabled readonly/>
										</c:when>
										<c:otherwise>
										<input type="checkbox" class="checkBoxClass"id="checkBoxActive2" name="active" value="0" readonly/>
										</c:otherwise>
										</c:choose>
										</td>
										<td><a onclick="div_update('${expenseTypeDto.expenseType}','${expenseTypeDto.mileage_flag}','${expenseTypeDto.active_flag}')" class="btn btn-success btn-xs has-tooltip" ><span class="loadr" ></span> <i class="fa fa-pencil-square-o"></i>
										</a> <a href="${pageContext.request.contextPath}/siteadmin/deleteexpensetype.do" class="btn btn-danger btn-xs has-tooltip"><span	class="loadr"></span> <i class="fa fa-trash-o" ></i> </a>
										</td>
										
											<!-- /****************************popup for update data*****************************************************/ -->
											<div class="cover"></div>
											<div id="update"style="display: none; float: left;">
												<div id="update_popup${expenseTypeDto.expenseType}${flag}${checkBoxActive}" >
													<div id="popup_size">
														<h3>ExpenseType Update
														<a href="#" id="close_popup" onclick="div_hidden();"style="background: #ffffff;color: #000000;position: absolute;top: 0px;right: 0px;"><i class="fa fa-times-circle fa-lg" aria-hidden="true" ></i></a>
														</h3>											
														<div class="clearfix"></div>
														<label>Expense_Type :</label> <input id="expenseType"name="expenseType" placeholder="ExpenseType" type="text"  style="font-weight: 800;">
														<div class="clearfix"></div>
														<label>Milage_Flag :</label><input type="checkbox"class="checkBoxClass" id="checkMilageFlag" name="flags" style="margin-left: 16px;">
														<div class="clearfix"></div>
														<label>Active_flag :</label><input type="checkbox"class="checkBoxClass" id="checkActiveFlag" name="active" style="margin-left: 20px;">
														<div class="org_in">
															<button class="org_submit" type="submit"onclick="update()"style="margin-left: 75px;">
																<i class="fa fa-floppy-o"></i> Update
															</button>
														</div>

													</div>
												</div>
											</div>
										</tr>					
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Footer Start -->
		<%@ include file="/jsp/common/footer.jsp"%>
		<a id="back-top" href="#" data-action="backtop"	class="vd_back-top visible">
			<i class="fa  fa-angle-up"></i>
		</a>
		<!-- Footer END -->
	</div>
	<div id="updates"style="display: none; float: left;">
												
														<h3>ExpenseType Update
														<a href="#" id="close_popup" onclick="div_hidden();"style="background: #ffffff;color: #000000;position: absolute;top: 0px;right: 0px;"><i class="fa fa-times-circle fa-lg" aria-hidden="true" ></i></a>
														</h3>											
												
											</div>
</body>
</html>