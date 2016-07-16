// import Foundation

// struct CopyDir: Script {

//     var usage: String {
//         return "Usage: swift CopyDir.swift <DIR1> <DIR2>"
//     }

//     var expectedNumberOfArguments = 2

//     func run(arguments arguments: [String]) {
//         let dir1 = arguments[0]
//         let dir2 = arguments[1]
//     }

//     func copyDir(dir1: String, dir2: String) {
//         let sourcePath = "XCFit_Template/"
//         let destinationPath = "~/Library/Developer/Xcode/Templates/"



//         shell(launchPath: "/bin/cp", arguments: ["-rf", sourcePath, destinationPath)
//     }
// }

// CopyDir().run()
