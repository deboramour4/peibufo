import Foundation

class Transaction {
    
    // MARK: - Properties
    var amount: Double
    var member: Member
    var bill: Bill
    
    // MARK: - Initializer
    init(amount: Double, member: Member, bill: Bill) {
        self.amount = amount
        self.member = member
        self.bill = bill
    }
}

class Credit: Transaction { }

class Debit: Transaction {
    override init(amount: Double, member: Member, bill: Bill) {
        super.init(amount: -amount, member: member, bill: bill)
    }
}
