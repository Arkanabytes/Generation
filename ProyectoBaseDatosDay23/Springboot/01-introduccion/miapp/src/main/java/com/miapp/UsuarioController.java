package com.miapp;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

@RestController
public class UsuarioController {

    private final UsuarioService usuarioService;

    public UsuarioController(UsuarioService usuarioService) {
        this.usuarioService = usuarioService;
    }

    @GetMapping("/usuarios") // Endpoint: GET /usuarios
    public List<Usuario> getUsuarios() {
        return usuarioService.listarUsuarios();
    }
}
