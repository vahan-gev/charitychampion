import SwiftUI
import Foundation
struct RegisterView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var showAlert = false
    @State var shouldNavigate: Bool = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack() {
            HeaderNoProfile(text: "CHARITY CHAMPION")
            VStack(spacing: 24) {
                Text("Welcome friend")
                    .font(.custom("Clash Grotesk Semibold", size: 30))
                    .bold()
                
                Text("Sign up to get started")
                    .foregroundColor(.gray).font(.custom("Clash Grotesk Regular", size: 20))
                
                VStack(spacing: 16) {
                    TextField("First Name", text: $firstName)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .font(.custom("Clash Grotesk Regular", size: 20))
                    TextField("Last Name", text: $lastName)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .font(.custom("Clash Grotesk Regular", size: 20))
                }
                
                Button(action: {
                    if validateNames() {
                        let newUserData = UserData(name: firstName + " " + lastName, balance: 0, transactions: [], adsWatched: 0)
                        UserDefaults.standard.userData = newUserData
                        print("[RegisterView] > Created a new user")
                        shouldNavigate = true
                    } else {
                        showAlert = true
                    }
                }) {
                    Text("Sign Up")
                        .foregroundColor(.white)
                        .font(.custom("Clash Grotesk Bold", size: 22))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(colorScheme == .dark ? Color(hex: 0x4aa5e2) : Color.black)
                        .cornerRadius(8)
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Error"),
                        message: Text("First name and last name cannot be empty.")
                    )
                }
                Spacer()
                NavigationLink {
                    PrivacyView()
                } label: {
                    Text("Terms and Conditions")
                }

                
            }
            .padding().navigationDestination(isPresented: $shouldNavigate) {
                ContentView()
            }
        }
        .navigationBarHidden(true)
    }
    init() {
        shouldNavigate = false
    }
    func validateNames() -> Bool {
        !firstName.isEmpty && !lastName.isEmpty
    }
}
