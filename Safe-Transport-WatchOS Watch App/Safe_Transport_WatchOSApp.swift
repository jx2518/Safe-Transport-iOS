import SwiftUI
import UserNotifications

@main
struct Safe_TRANSPORT_WatchOSApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear(perform: requestNotificationPermissions)
        }
    }
    
    func requestNotificationPermissions() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { granted, error in
            if granted {
                print("Notification permissions granted.")
            } else if let error = error {
                print("Failed to request notification permissions: \(error.localizedDescription)")
            }
        }
    }
}
