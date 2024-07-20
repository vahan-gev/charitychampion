import Foundation
import SwiftUI

struct EarningsView: View {
    @ObservedObject var userData: UserData
    var body: some View {
        NavigationView {
            VStack {
                Header()
                VStack(spacing: 2) {
                    Text("Total")
                        .font(.custom("Clash Grotesk Regular", size: 22)).padding(.horizontal)
                    Text("\(userData.balance)")
                        .font(.custom("Clash Grotesk Semibold", size: 120)).padding(.horizontal).foregroundColor(Color(hex:0x4aa5e2))
                    Text("Points")
                        .font(.custom("Clash Grotesk Regular", size: 22)).padding(.horizontal)
                }.frame(alignment: .center).padding()
                Text("History")
                    .font(.custom("Clash Grotesk Semibold", size: 22)).padding(.horizontal)
                ScrollView{
                    VStack(spacing: 20) {
                        ForEach(userData.transactions, id: \.self) { transaction in
                            Text("\(transaction.currentDate) | \(transaction.amount) points")
                                .font(.custom("Clash Grotesk Semibold", size: 15)).padding().foregroundColor(.black)
                                .frame(width: 300 ).padding(.horizontal, 20) .background(Color(hex:0xECECEC)).cornerRadius(20)
                        }
                    }
                }
                Spacer()
                VStack {
                    Text("Funds raised from each ad generates between $0.11 to $0.50. Google can not provide a direct conversion rate of points to dollar amount.")
                        .font(.custom("Clash Grotesk Regular", size: 10))
                        .padding()
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 20)
                        .background(Color(hex: 0xECECEC))
                        .cornerRadius(8)
                }.padding()
                
            }
        }
    }
}
