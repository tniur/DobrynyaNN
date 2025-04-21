import Foundation

public enum NetworkError: Error, LocalizedError {
    case unauthorized
    case notFound
    case server(ServerError)
    case unacceptableStatusCode(Int)
    case decodingError
    case unknown

    public var errorDescription: String? {
        switch self {
        case .unauthorized:
            return "Неавторизованный пользователь."
        case .notFound:
            return "Не найдено."
        case .server(let error):
            return error.detail
        case .unacceptableStatusCode(let code):
            return "Недопустимый статус: \(code)"
        case .decodingError:
            return "Ошибка при разборе данных"
        case .unknown:
            return "Неизвестная ошибка"
        }
    }
}

public struct ServerError: Decodable, Error {
    let detail: String
}
