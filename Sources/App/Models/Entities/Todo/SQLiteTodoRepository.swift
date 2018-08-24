import FluentSQLite
import Vapor

final class SQLiteTodoRepository: TodoRepository {
    func getAll(on connectable: DatabaseConnectable) -> Future<[Todo]> {
        return Todo.query(on: connectable).all()
    }

    func create(_ todo: Todo, on connectable: DatabaseConnectable) -> Future<Todo> {
        return todo.save(on: connectable)
    }

    func delete(_ todo: Todo, on connectable: DatabaseConnectable) -> Future<Void> {
        return todo.delete(on: connectable)
    }
}

