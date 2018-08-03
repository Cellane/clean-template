import Vapor

/// Controls basic CRUD operations on `Todo`s.
final class TodoController: RouteCollection {
    func boot(router: Router) throws {
        router.get("todos", use: getAllHandler)
        router.post(CreateTodoRequest.self, at: "todos", use: createHandler)
        router.delete("todos", Todo.parameter, use: deleteHandler)
    }

    /// Returns a list of all `Todo`s.
    func getAllHandler(_ req: Request) throws -> Future<[Todo]> {
        let repository = try req.make(TodoRepository.self)

        return repository.getAll(on: req)
    }

    /// Saves a decoded `Todo` to the database.
    func createHandler(_ req: Request, _ todoData: CreateTodoRequest) throws -> Future<Todo> {
        let repository = try req.make(TodoRepository.self)

        return repository.create(todoData.todo, on: req)
    }

    /// Deletes a parameterized `Todo`.
    func deleteHandler(_ req: Request) throws -> Future<HTTPStatus> {
        let repository = try req.make(TodoRepository.self)

        return try req.parameters.next(Todo.self).flatMap { todo in
            return repository.delete(todo, on: req)
        }.transform(to: .ok)
    }
}
