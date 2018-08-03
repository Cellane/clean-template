import FluentSQLite
import Vapor

public func database(config: inout DatabasesConfig) throws {
    // Configure a SQLite database
    let sqlite = try SQLiteDatabase(storage: .memory)

    config.add(database: sqlite, as: .sqlite)
}
