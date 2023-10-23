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
    
    var body: some View {
            NavigationView {
                List {
                    NavigationLink(destination: LocationView()) {
                        Text("Show Location")
                    }
                    
                    NavigationLink(destination: MessageView()) {
                        Text("Show Message")
                    }
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
