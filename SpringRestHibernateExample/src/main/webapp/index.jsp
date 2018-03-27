<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<script src="js/angular.min.js"></script>
	<script src="js/angular-animate.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="css/bootstrap.min.css"></link>
	<link rel="stylesheet" href="css/style.css"></link>
	<script type="js/jquery-3.3.1.min.js"></script>
	
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Index</title>
	<script type="text/javascript">
		var app = angular.module("ClientApp", []);
		app.controller("ClientController", function($scope, $http) {
			$scope.clients = [];
			$scope.clientForm = {
				id : 0,
				nom : "",
				prenom : "",
				email : "",
				dateDeNaissance : "",
				telephone : ""
			};
			$scope.reset = function(){
				_clearFormData()
			};
			_refreshClients();
			$scope.submitClient = function() {   
				var method = "";
				var url = "";
				if ($scope.clientForm.id == 0) {
				method = "POST";
				url = 'http://localhost:8080/SpringRestHibernateExample/rest/addClient';
				} else {
				method = "PUT";
				url = 'http://localhost:8080/SpringRestHibernateExample/rest/updateClient';
				}
     
                $http({
                    method : method,
                    url : url,
                    data : angular.toJson($scope.clientForm),
                    headers : {
                        'Content-Type' : 'application/json'
                    }
                }).then( _success, _error );
            };

            $scope.deleteClient = function(client) {
                $http({
                    method : 'DELETE',
                    url : 'http://localhost:8080/SpringRestHibernateExample/rest/deleteClient/' + client.id
                }).then(_success, _error);
            };
            
            $scope.editClient = function(client) {
				$scope.clientForm.id = client.id;
				$scope.clientForm.nom = client.nom;
				$scope.clientForm.prenom = client.prenom;
				$scope.clientForm.email = client.email;
				$scope.clientForm.dateDeNaissance = client.dateDeNaissance;
				$scope.clientForm.telephone = client.telephone;
            };

            function _refreshClients() {
                $http({
                    method : 'GET',
                    url : 'http://localhost:8080/SpringRestHibernateExample/rest/getAllClients'
                }).then(function successCallback(response) {
                    $scope.clients = response.data;
                }, function errorCallback(response) {
                    console.log(response.statusText);
                });
            }

            function _success(response) {
                _refreshClients();
                _clearFormData()
            }
     
            function _error(response) {
                console.log(response.statusText);
            }
     
            function _clearFormData() {
				$scope.clientForm.id = 0;
				$scope.clientForm.nom = "";
				$scope.clientForm.prenom = "";
				$scope.clientForm.email = "";
				$scope.clientForm.dateDeNaissance = "";
				$scope.clientForm.telephone = "";
            
            };
		});
		
	</script>

</head>
<body  ng-app="ClientApp">
<div ng-controller="ClientController">
	<h1>Clients</h1>
	<div class="table-responsive">
	<table class="table table-striped table-bordered">
		<tr>

			<th>ID</th>
			<th>Nom</th>
			<th>Prenom</th>
			<th>Email</th>
			<th>DateDeNaissance</th>
			<th>Telephone</th>
			<th>Options</th>
		</tr>

		<tr ng-repeat="client in clients">

			<td>{{ client.id }}</td>
			<td>{{ client.nom }}</td>
			<td>{{ client.prenom }}</td>
			<td>{{ client.email }}</td>
			<td>{{ client.dateDeNaissance }}</td>
			<td>{{ client.telephone }}</td>

			<td><button ng-click="editClient(client)" class="btn btn-success custom-width">Modifier</a> <button ng-click="deleteClient(client)" class="btn btn-danger custom-width">Supprimer</a></td>
		</tr>

	</table>
	</div>
	<br />
	<div class="formcontainer">
	<form ng-submit="submitClient()" name="myForm" class="form-horizontal" novalidate>
		<table>
			<tr>
				<th colspan="3">Ajouter/Modifier Client</th>
			</tr>
			<tr>
				<td>ID</td>
				<td><input type="text" ng-model="clientForm.id" readonly class="form-control" /></td>
			</tr>
			<tr>
				<td>Nom</td>
				<td><input type="text" name="nom" ng-model="clientForm.nom" class="form-control" ng-pattern="/^([^0-9]*)$/" ng-minlength="2" ng-maxlength="30" required /></td>
				<td><span ng-show="myForm.$dirty && myForm.nom.$error.required">Nom ne doit pas etre vide</span>
				<span ng-show="myForm.$dirty && myForm.nom.$error.pattern">Nom ne doit pas contenir des chiffres</span>
                <span ng-show="myForm.$dirty && myForm.nom.$invalid">La taille du nom doit etre entre 2 et 30</span></td>
			</tr>
			<tr>
				<td>Prenom</td>
				<td><input type="text" name="prenom" ng-model="clientForm.prenom" class="form-control" ng-pattern="/^([^0-9]*)$/" ng-minlength="2" ng-maxlength="30" required /></td>
				<td><span ng-show="myForm.$dirty && myForm.prenom.$error.required">Prenom ne doit pas etre vide</span>
				<span ng-show="myForm.$dirty && myForm.prenom.$error.pattern">Prenom ne doit pas contenir des chiffres</span>
                <span ng-show="myForm.$dirty && myForm.prenom.$invalid">La taille du prenom doit etre entre 2 et 30</span></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input type="email" ng-model="clientForm.email" class="form-control" name="email"/></td>              
				<td><span ng-show="myForm.$dirty && myForm.email.$invalid">Email doit etre valide</span></td>
			</tr>
			<tr>
				<td>DateDeNaissance</td>
				<td><input type="text" name="dateDeNaissance" ng-model="clientForm.dateDeNaissance" placeholder="yyyy-MM-dd" ng-pattern="/^(?:19|20)[0-9]{2}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31))$/" class="form-control" /></td>
				<td><span ng-show="myForm.$dirty && myForm.dateDeNaissance.$error.pattern">Date de Naissance doit etre sous format : yyyy-MM-dd</span>
                </td>
			</tr>
			<tr>
				<td>Telephone</td>
				<td><input type="text" name="telephone" ng-model="clientForm.telephone" class="form-control" ng-pattern="/^([0-9]*)$/" /></td>
				<td><span ng-show="myForm.$dirty && myForm.telephone.$error.pattern">Telephone doit etre des chiffres</span>
                </td>
			</tr>
			<tr>
				<td colspan="3"><input type="submit" value="Submit" ng-disabled="myForm.$invalid" class="btn btn-primary btn-sm" />
				<button type="button" ng-click="reset()" class="btn btn-warning btn-sm">Reset Form</button></td>
			</tr>
		</table>
	</form>
	</div>
</div>
</body>
</html>