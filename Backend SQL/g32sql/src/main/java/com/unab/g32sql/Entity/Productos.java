package com.unab.g32sql.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;



@Entity
@Table(name="productos")
public class Productos {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    
	@Column(name = "nombre", nullable = false, length = 50, unique = true)
    private String nombre;
	
	@Column(name = "descripcion", nullable = false, length = 200)
    private String descripcion;
	
	@Column(name = "estado", nullable = false)
    private boolean estado;
	
	@ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "marca_id", nullable = false)
    private Marcas marcaId;
	
	@ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "categoria_id", nullable = false)
    private Categorias categoriaId;
	
	@ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "unidad_medida_id", nullable = false)
    private UnidadesMedidas unidadMedidaId;
	
	@ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "usuario_id", nullable = false)
    private Usuarios usuarioId;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public boolean getEstado() {
		return estado;
	}

	public void setEstado(boolean estado) {
		this.estado = estado;
	}

	public Marcas getMarcaId() {
		return marcaId;
	}

	public void setMarcaId(Marcas marcaId) {
		this.marcaId = marcaId;
	}

	public Categorias getCategoriaId() {
		return categoriaId;
	}

	public void setCategoriaId(Categorias categoriaId) {
		this.categoriaId = categoriaId;
	}

	public UnidadesMedidas getUnidadMedidaId() {
		return unidadMedidaId;
	}

	public void setUnidadMedidaId(UnidadesMedidas unidadMedidaId) {
		this.unidadMedidaId = unidadMedidaId;
	}

	public Usuarios getUsuarioId() {
		return usuarioId;
	}

	public void setUsuarioId(Usuarios usuarioId) {
		this.usuarioId = usuarioId;
	}

}