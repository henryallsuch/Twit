

import UIKit
import Starscream

class ViewController: UIViewController,WebSocketDelegate {

    

    @IBOutlet weak var console: UITextView!
    
    //let listenerServerController = ListenerServerController()
    let socket = WebSocket(url: URL(string: "ws://192.168.1.66:8989/listen")!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
//        listenerServerController.connect(
//            {
//                print("connected")
//                // self.logToView("Connected!")
//        },
//            {
//
//                (responseData: Any?) in
//
//                print(responseData!)
//
//                // self.logToView("Text!")
//
//        })
        
        socket.delegate = self
        socket.connect()
       
    }
    
    func websocketDidConnect(socket: WebSocketClient) {
        logToView("websocket is connected")
    }
    
    func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        logToView("websocket is disconnected: \(error?.localizedDescription ?? "unknown error")")
    }
    
    func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
         logToView(text, clearAllText: true)
    }
    
    func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        print("got some data: \(data.count)")
    }

    func logToView(_ message :String, clearAllText: Bool? = nil , newLine: Bool? = true){
        
        //always update UI in main thread!
        DispatchQueue.main.async {
            
            if clearAllText != nil {
                self.console.text.removeAll()
            }
            self.console.text.append(message);
            if(newLine != nil){
                self.console.text.append("\n");
            }
            
           // let range = NSMakeRange(self.console.text.count - 1, 0)
           // self.console.scrollRangeToVisible(range)
            
            print(message)
            
        }
    }
}

