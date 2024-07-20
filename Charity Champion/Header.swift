import SwiftUI

struct Header: View {
    @State private var isSettingsOpen = false
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        HStack {
            Image("icon")
                .resizable()
                .frame(width: 65, height: 65)
            Spacer()
            Text("CHARITY CHAMPION").font(.custom("Clash Grotesk Bold", size: 20))
            Spacer()
            Button {
                isSettingsOpen.toggle()
            } label: {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(colorScheme == .dark ? Color(hex: 0x4aa5e2) : Color.black)
            }.fullScreenCover(isPresented: $isSettingsOpen, content: ProfileView.init).padding(.trailing)

        }
    }
}


extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
