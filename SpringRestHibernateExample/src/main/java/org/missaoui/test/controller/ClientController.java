package org.missaoui.test.controller;

import java.util.List;
import org.missaoui.test.model.Client;
import org.missaoui.test.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
 
@RestController
public class ClientController {
 
 @Autowired
ClientService clientService;
 
 @RequestMapping(value = "/getAllClients", method = RequestMethod.GET, headers = "Accept=application/json")
 public List getClients() {  
  List clients = clientService.getAllClients();
  return clients;
 }
 
 @RequestMapping(value = "/getClient/{id}", headers = "Accept=application/json")
 public Client getClient(@PathVariable("id") int id) {
  return clientService.getClient(id);
 }
 
 @RequestMapping(value = "/addClient", method = RequestMethod.POST, headers = "Accept=application/json")
 public void addClient(@RequestBody Client client) { 
  clientService.addClient(client);
  
 }
 
 @RequestMapping(value = "/updateClient", method = RequestMethod.PUT, headers = "Accept=application/json")
 public void updateClient(@RequestBody Client client) {
  clientService.updateClient(client);
 }
 
 @RequestMapping(value = "/deleteClient/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
 public void deleteClient(@PathVariable("id") int id) {
  clientService.deleteClient(id);  
 } 
}