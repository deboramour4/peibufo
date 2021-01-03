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
    
    func addBill(payer: Member, amount: Double, paymentMethod: Bill.PayentMethod) {
        let bill = Bill(payer: payer, amount: amount, paymentMethod: paymentMethod, group: self)
        bills.append(bill) // Or save anywhere else
        divideBill(bill)
    }
    
    // MARK: - Helpers
    private func divideBill(_ bill: Bill) {
        let amountPerMember = bill.amount/Double(numberOfMembers)
        
        let membersWithoutPayer = membersExcluding(payer: bill.payer)
        membersWithoutPayer.forEach { member in
            bill.payer.credit(amount: amountPerMember, from: member, bill: bill)
            member.debit(amount: amountPerMember, to: bill.payer, bill: bill)
        }
    }
    
    private func membersExcluding(payer: Member) -> [Member] {
        members.filter { $0 != payer }
    }
}
