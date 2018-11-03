
import Foundation

enum ListenerSchemes : String {
    case https = "https"
    case websocket = "ws"
}

struct ListenerEndpoint {
    let host = "127.0.0.1"
    let port = 8080
    let path: String
    let scheme : String
    let queryItems: [URLQueryItem]
}

extension ListenerEndpoint {

    var url: URL? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.port = port
        components.path = path
        components.queryItems = queryItems
        
        return components.url
    }
}

extension ListenerEndpoint {
    static func listen(path: String) -> ListenerEndpoint {
        return ListenerEndpoint(
            path: path,
            scheme: ListenerSchemes.websocket.rawValue,
            queryItems: []
        )
    }
}
