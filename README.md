# Java Persistence in Ceylon

This project contains a really simple example of 
the use of the Java Persistence API in Ceylon, 
along with the optional use of the helper module
`ceylon.interop.persistence`.

By default, the example uses [Hibernate][] as the 
JPA provider. A different persistence provider 
may be selected by editing `overrides.xml` and 
`persistence.xml`.

[Hibernate]: http://hibernate.org

## Requirements

This example requires Java 8 and [Ceylon 1.3.3][] 
or Ceylon IDE 1.3.3 for Eclipse or IntelliJ. On
the command line you can use the provided `ceylonb`
command if you don't have Ceylon already installed.

[Ceylon 1.3.3]: https://ceylon-lang.org/download

## Running the example

In this directory, type:

    ./ceylonb run examples.jpa

Or simply import the project into Ceylon IDE and
run it from within the IDE.

## Running the example using Java

To run the example using `java`, compile the 
example and assemble an executable  "fat" `.jar`:

    ./ceylonb compile
    ./ceylonb fat-jar examples.jpa

Then run the `.jar`:

     java -jar examples.jpa-1.0.0.jar

## Running the example as a Ceylon assembly

To run the example as a Ceylon assemble, compile 
the example and assemble a `.cas` archive:

    ./ceylonb compile
    ./ceylonb assemble examples.jpa

Then run the assembly:

     ceylon run -a examples.jpa-1.0.0.cas

