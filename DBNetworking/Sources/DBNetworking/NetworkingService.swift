import Foundation

public protocol NetworkingService {
    func fetchData(from url: URL, completion: @escaping (Result<Data, Error>) -> Void)
}

public final class NetworkingServiceImpl: NetworkingService {
    public init() {}
    
    public func fetchData(from url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                completion(.success(data))
            } else {
                completion(.failure(NSError(domain: "Unknown error", code: -1, userInfo: nil)))
            }
        }
        task.resume()
    }
}
