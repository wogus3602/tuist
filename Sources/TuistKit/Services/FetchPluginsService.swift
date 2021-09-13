import Foundation
import TuistSupport
import TuistPlugin
import TuistLoader

final class FetchPluginsService {
    private let pluginService: PluginServicing
    private let configLoader: ConfigLoading
    
    init(
        pluginService: PluginServicing = PluginService(),
        configLoader: ConfigLoading = ConfigLoader(manifestLoader: CachedManifestLoader())
    ) {
        self.pluginService = pluginService
        self.configLoader = configLoader
    }
    
    func run() throws {
        // TODO: Add possibility to specify path
        let path = FileHandler.shared.currentPath
        
        let config = try configLoader.loadConfig(path: path)
        // TODO: Remove `loadPlugins` call from other services where it's used
        // TODO: Remove all mentions of tasks when loading and executing manifests -> this will no longer make sense
        _ = try pluginService.loadPlugins(using: config)
    }
}
