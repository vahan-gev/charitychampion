import Foundation

class UserData: Codable, ObservableObject {
    @Published var name: String
    @Published var balance: Int
    @Published var transactions: [Transaction]
    @Published var adsWatched: Int
    
    enum CodingKeys: String, CodingKey {
        case name
        case balance
        case transactions
        case adsWatched
    }
    
    init(name: String, balance: Int, transactions: [Transaction], adsWatched: Int) {
        self.name = name
        self.balance = balance
        self.transactions = transactions
        self.adsWatched = adsWatched
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        balance = try values.decode(Int.self, forKey: .balance)
        transactions = try values.decode([Transaction].self, forKey: .transactions)
        adsWatched = try values.decode(Int.self, forKey: .adsWatched)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(balance, forKey: .balance)
        try container.encode(transactions, forKey: .transactions)
        try container.encode(adsWatched, forKey: .adsWatched)
    }
    
    func addBalance(_ value: Int) {
        balance += value
        saveUserData()
    }
    
    func addTransaction(_ transaction: Transaction) {
        transactions.append(transaction)
        saveUserData()
    }
    
    func addWatchedAd() {
        adsWatched += 1
        saveUserData()
    }
    
    private func saveUserData() {
        if let userData = try? JSONEncoder().encode(self) {
            UserDefaults.standard.set(userData, forKey: "UserData")
        }
    }
}

struct Transaction: Codable, Hashable {
    var amount: Int = 0
    var currentDate: String = ""
}

extension UserDefaults {
    private enum Keys {
        static let userData = "UserData"
    }
    var userData: UserData? {
        get {
            guard let data = data(forKey: Keys.userData) else {
                return nil
            }
            return try? JSONDecoder().decode(UserData.self, from: data)
        }
        
        set {
            if let data = try? JSONEncoder().encode(newValue) {
                set(data, forKey: Keys.userData)
            }
        }
    }
    
    func removeUserData() {
        removeObject(forKey: Keys.userData)
    }
    
}
