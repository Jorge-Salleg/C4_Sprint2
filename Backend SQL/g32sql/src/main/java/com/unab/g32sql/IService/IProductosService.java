package com.unab.g32sql.IService;

import java.util.List;
import java.util.Optional;

import com.unab.g32sql.Entity.Productos;

public interface IProductosService {

	public List<Productos> all();

	public Optional<Productos> findById(Integer id);

	public Productos save(Productos productos);

	public void delete(Integer id);
}
