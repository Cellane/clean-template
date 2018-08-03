import FluentSQLite
import Vapor

public func migrate(migrations: inout MigrationConfig) throws {
    migrations.add(model: Todo.self, database: .sqlite)
}
