package com.empresa.service;

import org.springframework.stereotype.Service;

import com.empresa.entity.Jugador;
import com.empresa.repository.JugadorRepository;

@Service
public class JugadorServiceImpl implements JugadorService{
	
	private JugadorRepository repository;
	@Override
	public Jugador insertaJugador(Jugador obj) {
		// TODO Auto-generated method stub
		return repository.save(obj);
	}

}
