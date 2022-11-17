package com.unab.g32sql.IService;

import java.util.List;
import java.util.Optional;

import com.unab.g32sql.Entity.Marcas;

public interface IMarcasService {

	public List<Marcas> all();

	public Optional<Marcas> findById(Integer id);

	public Marcas save(Marcas marcas);

	public void delete(Integer id);
}
