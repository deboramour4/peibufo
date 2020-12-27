import Foundation

class Member: User {
    var balance: Double
    
    init(name: String, email: String, password: String, phone: Int, balance: Double) {
        self.balance = balance
        super.init(name: name, email: email, password: password, phone: phone)
    }
}
