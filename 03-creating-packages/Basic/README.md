# Guide to create a basic package and import it locally

Swift Package Manager (spm) can create two different types of packages

- `Library package`: Used for creating general libraries
- `Executable package`: Used to run/import all libraries locally using `main.swift` file

Here, `hellolib` is a library package and `helloexec` is an executable package. Using `helloexec`, we can run/import as many as libraries (like `hellolib`) as possible by adding them to dependancies - which, we will see shortly.

**Outline**

1. Create library package - `hellolib`
2. Create executable package - `helloexec`
3. Import and access `hellolib` using `helloexec`

---------------------------------------------

### Step 1 of 3: Creating library package - `hellolib`

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

Sources/hellolib/hellolib.swift :
```
public struct World{
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


### Step 2 of 3: Creating executable package - `helloexec`

- Goto your workspace
- Create a directory with name of your executable (all lowercase, no special characters)
```
mkdir helloexec
```
- Change to the newly created directory
```
cd helloexec/
```
- initialize your package which will add some predefined files into your directory. This tim use `--type` flag
```
swift package init --type executable 
```
Output :
```
Creating executable package: helloexec
Creating Package.swift
Creating README.md
Creating .gitignore
Creating Sources/
Creating Sources/helloexec/main.swift
Creating Tests/
Creating Tests/LinuxMain.swift
Creating Tests/helloexecTests/
Creating Tests/helloexecTests/helloexecTests.swift
Creating Tests/helloexecTests/XCTestManifests.swift
```
- Check if package created sucessfully or not. Being at `<workspace>/helloexec/` run:
```
swift build && swift run
```
Output:
```
Hello, world!
```

### Step 3 of 3: Import and access `hellolib` using `helloexec`

- As everything works just fine now lets add `hellolib` that we created earlier as a dependancy so that we can import it

- For that, edit `helloexec/Package` to
```
1. Add 'hellolib' path to .package
2. add "hellolib" (as a String inside array) in 'targets --> .target --> dependencies'
```

helloexec/Package.swift:
```
// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "helloexec",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(path: "/home/sisira/swift-workspace/swift4tensorflow/Packages/Basic/hellolib")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "helloexec",
            dependencies: ["hellolib"]),
        .testTarget(
            name: "helloexecTests",
            dependencies: ["helloexec"]),
    ]
)
```

Note: If loading from github simply replace with: `.package(url: /* github url */, from: "1.x.0x),` It is hosted [here](https://github.com/rakesh4real/hellolib). (Tagged release using website gui in github)

- You can write whatever code you want in `Sources/helloexec/main.swift` and run it using `swift build && swift run`. Edit it so that you can access `public struct World` and `func sayHello()`

main.swift:
```
print("THIS IS WHERE YOU WILL RUN ALL PACKAGES LOCALLY")

// Import
import hellolib

// access World
World.sayHello()

// acces a func
sayHello()
```
- Build and run from `<workspace>/helloexec/`:
```
swift build && swift run
```

Output:
```
THIS IS WHERE YOU WILL RUN ALL PACKAGES LOCALLY
Hello, World!
Hello, World!
```

**Note:** You can add different modules(`.swift` files) in `package-name/Sources/package-name/` folder with any name you want. All structs and classes in all those files will be accessible. This will help in writing projects with `modularity`

[Apple docs](https://github.com/apple/swift-package-manager/blob/master/Documentation/Usage.md)

------

### Importing a SPM Package in Swift-Jupyter Notebook

- Restart Runtime

- In first cell use the command :

        ```
        %install-location $cwd/swift-install
        %install '.package(url: "https://github.com/rakesh4real/swift-datastructures", from:"0.0.1")' DataStructures
        ```

**Note:** *`DataStructures` here is our package name. It is case sensitive. You can find out your package name in `Package.swift`*
