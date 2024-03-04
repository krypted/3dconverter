// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
let package = Package(
    name: "STLtoOBJConverter",
    products: [
        .executable(name: "STLtoOBJConverter", targets: ["STLtoOBJConverter"]),
    ],
    targets: [
        .target(
            name: "STLtoOBJConverter",
            dependencies: ["CAssimpWrapper"]),
        .target(
            name: "CAssimpWrapper",
            dependencies: [],
            cxxSettings: [
                .headerSearchPath("include"),
		.define("USE_CXX11", to: "YES"),
		.unsafeFlags(["-std=c++11"], .when(platforms: [.macOS])),
            ],
            linkerSettings: [
                // Link against the Assimp library. Adjust the path as necessary if the library is in a non-standard location.
              //  .linkedLibrary("assimp"),
                // If Assimp is installed in a non-standard location, you might need to specify the path. Uncomment and adjust the following line:
                 .unsafeFlags(["-L/usr/local/Cellar/assimp/5.3.1/lib", "-lassimp"], .when(platforms: [.macOS]))
            ]
            ),
    ]
)
