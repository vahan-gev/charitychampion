import SwiftUI
import GoogleMobileAds

struct HomeView: View {
    @ObservedObject var userData: UserData
    @State private var showAlert = false
    @State private var rewarded: GADRewardedAd?
    @State private var isAdLoaded = false
    @State private var isAdLoading = false

    var currentDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d, yyyy"
        return formatter.string(from: Date())
    }

    var body: some View {
        NavigationView {
            VStack {
                Header()
                VStack(alignment: .leading) {
                    Text("WELCOME FRIEND")
                        .font(.custom("Clash Grotesk Bold", size: 22))
                        .fontWeight(.bold)
                    Text("WE MISSED YOU")
                        .font(.custom("Clash Grotesk Semibold", size: 18))
                        .foregroundColor(.secondary)
                    Text(currentDate)
                        .font(.custom("Clash Grotesk Regular", size: 16))
                        .foregroundColor(.secondary)
                }.frame(maxWidth: .infinity, alignment: .leading).padding(20)

                Spacer()

                Button(action: {
                    if isAdLoaded {
                        if let rewarded = rewarded {
                            let root = UIApplication.shared.getRootViewController()
                            rewarded.present(fromRootViewController: root, userDidEarnRewardHandler: {
                                userData.addBalance(10)
                                userData.addWatchedAd()
                                userData.addTransaction(Transaction(amount: 10, currentDate: currentDate))
                                print("[HomeView] > User earned reward")
                                isAdLoaded = false
                            })
                        }
                    } else {
                        showAlert = true
                    }
                }) {
                    Circle()
                        .fill(Color(hex: 0x4aa5e2))
                        .frame(width: 200, height: 200)
                        .overlay(
                            Text(isAdLoaded ? "CHECK IN" : "LOADING...")
                                .font(.custom("Clash Grotesk Bold", size: 23))
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        )
                }
                .disabled(!isAdLoaded)
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Error"),
                        message: Text("Ad hasn't loaded yet, please wait a little longer.")
                    )
                }

                Spacer()

                VStack {
                    Text("ALL PROFITS GO TO CHARITY")
                        .font(.custom("Clash Grotesk Regular", size: 13))
                        .padding()
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 20)
                        .background(Color(hex: 0xECECEC))
                        .cornerRadius(8)
                }.padding()
            }
        }.navigationBarHidden(true)
        .onAppear {
            loadAd()
        }
    }

    func loadAd() {
        guard !isAdLoading else { return }

        isAdLoading = true
        let request = GADRequest()
        // CHANGE THE UNIT_ID in ""
        GADRewardedAd.load(withAdUnitID: "ca-app-pub-3940256099942544/1712485313", request: request) { rewarded, error in
            if let error = error {
                print("[HomeView] > Failed to load rewarded ad with error: \(error.localizedDescription)")
                isAdLoading = false
                return
            }
            self.rewarded = rewarded
            isAdLoaded = true
            isAdLoading = false
            print("[HomeView] > Ad loaded")
        }
    }
}

extension UIApplication {
    func getRootViewController()->UIViewController {
        guard let screen = self.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        return root
    }
}
