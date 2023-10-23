//
//  MessageView.swift
//  Safe-Transport-WatchOS Watch App
//
//  Created by  jx2518 on 10/23/23.
//
import SwiftUI

struct MessageView: View {
    var body: some View {
        Text(WatchSessionManager.shared.receivedText)
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}

