import Vapor

final class CreateTodoRequest: Content {
    /// A title describing what this `Todo` entails.
    var title: String

    var todo: Todo {
        return Todo(title: title)
    }
}
