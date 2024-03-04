import ModelIO
import RealityKit
import SceneKit
// import UIKit
import SceneKit
import ModelIO
import SceneKit.ModelIO

func convertOBJtoUSDZUsingSceneKit(objFilePath: String, usdzFilePath: String) {
    let scene = SCNScene(named: objFilePath)

    guard let scene = scene else {
        print("Failed to load the scene from the OBJ file.")
        return
    }

    let url = URL(fileURLWithPath: usdzFilePath)
    let mdlAsset = MDLAsset(scnScene: scene)

    do {
        try mdlAsset.export(to: url)
        print("Successfully converted OBJ to USDZ using SceneKit.")
    } catch {
        print("Failed to convert OBJ to USDZ using SceneKit: \(error.localizedDescription)")
    }
}
func convertOBJtoUSDZ(objFilePath: String, usdzFilePath: String) {
    let asset = MDLAsset(url: URL(fileURLWithPath: objFilePath))

    // Optionally, adjust the asset here (e.g., setting up materials)

    // Use Model I/O to export the asset to USDZ format
    do {
        try asset.export(to: URL(fileURLWithPath: usdzFilePath))
        print("Successfully converted OBJ to USDZ: \(usdzFilePath)")
    } catch {
        print("Failed to convert OBJ to USDZ: \(error)")
    }
}



func convertOBJtoSTL(objFilePath: String, stlFilePath: String) {
// Create a Process to invoke Assimp
    let process = Process()
    let pipe = Pipe()

    // Set the path to the Assimp command-line tool
    // Ensure this path is correct for your system; it might be different
    process.executableURL = URL(fileURLWithPath: "/usr/local/bin/assimp")

    // Configure Assimp command-line arguments for conversion
    process.arguments = ["export", objFilePath, stlFilePath, "-f", "stl"]

    // Capture the output of the command
    process.standardOutput = pipe
    process.standardError = pipe

    do {
        // Run the Assimp command
        try process.run()
        process.waitUntilExit()

        // Read and print the command output
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        if let output = String(data: data, encoding: .utf8) {
            print(output)
        }
    } catch {
        // Handle errors
        print("Failed to convert OBJ to STL: \(error.localizedDescription)")
    }
}

func convertUSDZtoOBJ(usdzFilePath: String, objFilePath: String) {

}
