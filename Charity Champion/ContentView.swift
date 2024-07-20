import SwiftUI

struct ContentView: View {
    @StateObject private var userData: UserData
    @State private var selection = 2
    init() {
        if let storedUserData = UserDefaults.standard.data(forKey: "UserData"),
           let decodedUserData = try? JSONDecoder().decode(UserData.self, from: storedUserData) {
            _userData = StateObject(wrappedValue: decodedUserData)
        } else {
            _userData = StateObject(wrappedValue: UserData(name: "", balance: 0, transactions: [], adsWatched: 0))
        }
    }

    var body: some View {
        TabView(selection: $selection) {
            InfoView()
                .tabItem {
                    Label("Information", systemImage: "info.circle")
                }.tag(1)

            HomeView(userData: userData)
                .tabItem {
                    Label("Home", systemImage: "house")
                }.tag(2)

            EarningsView(userData: userData)
                .tabItem {
                    Label("Earnings", systemImage: "dollarsign")
                }.tag(3)
        }
        .accentColor(Color(hex: 0x4aa5e2))
    }
}
