import ArgumentParser
import Foundation
import TSCBasic

struct FetchCommand: ParsableCommand {
    static var configuration: CommandConfiguration {
        CommandConfiguration(
            commandName: "fetch",
            abstract: "Fetches all necessary dependencies and plugins.",
            // TODO: Run services for commands below
            subcommands: [
                DependenciesFetchCommand.self,
                FetchPluginCommand.self,
            ]
        )
    }
}
