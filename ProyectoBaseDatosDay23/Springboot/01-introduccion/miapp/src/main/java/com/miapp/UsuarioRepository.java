package com.miapp;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UsuarioRepository extends JpaRepository<Usuario, Integer> {
    // JpaRepository<Usuario, Integer> significa:
    // - Usuario: entidad que gestionará
    // - Integer: tipo de la Primary Key
}
