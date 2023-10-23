//
//  SwiftUIView.swift
//  Safe-Transport-WatchOS Watch App
//
//  Created by  jx2518 on 10/23/23.
//

import SwiftUI

struct LocationView: View {
    var body: some View {
        VStack {
            Text(WatchSessionManager.shared.latitude)
            Text(WatchSessionManager.shared.longitude)
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}

