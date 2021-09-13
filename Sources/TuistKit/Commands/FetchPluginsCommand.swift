import ArgumentParser
import Foundation
import TSCBasic

struct FetchPluginCommand: ParsableCommand {
    static var configuration: CommandConfiguration {
        CommandConfiguration(
            commandName: "plugins",
            abstract: "Fetch and build plugins."
        )
    }
}
