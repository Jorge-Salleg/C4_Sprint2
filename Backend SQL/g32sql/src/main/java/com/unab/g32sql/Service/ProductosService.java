package com.unab.g32sql.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unab.g32sql.Entity.Productos;
import com.unab.g32sql.IRespository.IProductosRepository;
import com.unab.g32sql.IService.IProductosService;

@Service
public class ProductosService implements IProductosService {
	
	@Autowired
	private IProductosRepository repository;

	@Override
	public List<Productos> all() {
		return repository.findAll();
	}

	@Override
	public Optional<Productos> findById(Integer id) {
		return repository.findById(id);
	}

	@Override
	public Productos save(Productos productos) {
		return repository.save(productos);
	}

	@Override
	public void delete(Integer id) {
		repository.deleteById(id);
	}
}
