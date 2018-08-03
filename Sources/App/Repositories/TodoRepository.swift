import FluentSQLite
import Vapor

protocol TodoRepository: Service {
    func getAll(on connectable: DatabaseConnectable) -> Future<[Todo]>
    func create(_ todo: Todo, on connectable: DatabaseConnectable) -> Future<Todo>
    func delete(_ todo: Todo, on connectable: DatabaseConnectable) -> Future<Void>
}

final class SQLiteTodoRepository: TodoRepository {
    func getAll(on connectable: DatabaseConnectable) -> EventLoopFuture<[Todo]> {
        return Todo.query(on: connectable).all()
    }

    func create(_ todo: Todo, on connectable: DatabaseConnectable) -> EventLoopFuture<Todo> {
        return todo.save(on: connectable)
    }

    func delete(_ todo: Todo, on connectable: DatabaseConnectable) -> EventLoopFuture<Void> {
        return todo.delete(on: connectable)
    }
}
