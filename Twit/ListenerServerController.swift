
import Foundation
import Starscream

class ListenerServerController {

    typealias connectCallback = () -> Void
    typealias textCallback = (_ responseData:Any?) -> Void
    
    private let listenURL = URL(string: "ws://192.168.1.66:8989/listen")!
    
    
    func connect(_ onConnect : @escaping connectCallback, _ onText : @escaping textCallback){
        
       let webSocket = WebSocket(url: listenURL)
        webSocket.connect()
        
    }
    
//    func connect(_ onConnect : @escaping connectCallback, _ onText : @escaping textCallback){
//
////        guard let endpointUrl:URL = ListenerEndpoint.listen(path: "listen").url
////        else {
////            print("failed to create url")
////            return
////        }
////
//
//        let webSocket = WebSocket(url: listenURL)
//     //   webSocket.onConnect = onConnect
//       // webSocket.onText = onText
//        webSocket.advancedDelegate = self
//
//        webSocket.connect()
//
//        if webSocket.isConnected {
//           print("connected")
//
//        } else {
//            print("not connected")
//        }
//    }
//
//    func websocketDidConnect(socket: WebSocket) {
//        print("websocketDidConnect")
//    }
//
//    func websocketDidDisconnect(socket: WebSocket, error: Error?) {
//          print("websocket is disconnected: \(error?.localizedDescription)")
//    }
//
//    func websocketDidReceiveMessage(socket: WebSocket, text: String, response: WebSocket.WSResponse) {
//        print("websocketDidReceiveMessage")
//    }
//
//    func websocketDidReceiveData(socket: WebSocket, data: Data, response: WebSocket.WSResponse) {
//         print("websocketDidReceiveData")
//    }
//
//    func websocketHttpUpgrade(socket: WebSocket, request: String) {
//        print("the http request was sent we can check the raw http if we need to")
//
//        print(request)
//    }
//
//    func websocketHttpUpgrade(socket: WebSocket, response: String) {
//        print("the http response has returned.")
//    }
}
