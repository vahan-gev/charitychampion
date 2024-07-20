import Foundation
import SwiftUI

struct ProfileView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme
    @State var shouldNavigateToRegister: Bool = false
    var body: some View {
        NavigationStack {
            HeaderNoProfile(text: "Settings")
            Text("Charity Champion")
                .font(.custom("Clash Grotesk Bold", size: 30)).padding().foregroundColor(.black)
                .frame(maxWidth: .infinity).padding(.horizontal, 20) .background(Color(hex:0xECECEC))
            VStack(alignment: .leading) {
                Text("Balance: \(UserDefaults.standard.userData!.balance) points")
                    .font(.custom("Clash Grotesk Bold", size:22))
                    .foregroundColor(.secondary)
            }.frame(maxWidth: .infinity, alignment: .leading).padding(20)
            Button(action: {
                dismiss()
            }, label: {
                Text("Go Back")
            })
            Spacer()
            VStack {
                Button(action: {
                    UserDefaults.standard.removeUserData()
                    shouldNavigateToRegister = true
                }) {
                    Text("Log out")
                        .foregroundColor(.white)
                        .font(.custom("Clash Grotesk Bold", size: 22))
                        .padding()
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(colorScheme == .dark ? Color(hex: 0x4aa5e2) : Color.black)
                        .cornerRadius(8)
                }
            }.padding().navigationDestination(isPresented: $shouldNavigateToRegister) {
                RegisterView()
            }
            
        }.navigationBarHidden(true)
    }
    init() {
        shouldNavigateToRegister = false
    }
}
