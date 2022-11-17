package com.unab.g32sql.IService;

import java.util.List;
import java.util.Optional;

import com.unab.g32sql.Entity.Categorias;

public interface ICategoriasService {

	public List<Categorias> all();

	public Optional<Categorias> findById(Integer id);

	public Categorias save(Categorias categorias);

	public void delete(Integer id);
}
