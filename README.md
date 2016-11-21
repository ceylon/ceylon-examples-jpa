# Java Persistence in Ceylon

This project contains a really simple example of 
the use of the Java Persistence API in Ceylon, 
along with the optional use of the helper module
`ceylon.interop.persistence`.

By default, the example uses [Hibernate] as the 
JPA provider. A different persistence provider 
may be selected by editing `overrides.xml` and 
`persistence.xml`.

[Hibernate]: http://hibernate.org

## Requirements

This example requires Java 8 and [Ceylon 1.3.1] 
or Ceylon IDE 1.3.1 for Eclipse or IntelliJ.

[Ceylon 1.3.1]: https://ceylon-lang.org/download

## Running the example

In this directory, type:

    ceylon run --compile examples.jpa

Or simply import the project into Ceylon IDE and
run it from within the IDE.

## Running the example using Java

To run the example using `java`, compile the 
example and assemble an executable  "fat" `.jar`:

    ceylon compile
    ceylon fat-jar examples.jpa

Then run the `.jar`:

     java -jar examples.jpa-1.0.0.jar
