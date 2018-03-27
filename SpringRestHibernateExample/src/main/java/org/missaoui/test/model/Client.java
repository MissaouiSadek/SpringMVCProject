package org.missaoui.test.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.*;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.missaoui.test.config.JsonDateSerializer;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

@Entity
@Table(name = "Clients")
public class Client {

	@Id
	@Column(name = "ClientID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;

	@NotEmpty(message="Nom ne doit pas etre vide")
	@Pattern(regexp="[^0-9]*", message="Nom ne doit pas contenir des chiffres")
	@Size(max=30, min=2, message="La taille du nom doit etre entre 2 et 30")
	@Column(name = "Nom")
	String nom;

	@NotEmpty(message="Prenom ne doit pas etre vide")
	@Pattern(regexp="[^0-9]*", message="Prenom ne doit pas contenir des chiffres")
	@Size(max=30, min=2, message="Taille du prenom doit etre entre 2 et 30")
	@Column(name = "Prenom")
	String prenom;

	@Email(message="Email doit etre valide")
	@Column(name = "Email")
	String email;

	@Past(message="Date de naissance doit etre dans le passe")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@Column(name = "DateDeNaissance")
	Date dateDeNaissance;

	@Column(name = "Telephone")
	long telephone;

	public Client() {
		super();
	}

	public Client(int id, String nom, String prenom, String email, Date dateDeNaissance, long telephone) {
		super();
		this.id = id;
		this.nom = nom;
		this.prenom = prenom;
		this.email = email;
		this.dateDeNaissance = dateDeNaissance;
		this.telephone = telephone;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@JsonSerialize(using=JsonDateSerializer.class)
	public Date getDateDeNaissance() {
		return dateDeNaissance;
	}

	public void setDateDeNaissance(Date dateDeNaissance) {
		this.dateDeNaissance = dateDeNaissance;
	}

	public long getTelephone() {
		return telephone;
	}

	public void setTelephone(long telephone) {
		this.telephone = telephone;
	}

}