package com.unab.g32sql.IRespository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.unab.g32sql.Entity.Usuarios;

public interface IUsuariosRepository extends JpaRepository<Usuarios, Integer> {

}
