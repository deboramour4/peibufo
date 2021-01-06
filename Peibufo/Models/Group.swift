import Foundation

class Group {
    
    // MARK: - Properties
    var title: String
    var description: String?
    var owner: Member
    var members: [Member] = []
    var bills: [Bill] = []
    var isArchived: Bool
    var initialDate: Date
    
    // MARK: - Computed vars
    var numberOfMembers: Int {
        members.count
    }
    
    // MARK: - Initializer
    init(title: String, description: String? = nil, owner: Member, members: [Member] = [], initialDate: Date) {
        self.title = title
        self.description = description
        self.owner = owner
        self.members = members
        self.members.append(owner)
        self.isArchived = false
        self.initialDate = initialDate
    }
    
    // MARK: - Methods
    func addMember(_ member: Member) {
        members.append(member)
    }
    
    func addBill(payer: Member, amount: Double, paymentMethod: Bill.PaymentMethod) -> Bill? {
        if payerIsInGroup(payer) {
            let bill = Bill(payer: payer, amount: amount, paymentMethod: paymentMethod, group: self)
            bills.append(bill)
            divideBill(bill)
            return bill
        } else {
            return nil
        }
    }
    
    func delete(bill: Bill) {
        bills.removeAll { $0 == bill }
        members.forEach { $0.deleteTransactions(of: bill) }
    }
    
    func delete() {
        // Delete from realm/coredata
    }
    
    // MARK: - Helpers
    private func divideBill(_ bill: Bill) {
        let amountPerMember = bill.amount/Double(numberOfMembers)
        
        let membersWithoutPayer = membersExcluding(payer: bill.payer)
        membersWithoutPayer.forEach { member in
            bill.payer.credit(amount: amountPerMember, from: member, bill: bill)
            member.debit(amount: amountPerMember, bill: bill)
        }
    }
    
    private func membersExcluding(payer: Member) -> [Member] {
        members.filter { $0 != payer }
    }
    
    private func payerIsInGroup(_ payer: Member) -> Bool {
        let payer = members.first { $0 == payer }
        return payer != nil
    }
}

extension Group: Equatable {
    static func == (lhs: Group, rhs: Group) -> Bool {
        lhs.title == rhs.title &&
        lhs.description == rhs.description &&
        lhs.owner == rhs.owner &&
        lhs.members == rhs.members &&
        lhs.bills == rhs.bills &&
        lhs.isArchived == rhs.isArchived &&
        lhs.initialDate == rhs.initialDate
    }
}
