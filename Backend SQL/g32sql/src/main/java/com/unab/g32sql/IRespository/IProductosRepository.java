package com.unab.g32sql.IRespository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.unab.g32sql.Entity.Productos;

public interface IProductosRepository extends JpaRepository<Productos, Integer> {

}
