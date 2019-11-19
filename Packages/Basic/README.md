# Guide to create a basic package and import it locally

Swift Package Manager (spm) can create two different types of packages

- `Library package`: Used for creating general libraries
- `Executable package`: Used to run/import all libraries locally using `main.swift` file

Here, `hellolib` is a library package and `helloexec` is an executable package. Using `helloexec`, we can run/import as many as libraries (like `hellolib`) as possible by adding them to dependancies - which, we will see now.

### Creating library package - `hellolib`

 
