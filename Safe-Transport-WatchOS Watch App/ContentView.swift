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
            VStack(spacing: 10) {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                
                Text(watchSessionManager.latitude)
                Text(watchSessionManager.longitude)
            }
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
