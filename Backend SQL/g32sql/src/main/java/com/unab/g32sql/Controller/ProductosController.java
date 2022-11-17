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

import com.unab.g32sql.Entity.Productos;
import com.unab.g32sql.IService.IProductosService;



@CrossOrigin(origins = "*")
@RestController
@RequestMapping("api/inventory/product")
public class ProductosController {
	
	@Autowired
	private IProductosService service;
	
	
	@GetMapping
	public List<Productos> all() {
		return service.all();
	}

	@GetMapping("{id}")
	public Optional<Productos> show(@PathVariable Integer id) {
		return service.findById(id);
	}
	
	@PostMapping
	@ResponseStatus(code = HttpStatus.CREATED)
	public Productos save(@RequestBody Productos productos) {
		return service.save(productos);
	}

	@PutMapping("{id}")
	@ResponseStatus(code = HttpStatus.CREATED)
	public Productos update(@PathVariable Integer id, @RequestBody Productos productos) {
		Optional<Productos> op = service.findById(id);

		if (!op.isEmpty()) {
			Productos productosUpdate = op.get();
			productosUpdate.setNombre(productos.getNombre());
			productosUpdate.setDescripcion(productos.getDescripcion());						
			productosUpdate.setEstado(productos.getEstado());
			productosUpdate.setMarcaId(productos.getMarcaId());
			productosUpdate.setCategoriaId(productos.getCategoriaId());
			productosUpdate.setUnidadMedidaId(productos.getUnidadMedidaId());
			productosUpdate.setUsuarioId(productos.getUsuarioId());
			return service.save(productosUpdate);
		}

		return productos;
	}
	
	@DeleteMapping("{id}")
	@ResponseStatus(code = HttpStatus.NO_CONTENT)
	public void delete(@PathVariable Integer id) {
		service.delete(id);
	}
	
}
