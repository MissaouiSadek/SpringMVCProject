<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="../js/angular.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/angular-animate.min.js"></script>
<link rel="stylesheet" href="../css/style.css"></link>
<link rel="stylesheet" href="../css/bootstrap.min.css"></link>
<script type="../js/jquery-3.3.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Test</title>
<script>
angular.module('app', ['ngAnimate']);
angular.module('myApp', []).controller('namesCtrl', function($scope) {
    $scope.names = [
        'Jani',
        'Carl',
        'Margareth',
        'Hege',
        'Joe',
        'Gustav',
        'Birgit',
        'Mary',
        'Kai'
    ];
});
</script>
</head>
<body>
	<div ng-app>
		<nav class="navbar navbar-expand-lg navbar-dark bg-info navbar-expand-sm" ng-click="$event.preventDefault()">
			<a href="" class="home nav-link text-light" ng-click="active='home'">Home</a>
			<a href="" class="about nav-link text-light" ng-click="active='about'">About</a>
			<a href="" class="contact nav-link text-light" ng-click="active='contact'">Contact</a>
		</nav>
		<p ng-show="active">Vous avez choisi <b>{{active}}</b></p>
		<div ng-show="active=='home'" ng-include = "'home.jsp'"></div>
		<div ng-show="active=='about'" ng-include = "'about.jsp'"></div>
		<div ng-show="active=='contact'" ng-include = "'contact.jsp'"></div>
	</div>
	</body>
</html>