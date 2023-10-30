//
//  ContentView.swift
//  Safe-Transport-WatchOS Watch App
//
//  Created by  jx2518 on 10/22/23.
//

import SwiftUI
import WatchConnectivity

struct ContentView: View {
    @ObservedObject var watchSessionManager = WatchSessionManager.shared
    @State private var isAlertViewActive: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: LocationView()) {
                    Text("Show Location")
                }
                
                NavigationLink(destination: MessageView()) {
                    Text("Show Message")
                }
                
                NavigationLink(destination: AlertView(), isActive: $isAlertViewActive) {
                    EmptyView()
                }
            }
            .onReceive(watchSessionManager.$showAlertView) { newValue in
                            isAlertViewActive = newValue
            }
        }
    }
}

struct AlertView: View {
    @ObservedObject var manager = WatchSessionManager.shared

    var body: some View {
        VStack {
            Text("Alert received!")
            
            Button("Dismiss") {
                manager.showAlertView = false
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
