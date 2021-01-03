import Foundation

class User {
    
    // MARK: - Properties
    var name: String
    var email: String
    var password: String
    var phone: Int
    
    // MARK: - Initalizer
    init(name: String, email: String, password: String, phone: Int) {
        self.name = name
        self.email = email
        self.password = password
        self.phone = phone
    }
}
