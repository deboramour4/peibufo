import Foundation

class User {
    var name: String
    var email: String
    var password: String
    var phone: Int
    
    init(name: String, email: String, password: String, phone: Int) {
        self.name = name
        self.email = email
        self.password = password
        self.phone = phone
    }
}
