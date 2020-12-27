import Foundation

class Bill {
    enum PayentMethod {
        case cash
        case creditCard
        case debitCard
    }
    
    var payer: Member
    var amount: Double
    var timestamp: Date
    var paymentMethod: PayentMethod
    var group: Group
    
    init(payer: Member, amount: Double, paymentMethod: PayentMethod, group: Group) {
        self.payer = payer
        self.amount = amount
        self.timestamp = Date()
        self.paymentMethod = paymentMethod
        self.group = group
    }
}
