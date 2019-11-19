# Guide to create a basic package and import it locally

Swift Package Manager (spm) can create two different types of packages

- `Library package`: Used for creating general libraries
- `Executable package`: Used to run/import all libraries locally using `main.swift` file

Here, `hellolib` is a library package and `helloexec` is an executable package. Using `helloexec`, we can run/import as many as libraries (like `hellolib`) as possible by adding them to dependancies - which, we will see shortly.

### Step 1 of 2: Creating library package - `hellolib`

- Goto your workspace
- Create a directory with name of your library (all lowercase, no special characters)
```
mkdir hellolib
```
- Change to the newly created directory
```
cd hellolib/
```
- initialize your package which will add some predefined files into your directory
```
swift package init
```
Output:
```
Creating library package: hellolib
Creating Package.swift
Creating README.md
Creating .gitignore
Creating Sources/
Creating Sources/hellolib/hellolib.swift
Creating Tests/
Creating Tests/LinuxMain.swift
Creating Tests/hellolibTests/
Creating Tests/hellolibTests/hellolibTests.swift
Creating Tests/hellolibTests/XCTestManifests.swift
```
- Edit `Sources/hellolib/hellolib.swift` whichever way you want. You can add other swift files in `Sources/hellolib/` aswell. I am adding this code which will be used by `helloexec`
```public struct World{
        public static func sayHello(){
                print("Hello, World!")
        }
}

public func sayHello(){
        print("Hello, World!")
}
```
Note: `public` keyword should be added so that they can be accesed. By default all are `internal`

- We have sucessfull y created our library package
