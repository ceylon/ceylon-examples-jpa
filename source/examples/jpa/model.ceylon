import ceylon.collection {
    HashSet
}

import javax.persistence {
    GenerationType {
        ...
    },
    ...
}

entity class Dog(name, breed = null) {

    id generatedValue { strategy=identity; }
    shared late Integer id;

    shared String name;

    manyToOne
    shared Breed? breed;

}

entity class Breed(name)  {

    shared id String name;

    oneToMany { mappedBy = "breed"; }
    shared Set<Dog> dogs = HashSet<Dog>();

}