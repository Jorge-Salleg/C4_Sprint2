package com.unab.g32sql.IService;

import java.util.List;
import java.util.Optional;

import com.unab.g32sql.Entity.UnidadesMedidas;

public interface IUnidadesMedidasService {

	public List<UnidadesMedidas> all();

	public Optional<UnidadesMedidas> findById(Integer id);

	public UnidadesMedidas save(UnidadesMedidas unidadesMedidas);

	public void delete(Integer id);
}
