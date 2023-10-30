import WatchConnectivity
import WatchKit
import SwiftUI

class WatchSessionManager: NSObject, ObservableObject, WCSessionDelegate {
    
    #if os(iOS)
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    #endif
    
    static let shared = WatchSessionManager()
    
    @Published var latitude: String = "Latitude: --"
    @Published var longitude: String = "Longitude: --"
    @Published var receivedText: String = "Received text will appear here"
    @Published var shouldVibrate: Bool = false
    @Published var showAlertView: Bool = false

    
    override init() {
        super.init()
        
        if WCSession.isSupported() {
            WCSession.default.delegate = self
            WCSession.default.activate()
        }
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        // Handle activation state if needed
    }

    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
            if let lat = message["lat"] as? String {
                self.latitude = "Latitude: \(lat)"
            }
            
            if let lon = message["lon"] as? String {
                self.longitude = "Longitude: \(lon)"
            }
            
            // Handling received text
            if let receivedText = message["text"] as? String {
                self.receivedText = receivedText
            }
            
            // Handle vibration alert
            if message["alert"] as? Bool == true {
                // Make the watch vibrate
                self.showAlertView = true
                WKInterfaceDevice.current().play(.notification)
            }
        }
    }
}
