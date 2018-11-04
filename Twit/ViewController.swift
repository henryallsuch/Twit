

import UIKit
import Starscream

class ViewController: UIViewController,WebSocketDelegate {
    
    @IBOutlet weak var startUIButton: UIButton!
    @IBOutlet weak var stopUIButton: UIButton!
    
    @IBOutlet weak var console: UITextView!
    
    static let listenEndpoint = ListenerEndpoint.listen().url!
   let socket = WebSocket(url: listenEndpoint)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        logToView("Ready", clearAllText: true)
        
    }
    
    @IBAction func didTouchStartButton(_ sender: UIButton) {
        
        tryConnect()
        
    }
    
    @IBAction func didTouchStopButton(_ sender: UIButton) {
        
        tryDisconnect()
        
    }
    
    func tryConnect(){
        
        logToView("connecting to: \(ViewController.listenEndpoint)", clearAllText: true)
        
        socket.delegate = self
        socket.connect()
        
    }
    
    func tryDisconnect(){
        
        if(socket.isConnected){
            socket.disconnect()
        }
        
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
        
        DispatchQueue.main.async {
            
            if clearAllText != nil {
                self.console.text.removeAll()
            }
            self.console.text.append(message);
            if(newLine != nil){
                self.console.text.append("\n");
            }
            
            print(message)
            
        }
    }
}

