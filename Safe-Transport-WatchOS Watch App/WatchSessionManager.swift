import WatchConnectivity
import SwiftUI

class WatchSessionManager: NSObject, ObservableObject, WCSessionDelegate {
    static let shared = WatchSessionManager()
    
    @Published var latitude: String = "Latitude: --"
    @Published var longitude: String = "Longitude: --"
    
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
        if let lat = message["lat"] as? String {
            latitude = "Latitude: \(lat)"
        }
        
        if let lon = message["lon"] as? String {
            longitude = "Longitude: \(lon)"
        }
    }
}
