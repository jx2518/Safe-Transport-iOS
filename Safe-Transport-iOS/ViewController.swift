//
//  ViewController.swift
//  Safe-Transport-iOS
//
//  Created by  jx2518 on 10/22/23.
//

import UIKit
import CoreLocation
import WatchConnectivity

class ViewController: UIViewController, CLLocationManagerDelegate, WCSessionDelegate, UITextFieldDelegate{
    @IBOutlet weak var inputTextField: UITextField!

    @IBAction func sendTextToWatch(_ sender: Any) {
        if WCSession.default.isReachable {
            let textToSend = inputTextField.text ?? ""
            WCSession.default.sendMessage(["text": textToSend], replyHandler: nil, errorHandler: nil)
        }

    }
    
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.delegate = self
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        startWatchConnectivitySession()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let location = locations.last else { return }
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            
            // Sending location data to Apple Watch
            if WCSession.default.isReachable {
                let coordinates = ["lat": "\(lat)", "lon": "\(lon)"]
                WCSession.default.sendMessage(coordinates, replyHandler: nil, errorHandler: { error in
                    print("Failed to send data to watch: \(error.localizedDescription)")
                })
            }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print("Failed to get location: \(error.localizedDescription)")
    }
    
    func startWatchConnectivitySession() {
            if WCSession.isSupported() {
                WCSession.default.delegate = self
                WCSession.default.activate()
            }
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
            // Handle session activation completion if needed
    }
}

