package com.unab.g32sql.Controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.unab.g32sql.Entity.UnidadesMedidas;
import com.unab.g32sql.IService.IUnidadesMedidasService;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("api/inventory/unity")
public class UnidadesMedidasController {
	
	@Autowired
	private IUnidadesMedidasService service;
	
	
	@GetMapping
	public List<UnidadesMedidas> all() {
		return service.all();
	}

	@GetMapping("{id}")
	public Optional<UnidadesMedidas> show(@PathVariable Integer id) {
		return service.findById(id);
	}
	
	@PostMapping
	@ResponseStatus(code = HttpStatus.CREATED)
	public UnidadesMedidas save(@RequestBody UnidadesMedidas unidadesMedidas) {
		return service.save(unidadesMedidas);
	}

	@PutMapping("{id}")
	@ResponseStatus(code = HttpStatus.CREATED)
	public UnidadesMedidas update(@PathVariable Integer id, @RequestBody UnidadesMedidas unidadesMedidas) {
		Optional<UnidadesMedidas> op = service.findById(id);

		if (!op.isEmpty()) {
			UnidadesMedidas unidadesMedidasUpdate = op.get();
			unidadesMedidasUpdate.setNombre(unidadesMedidas.getNombre());
			unidadesMedidasUpdate.setDescripcion(unidadesMedidas.getDescripcion());						
			unidadesMedidasUpdate.setEstado(unidadesMedidas.getEstado());			
			return service.save(unidadesMedidasUpdate);
		}

		return unidadesMedidas;
	}
	
	@DeleteMapping("{id}")
	@ResponseStatus(code = HttpStatus.NO_CONTENT)
	public void delete(@PathVariable Integer id) {
		service.delete(id);
	}
}
