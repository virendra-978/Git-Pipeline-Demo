#!/bin/bash

echo "=== Building DevOps Application ==="

rm -rf target
mkdir -p target/classes
mkdir -p target/test-classes

echo "Compiling main source files..."
javac -d target/classes src/main/java/com/example/HelloDevOps.java

echo "Compiling test source files..."
javac -cp target/classes -d target/test-classes src/test/java/com/example/HelloDevOpsTest.java

echo "=== Running Tests ==="
java -cp target/classes:target/test-classes com.example.HelloDevOpsTest

echo "=== Creating JAR ==="
jar cf app.jar -C target/classes .

echo "=== Running Application ==="
java -cp app.jar com.example.HelloDevOps
