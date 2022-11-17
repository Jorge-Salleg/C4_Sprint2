package com.unab.g32sql.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unab.g32sql.Entity.Categorias;
import com.unab.g32sql.IRespository.ICategoriasRepository;
import com.unab.g32sql.IService.ICategoriasService;

@Service
public class CategoriasService implements ICategoriasService{

	@Autowired
	private ICategoriasRepository repository;
	
	@Override
	public List<Categorias> all() {		
		return repository.findAll();
	}

	@Override
	public Optional<Categorias> findById(Integer id) {
		return repository.findById(id);
	}

	@Override
	public Categorias save(Categorias categorias) {		
		return repository.save(categorias);
	}

	@Override
	public void delete(Integer id) {
		repository.deleteById(id);	
	}	
}
