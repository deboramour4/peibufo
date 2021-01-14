import Foundation

class Bill {
    
    // MARK: - PaymentMethod
    enum PaymentMethod {
        case cash
        case creditCard
        case debitCard
    }
    
    // MARK: - Properties
    var payer: Member
    var amount: Double
    var timestamp: Date
    var paymentMethod: PaymentMethod
    weak var group: Group?
    
    // MARK: - Initializer
    init(payer: Member, amount: Double, paymentMethod: PaymentMethod, group: Group) {
        self.payer = payer
        self.amount = amount
        self.timestamp = Date()
        self.paymentMethod = paymentMethod
        self.group = group
    }
}

extension Bill: Equatable {
    static func == (lhs: Bill, rhs: Bill) -> Bool {
        lhs.payer == rhs.payer &&
        lhs.amount == rhs.amount &&
        lhs.timestamp == rhs.timestamp &&
        lhs.paymentMethod == rhs.paymentMethod &&
        lhs.group?.title == rhs.group?.title
    }
}
