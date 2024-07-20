import Foundation
import SwiftUI
struct PrivacyView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        NavigationView {
            VStack (spacing: 8) {
                HeaderNoProfile(text: "CHARITY CHAMPION")
                Text("This is a placeholder text, change it.")
                Spacer()
                Button(action: {
                    dismiss()
                }) {
                    Text("Back")
                        .foregroundColor(.white)
                        .font(.custom("Clash Grotesk Bold", size: 22))
                        .padding()
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(colorScheme == .dark ? Color(hex: 0x4aa5e2) : Color.black)
                        .cornerRadius(8)
                }
            }.padding()
        }.navigationBarHidden(true)
        
    }
}
