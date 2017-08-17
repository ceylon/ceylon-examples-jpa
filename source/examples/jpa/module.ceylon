"Simple example of the use of the Java Persistence API in
 Ceylon."
native ("jvm")
module examples.jpa "1.0.0" {

    //better not hardcode dependency to Hibernate or
    //database driver here; use overrides.xml instead

    import ceylon.interop.persistence "1.3.3";
}
