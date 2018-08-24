import Vapor

protocol TodoRepository: Service {
    func getAll(on connectable: DatabaseConnectable) -> Future<[Todo]>
    func create(_ todo: Todo, on connectable: DatabaseConnectable) -> Future<Todo>
    func delete(_ todo: Todo, on connectable: DatabaseConnectable) -> Future<Void>
}
