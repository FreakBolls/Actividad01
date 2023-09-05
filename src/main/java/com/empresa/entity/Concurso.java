package com.empresa.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name="concurso")
public class Concurso {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idConcurso;
	
	private String nombre;
	
	@DateTimeFormat(pattern="yyyy-mm-dd")
	private Date fechaInicio,fechaFin;
	
	private String estado="Activo";
	
}
