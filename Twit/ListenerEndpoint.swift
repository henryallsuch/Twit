
import Foundation

enum ListenerSchemes : String {
    case https = "https"
    case websocket = "ws"
}

struct ListenerEndpoint {
    let host = "192.168.1.66"
    let port = 8989
    let path: String
    let scheme : String
    let queryItems: [URLQueryItem] = []
}

extension ListenerEndpoint {

    var url: URL? {
        
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.port = port
        components.path = path
        if(queryItems.count > 0){
            components.queryItems = queryItems
        }
        
        return components.url
    }
}

extension ListenerEndpoint {
    static func listen() -> ListenerEndpoint {
        return ListenerEndpoint(
            path: "/listen",
            scheme: ListenerSchemes.websocket.rawValue
        )
    }
}
