import Foundation

struct LogStore {
    static var log: [String] = []
}

public func printLog(_ string: String) {
    // print to debug console
    print(string)
    // store into the logs
    LogStore.log.append(string)
}
