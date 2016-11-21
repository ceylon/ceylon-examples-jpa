"Simple example of the use of the Java Persistence API in
 Ceylon."
native ("jvm")
module examples.jpa "1.0.0" {

    //don't hardcode dependency to Hibernate here
    //use overrides.xml instead

    import ceylon.collection "1.3.1";
    import ceylon.interop.persistence "1.3.1";
}
