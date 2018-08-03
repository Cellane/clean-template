import Vapor

public func middleweares(config: inout MiddlewareConfig) throws {
    // Serves files from `Public/` directory
    // middlewares.use(FileMiddleware.self)

    // Catches errors and converts to HTTP response
    config.use(ErrorMiddleware.self)
}
