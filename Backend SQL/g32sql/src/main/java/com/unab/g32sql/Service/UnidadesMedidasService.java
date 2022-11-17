package com.unab.g32sql.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unab.g32sql.Entity.UnidadesMedidas;
import com.unab.g32sql.IRespository.IUnidadesMedidasRepository;
import com.unab.g32sql.IService.IUnidadesMedidasService;

@Service
public class UnidadesMedidasService  implements IUnidadesMedidasService{

	@Autowired
	private IUnidadesMedidasRepository repository;

	@Override
	public List<UnidadesMedidas> all() {
		return repository.findAll();
	}

	@Override
	public Optional<UnidadesMedidas> findById(Integer id) {
		return repository.findById(id);
	}

	@Override
	public UnidadesMedidas save(UnidadesMedidas unidadesMedidas) {
		return repository.save(unidadesMedidas);
	}

	@Override
	public void delete(Integer id) {
		repository.deleteById(id);
	}
}
