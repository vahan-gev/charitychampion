import SwiftUI
import GoogleMobileAds
@main
struct Charity_ChampionApp: App {
    init() {
        GADMobileAds.sharedInstance().start(completionHandler: nil)
    }
    var body: some Scene {
        WindowGroup {
            if (UserDefaults.standard.userData != nil) {
                ContentView()
            } else {
                RegisterView()
            }
        }
    }
}
