import Vapor

public func setupRepositories(services: inout Services, config: inout Config) {
    services.register(TodoRepository.self) { _ -> SQLiteTodoRepository in
        return SQLiteTodoRepository()
    }

    preferDatabaseRepositories(config: &config)
}

private func preferDatabaseRepositories(config: inout Config) {
    config.prefer(SQLiteTodoRepository.self, for: TodoRepository.self)
}
