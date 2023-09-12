package br.com.etechoracio.viagem.controller;

import br.com.etechoracio.viagem.entity.Viagem;
import br.com.etechoracio.viagem.repository.ViagemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/viagens")
public class viagemController {

    @Autowired
    private ViagemRepository repository;

    @GetMapping
    public List<Viagem> buscarTodos() {
        return repository.findAll();
    }

    @GetMapping("/{Id}")
    public Optional<Viagem> buscarPorId(@PathVariable Long Id)
    {
        return repository.findById(Id);
    }

    @PostMapping
    public Viagem inserir(@RequestBody Viagem body) {
        Viagem Inserido = repository.save(body);
        return Inserido;
    }
}
