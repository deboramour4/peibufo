import Foundation

class Bill {
    
    // MARK: - PaymentMethod
    enum PayentMethod {
        case cash
        case creditCard
        case debitCard
    }
    
    // MARK: - Properties
    var payer: Member
    var amount: Double
    var timestamp: Date
    var paymentMethod: PayentMethod
    weak var group: Group?
    
    // MARK: - Initializer
    init(payer: Member, amount: Double, paymentMethod: PayentMethod, group: Group) {
        self.payer = payer
        self.amount = amount
        self.timestamp = Date()
        self.paymentMethod = paymentMethod
        self.group = group
    }
}
