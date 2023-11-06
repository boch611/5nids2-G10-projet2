package tn.esprit.spring.kaddem;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import tn.esprit.spring.kaddem.entities.Etudiant;
import tn.esprit.spring.kaddem.services.IEtudiantService;

import java.util.List;

@SpringBootTest
public class Junit {

    @Autowired
    IEtudiantService es;

    @Test
    public void testretrieveAllEtudiants(){
        List<Etudiant> etudiantList = es.retrieveAllEtudiants();
        Assertions.assertEquals(0, etudiantList.size());

    }
}
