import Foundation
//import coverterutils
import CAssimpWrapper
enum ConversionType {
    case stlToObj, objToStl, objToUsdz, usdzToObj
    // Add more conversion types as needed
}

func determineConversionType(from arguments: [String]) -> ConversionType? {
    // Logic to determine conversion type based on arguments
    // This is a simplified example. Extend it based on your command-line interface design.
    if arguments.contains("--stl-to-obj") {
        return .stlToObj
    } else if arguments.contains("--obj-to-stl") {
        return .objToStl
    } else if arguments.contains("--obj-to-usdz") {
        return .objToUsdz
    } else if arguments.contains("--usdz-to-obj") {
        return .usdzToObj
    }
    return nil
}

func main() {
    guard CommandLine.arguments.count > 3 else {
        print("Usage: STLConversionTool <conversion type> <input file> <output file>")
        return
    }

    let conversionType = determineConversionType(from: CommandLine.arguments)
    let inputFilePath = CommandLine.arguments[2]
    let outputFilePath = CommandLine.arguments[3]

    switch conversionType {
    case .stlToObj:
        convertSTLtoOBJ(inputFilePath, outputFilePath)
    case .objToStl:
        convertOBJtoSTL(objFilePath: inputFilePath, stlFilePath: outputFilePath)
    case .objToUsdz:
        convertOBJtoUSDZ(objFilePath: inputFilePath, usdzFilePath: outputFilePath)
    case .usdzToObj:
        convertUSDZtoOBJ(usdzFilePath: inputFilePath, objFilePath: outputFilePath)
    default:
        print("Invalid conversion type or insufficient arguments.")
    }
}

main()
