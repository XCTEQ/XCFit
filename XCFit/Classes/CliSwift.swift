// import Foundation

// func printShell(launchPath launchPath: String, arguments: [String], output: String?) {
//     let args = arguments.reduce("") {
//         $0 + $1 + " "
//     }
//     print("Ran shell script: \(launchPath) \(args)\nOutput:\n" + (output ?? "--No Output--"))
// }

// func shell(launchPath launchPath: String, arguments: [String] = [], debugPrint: Bool = false) -> String? {

//     let task = NSTask()
//     task.launchPath = launchPath
//     task.arguments = arguments

//     let pipe = NSPipe()
//     task.standardOutput = pipe
//     task.launch()

//     let data = pipe.fileHandleForReading.readDataToEndOfFile()
//     let output: String? = NSString(data: data, encoding: NSUTF8StringEncoding) as String?

//     if debugPrint {
//         printShell(launchPath: launchPath, arguments: arguments, output: output)
//     }
//     return output
// }

// func environmentVariable(named named: String) -> String? {
//     return NSProcessInfo.processInfo().environment[named]
// }

// func say(message: String) {
//     print("😀  " + TerminalColor.Green + message + TerminalColor.Default)
// }

// func warn(message: String) {
//     print("😰  " + TerminalColor.Yellow + message + TerminalColor.Default)
// }

// @noreturn
// func fail(message: String) {
//     print("😭  " + TerminalColor.Red + message + TerminalColor.Default)
//     exit(1)
// }

// protocol Script {
//     var usage: String { get }
//     var expectedNumberOfArguments: Int { get }
//     func run(arguments arguments: [String])

//     func run()
// }

// extension Script {

//     func run() {
//         let args = createArguments()
//         guard expectedNumberOfArguments == args.count else {
//             fail("Expected \(expectedNumberOfArguments) arguments. Got: \(args). \n\nUsage: \(usage)")
//         }
//         run(arguments: args)
//     }

//     func createArguments() -> [String] {
//         let args = Process.arguments
//         guard args.count > 1 else {
//             return []
//         }
//         return Array(args[1 ..< args.count])
//     }
// }

// enum TerminalColor: String {
//     case Red = "\u{001B}[0;31m"
//     case Yellow = "\u{001B}[0;33m"
//     case Green = "\u{001B}[0;32m"
//     case Default = "\u{001B}[0m"
// }

// func +(lhs: TerminalColor, rhs: String) -> String {
//     return lhs.rawValue + rhs
// }

// func +(lhs: String, rhs: TerminalColor) -> String {
//     return lhs + rhs.rawValue
// }
