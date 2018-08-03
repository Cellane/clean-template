import FluentSQLite
import Vapor

/// Called before your application initializes.
public func configure(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {
    /// Register providers first
    try services.register(FluentSQLiteProvider())

    /// Register routes to the router
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)

    /// Register middlewares
    var middlewaresConfig = MiddlewareConfig()
    try middleweares(config: &middlewaresConfig)
    services.register(middlewaresConfig)

    /// Register databases
    var databasesConfig = DatabasesConfig()
    try database(config: &databasesConfig)
    services.register(databasesConfig)

    /// Configure migrations
    services.register { container -> MigrationConfig in
        var migrationConfig = MigrationConfig()
        try migrate(migrations: &migrationConfig)
        return migrationConfig
    }

    /// Configure commands
    var commandsConfig = CommandConfig.default()
    commands(config: &commandsConfig)
    services.register(commandsConfig)

    /// Configure content
    var contentConfig = ContentConfig.default()
    try content(config: &contentConfig)
    services.register(contentConfig)

    /// Setup repositories
    setupRepositories(services: &services, config: &config)
}
