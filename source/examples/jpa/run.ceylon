import ceylon.interop.java {
    javaString
}
import ceylon.interop.persistence {
    EntityManager
}

import javax.persistence {
    Persistence,
    EntityManagerFactory
}

EntityManagerFactory emf
        = Persistence.createEntityManagerFactory("example");

shared void run() {
    value em1 = emf.createEntityManager();
    em1.transaction.begin();

    value labrador = Breed("Labrador");
    em1.persist(labrador);

    value jake = Dog("Jake", labrador);
    value sadie = Dog("Sadie", labrador);
    value zanjeer = Dog("Zanjeer", labrador);
    { jake, sadie, zanjeer }.each(em1.persist);

    em1.transaction.commit();
    em1.close();

    value em2 = emf.createEntityManager();
    value dogs =
            em2.createQuery("from Dog dog where dog.breed=?", `Dog`)
                .setParameter(1, labrador)
                .resultList;
    for (dog in dogs) {
        print(dog.name);
    }
    em2.close();

    //Use the JPA EntityManager directly
    value em3 = emf.createEntityManager();
    em3.getReference(`Breed`, 
                     javaString("Labrador"))
            .dogs
            .map(Dog.name)
            .each(print);
    em3.close();

    //Use the EntityManager facade from ceylon.interop.persistence
    value em4 = EntityManager(emf.createEntityManager());
    em4.getReference(`Breed`, "Labrador")
            .dogs
            .map(Dog.name)
            .each(print);
    em4.close();

    emf.close();
}