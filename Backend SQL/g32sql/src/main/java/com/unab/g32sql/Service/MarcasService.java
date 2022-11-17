package com.unab.g32sql.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unab.g32sql.Entity.Marcas;
import com.unab.g32sql.IRespository.IMarcasRepository;
import com.unab.g32sql.IService.IMarcasService;

@Service
public class MarcasService implements IMarcasService{

	@Autowired
	private IMarcasRepository repository;
	
	@Override
	public List<Marcas> all() {		
		return repository.findAll();
	}

	@Override
	public Optional<Marcas> findById(Integer id) {
		return repository.findById(id);
	}

	@Override
	public Marcas save(Marcas marcas) {		
		return repository.save(marcas);
	}

	@Override
	public void delete(Integer id) {
		repository.deleteById(id);	
	}
}
