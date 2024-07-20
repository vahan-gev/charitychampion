
import Foundation
import SwiftUI
import WebKit

struct Charity: Identifiable {
    let id = UUID()
    let image: String
    let title: String
    let text: String
    let link: URL?
}

struct InfoView: View {
    let charities = [
        Charity(image: "allforarmenia", title: "All for Armenia", text: "Check in daily to provide nutritious foods, warm clothing, and hygiene products for the Armenian refugee families of Artsakh, many of whom are refugees indefinitely.", link: URL(string: "https://allforarmenia.org/about/ ")),
        
        Charity(image: "epilepsyfoundation", title: "Epilepsy Foundation", text: "Check in daily to improve the lives of the 3.4 million Americans affected by epilepsy through education, advocacy, research, and connection.", link: URL(string: "https://www.epilepsy.com/about/mission-values#Our-Mission")),
        
        Charity(image: "hiddenroadinitiative", title: "Hidden Road Initiative", text: "Check in daily to provide educational and leadership opportunities to underprivileged students living in remote villages in Armenia.", link: URL(string: "https://www.hiddenroadinitiative.org/mission-and-impact.html")),
        
        Charity(image: "elenaslight", title: "Elena’s Light INC", text: "Check in daily to help build brighter futures for refugee women and children through education and empowerment.", link: URL(string: "https://www.elenaslight.org/mission")),
        
        Charity(image: "sheldrickwildlife", title: "Sheldrick Wildlife Trust", text: "Check in daily to assist in the protection of wildlife and the preservation of habitats in East Africa including projects in anti-poaching, safeguarding the natural environment, enhancing community awareness, addressing animal welfare issues, providing veterinary assistance to animals in need, rescuing and hand rearing elephant and rhino orphans, along with other species that can ultimately enjoy a quality of life in wild terms when grown.", link: URL(string: "https://www.sheldrickwildlifetrust.org")),
        
        Charity(image: "worldwildlife", title: "World Wildlife", text: "Check in daily to build a future where people live in harmony with nature by conserving and restoring biodiversity, the web that supports all life on Earth; to reduce humanity's environmental footprint; and ensure the sustainable use of natural resources to support current and future generations.", link: URL(string: "https://www.worldwildlife.org")),
        
        Charity(image: "stjudes", title: "St. Judes Children’s Research Hospital", text: "Check in daily to help treat and defeat childhood cancer and other life-threatening diseases at no cost to families.", link: URL(string: "https://www.stjude.org/")),
        
        Charity(image: "camfed", title: "CAMFED", text: "Check in daily to tackle poverty, inequity, and injustice through girls’ education and women’s leadership focused on girls and young women in rural areas of Africa.", link: URL(string: "https://camfed.org/us/who-we-are/")),
        
        Charity(image: "breakthrough", title: "Breakthrough", text: "Check in daily to inspire people to fight for the rights of women and girls by catalyzing leadership in communities and building a larger movement to change deep-rooted cultural norms that perpetuate gender-based discrimination and violence in India.", link: URL(string: "https://inbreakthrough.org/our-story/")),
        // Add more charities as needed
    ]

    var body: some View {
        NavigationView {
            VStack(spacing: 4) {
                Header()
                Text("Information")
                    .font(.custom("Clash Grotesk Regular", size: 22))
                    .padding()
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(charities) { charity in
                            if let link = charity.link {
                                Link(destination: link) {
                                    VStack(spacing: 8) {
                                        Image(charity.image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 150)
                                        Text(charity.title)
                                            .font(.custom("Clash Grotesk Semibold", size: 18))
                                            .foregroundColor(.black)
                                            .fontWeight(.semibold)
                                        Text(charity.text)
                                            .font(.custom("Clash Grotesk Regular", size: 14))
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.black)
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity).background(Color(hex: 0xECECEC)).cornerRadius(10)
                                    .padding(.horizontal, 20)
                                    
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                    Spacer()
            }
        }
    }
}
