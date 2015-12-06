<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container-fluid">
		<div class="top headerLinks">
			<a href="#land">
				<img width="130" height="60" src="icon/icon.jpg">
				<sec:authorize access="hasRole('ROLE_ADMIN')">
				<h2>ADMIN PAGE</h2></sec:authorize>
			</a>
			<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')?false:true">
				<ul class="nav navbar-nav navbar-right col-md-2" >
			        <li style="float:right;">
	                  	<a href="#login_up">
	                  	 	<span class="glyphicon glyphicon-log-in" ></span> Sign in
	                  	</a> 
	                  	<!-- <span class="glyphicon glyphicon-log-in" data-toggle="modal" data-target="#login_up"></span> Sign in -->
	                  	
		        </li>
		    </ul>
		    </sec:authorize>
		</div>
	</div>
	<nav class="navbar navbar-default" data-spy="affix" data-offset-top="197">		
		<div class="container-fluid" ng-controller="MainController">
			<ul class="nav navbar-nav">
			    <li><a href="#land" class="nav-font">Home</a></li>
			    <li>
			    	<a href="#marketdata" class="nav-font">MarketData</a>
			    </li>
			   <!--  <li>
			    	<a href="#transaction" class="nav-font">Transaction</a>
			    </li> -->
			    <sec:authorize access="hasRole('ROLE_USER')">
                  <li>
                      <a class="nav-font" href="#portfolio">
                          <i class="icon_desktop"></i>
                          <span>My Portfolio</span>
                      </a>
                  </li>
                  <li>
                      <a class="nav-font" href="#history">
                          <i class="icon_document_alt"></i>
                          <span>History</span>
                      </a>
                  </li> 
                 </sec:authorize>
			</ul>
			<sec:authorize access="hasRole('ROLE_USER')">
			<ul class="nav navbar-nav pull-right">
					<li class="dropdown" ng-controller="headerCtrl">
                      <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                          <span class="profile-ava">
                              <img alt="" src="icon/user.png" width="30" height="30">
                          </span>
                          <span class="username">Hello, {{user.userName}}</span>
                          <b class="caret"></b>
                      </a>
                      <ul class="dropdown-menu extended logout">
                          <div class="log-arrow-up"></div>
                          <li class="prof-info-container">
                          	<div class="profile-ava prof-big"><img alt="" src="icon/user.png" width="50" height="50"></div>
                          	<div class="prof-info">
                          		<ul>
                          			<li>{{user.firstName}} {{user.lastName}}</li>
                          			<li>{{user.email}}
                          		</ul>                          	
                          	</div>
                          </li>
                          <li>
                          	<a href="<c:url value='/j_spring_security_logout'/>"><i class="icon_key_alt"></i>Logout</a>
                          </li>
                      </ul>
                  </li>
			</ul>
			</sec:authorize>
		</div>
	</nav>
	<div class="container"  ng-controller="stockController" id="main">
      <section id="main-content">
          <section class="wrapper">
			<div class="panel panel-default">
				<div>
					<h4>Pick up your stock</h4>
				</div>
				<div class="panel-head">
					<form class="form">
						<div class="form-group col-md-6">
							<label>Stock Symbol</label>
							<input class="form-control" type="text" ng-model="stock.symbol">
						</div>
					</form>
				</div>
				<div class="panel-body">
					<table class="table table-stripped">
						<tr>
							<th>
								<a href="" ng-click="order('symbol')">Stock Symbol</a>
								<span class="sortorder" ng-show="predicate === 'symbol'" ng-class="{reverse:reverse}"></span>
							</th>
							<th>
								<a href="" ng-click="order('name')">Stock Name</a>
								<span class="sortorder" ng-show="predicate === 'name'" ng-class="{reverse:reverse}"></span>
							</th>
							<th>
								<a href="" ng-click="order('price')">Price</a>
								<span class="sortorder" ng-show="predicate === 'price'" ng-class="{reverse:reverse}"></span>
							</th>
							<th>
								<a href="" ng-click="order('change')">Change</a>
								<span class="sortorder" ng-show="predicate === 'change'" ng-class="{reverse:reverse}"></span>
							</th>
							<th>
								<a href="" ng-click="order('pchange')">Change%</a>
								<span class="sortorder" ng-show="predicate === 'pchange'" ng-class="{reverse:reverse}"></span>					
							</th>
							<sec:authorize access="hasRole('ROLE_USER')">
								<th style="color:#007aff">Transaction</th>
							 </sec:authorize> 
						</tr>
						<tr ng-repeat="stock in stocksArray | orderBy:predicate:reverse | filter:stock.symbol">
							<td>{{stock.stock.symbol}}</td>
							<td>{{stock.name}}</td>
							<td>{{stock.price}}</td>
							<td>
								<b ng-if="stock.change>0" style="color:green">{{stock.change}}</b>
								<b ng-if="stock.change<0" style="color:red">{{stock.change}}</b>
								<b ng-if="stock.change==0" style="color:black">{{stock.change}}</b>
							</td>
							<td>
								<b ng-if="stock.pchange.indexOf('-')>-1" style="color:red">{{stock.pchange}}</b>
								<b ng-if="stock.pchange.indexOf('+')>-1" style="color:green">{{stock.pchange}}</b>
								<b ng-if="stock.pchange.indexOf('0')==0" style="color:black">{{stock.pchange}}</b>
							</td>
							 <sec:authorize access="hasRole('ROLE_USER')">
			                	<td>
			                  		<div class="btn-group">
			                      		<a class="btn btn-primary" href="#" ng-click="pass(stock); openBuy()">Buy</a>
			                      		<a ng-if="hasStock(stock)" class="btn btn-success" href="#" ng-click="pass(stock); openSell()" >Sell</a>
			                  		</div>
			                  </td>
			               </sec:authorize> 
						</tr>
					</table>
					 <!-- loading bar -->
									<!-- <div class = "loadbox" ng-hide="loading">
										<div class = "loadbar">
											<div class="progress progress-striped active progress-sm" >
										    	<div class="progress-bar progress-bar-success"  role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width:{{percent}}">
										        	<span class="sr-only">45% Complete</span>
										        </div>
								    		</div>
								     		<p>Loading...</p>
								    	</div>
								   </div> -->
				</div>
			</div>
		</section>
	</section>
</div>
<script src="js/app.js"></script>
	<script type="text/ng-template" id="buyContent.html">
        <div class="modal-header">
            <h3 class="modal-title">Buy stocks: {{buyItem.stockName}}</h3>
        </div>
        <div class="modal-body">
            <label>Stock Symbol: </label>
			<b style="color:red">{{buyItem.stock.symbol}}</b><br/>
			<label>Stock Name: </label>
			<b style="color:red">{{buyItem.stockName}}</b><br/>
			<label>Unit Price: </label>
			<b style="color:red">{{buyItem.price}}</b><br/>
			<label>Quantity: </label>
			<input type="number" min="1" max={{upper}} value={{quan}} ng-model="quan"/>
			<input type="range" min="1" max={{upper}} value={{quan}} ng-model="quan"/>
			<br/>	
        </div>				
        <div class="modal-footer">
		<div>		
			<label style="margin-right:50px">Ready to buy <span style="color:red">{{quan}}</span>
			shares of <span style="color:red">{{buyItem.stock.symbol}}</span>? 
			Balance after transaction: <span style="color:red">$
			{{Math.round(user.balance - buyItem.price * quan)}}</span> </label>
		</div><br/>
            <button class="btn btn-primary" type="button" ng-click="ok()">OK</button>
            <button class="btn btn-warning" type="button" ng-click="cancel()">Cancel</button>
        </div>
    </script>



</body>
</html>