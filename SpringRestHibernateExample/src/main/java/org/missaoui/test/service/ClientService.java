package org.missaoui.test.service;

import java.util.List;
import org.missaoui.test.dao.ClientDAO;
import org.missaoui.test.model.Client;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
 
@Service("clientService")
public class ClientService {
 
 @Autowired
 ClientDAO clientDAO;
 
 @Transactional
 public List getAllClients() {
  return clientDAO.getAllClients();
 }
 
 @Transactional
 public Client getClient(int id) {
  return clientDAO.getClient(id);
 }
 
 @Transactional
 public void addClient(Client client) {
  clientDAO.addClient(client);
 }
 
 @Transactional
 public void updateClient(Client client) {
  clientDAO.updateClient(client);
 
 }
 
 @Transactional
 public void deleteClient(int id) {
  clientDAO.deleteClient(id);
 }
}