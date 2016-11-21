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

    Breed labrador;

    value em1 = emf.createEntityManager();
    try {
        em1.transaction.begin();

        labrador = Breed("Labrador");
        em1.persist(labrador);

        {
            Dog("Jake", labrador),
            Dog("Sadie", labrador),
            Dog("Zanjeer", labrador)
        }
        .each(em1.persist);

        em1.transaction.commit();
    }
    finally {
        em1.close();
    }

    // Run a query using the JPA EntityManager directly
    value em2 = emf.createEntityManager();
    try {
        value dogs =
                em2.createQuery(
                    "from Dog dog
                     where dog.breed=?",
                    `Dog`)
                   .setParameter(1, labrador)
                   .resultList;
        for (dog in dogs) {
            print(dog.name);
        }
    }
    finally {
        em2.close();
    }

    // Run a query via the EntityManager facade from
    // ceylon.interop.persistence
    try (em = EntityManager.create(emf)) {
        value dogs =
                em.createTypedQuery(
                    "from Dog dog
                     where dog.breed=?",
                    `Dog`)
                  .setPositionalArguments(labrador)
                  .getResults();
        dogs.map(Dog.name).each(print);
    }

    // Retrieve an instance using the JPA EntityManager directly
    value em3 = emf.createEntityManager();
    try {
        if (exists breed
                = em3.find(`Breed`, javaString("Labrador"))) {
            breed.dogs.map(Dog.name).each(print);
        }
    }
    finally {
        em3.close();
    }

    // Retrieve an instance via the EntityManager facade from
    // ceylon.interop.persistence
    try (em = EntityManager.create(emf)) {
        if (exists breed = em.find(`Breed`, "Labrador")) {
            breed.dogs.map(Dog.name).each(print);
        }
    }

    emf.close();
}