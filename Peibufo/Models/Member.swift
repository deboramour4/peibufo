import Foundation

class Member: User {
    
    // MARK: - Properties
    var transactions: [Transaction] = []
    
    // MARK: - Computed vars
    
    /// A positive balance means that, in resume, this member will receive money and a negative one means that she will pay money.
    var balance: Double {
        calculateBalance()
    }
    
    /// A positive balance means that this member will receive money from other member. And a negative balance means that she will pay money for other member.
    var membersBalance: [Member: Double] {
        calculateMembersBalance()
    }
    
    // MARK: - Methods
    
    /// Will recieve an amount of money from a specific member.
    func credit(amount: Double, from member: Member, bill: Bill) {
        let credit = Credit(amount: amount, member: member, bill: bill)
        transactions.append(credit)
    }
    
    /// Need to pay an amount of money to a specific member.
    func debit(amount: Double, bill: Bill) {
        let debit = Debit(amount: amount, member: bill.payer, bill: bill)
        transactions.append(debit)
    }
    
    /// Delete all transactions related to a specific bill
    func deleteTransactions(of bill: Bill) {
        transactions.removeAll { $0.bill == bill}
    }
    
    // MARK: - Helpers
    private func calculateBalance() -> Double {
        membersBalance.reduce(0.0) { (balance, billBalance) in
            balance + billBalance.value
        }
    }
    
    private func calculateMembersBalance() -> [Member: Double] {
        var membersBalance: [Member: Double] = [:]
        for transaction in transactions {
            if let balance = membersBalance[transaction.member] {
                membersBalance[transaction.member] = balance + transaction.amount
            } else {
                membersBalance[transaction.member] = transaction.amount
            }
        }
        return membersBalance
    }
}

extension Member: Equatable, Hashable {
    static func == (lhs: Member, rhs: Member) -> Bool {
        lhs.email == rhs.email
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(email)
    }
}
