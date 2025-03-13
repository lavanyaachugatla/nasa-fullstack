package com.techelevator.controller;


import com.techelevator.dao.NeoDao;
import com.techelevator.dao.UserDao;
import com.techelevator.model.Neo;
import com.techelevator.model.NeoFeedResponse;
import com.techelevator.model.User;
import com.techelevator.service.NEOService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.time.LocalDate;

@RestController
@CrossOrigin  //handles the CORS error
@PreAuthorize("isAuthenticated")
public class NasaController {

    @Autowired
    private NEOService service;

    @Autowired
    private NeoDao neodao;

    @Autowired
    private UserDao userDao;

    @GetMapping("/neos")   //GetMapping is same as RequestMapping, It directly tells it's a GET request
    public NeoFeedResponse getNeos() {
        return service.getNEOData("2025-03-13");
    }

    @PostMapping("/saveneo")
    public Neo saveNeoToDB(@RequestParam String nasaId,
                           @RequestBody Neo neo, Principal principal) {
        User user = userDao.getUserByUsername(principal.getName());
        return neodao.saveNeo(neo, user.getId(), LocalDate.now());
    }
}
