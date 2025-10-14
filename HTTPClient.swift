import Foundation

public protocol URLSessioning {
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessioning {}

public struct HTTPClient {
    public enum HTTPError: Error { case badStatus(Int) }

    private let session: URLSessioning
    public init(session: URLSessioning = URLSession.shared) {
        self.session = session
    }

    public func get(_ url: URL) async throws -> Data {
        var req = URLRequest(url: url)
        req.httpMethod = "GET"
        let (data, resp) = try await session.data(for: req)
        guard let http = resp as? HTTPURLResponse, (200..<300).contains(http.statusCode) else {
            let status = (resp as? HTTPURLResponse)?.statusCode ?? -1
            throw HTTPError.badStatus(status)
        }
        return data
    }
}
