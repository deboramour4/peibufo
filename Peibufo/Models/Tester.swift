import Foundation

class Tester {
    let debora = Member(name: "Debora", email: "deb@email.com", password: "123456", phone: 98765432)
    let weiby = Member(name: "Weiby", email: "weiby@email.com", password: "123456", phone: 98765431)
    let thalia = Member(name: "Thalia", email: "thalia@email.com", password: "123456", phone: 98765430)
    lazy var group = Group(title: "Viagem tal", description: "Super legal", owner: debora, initialDate: Date())
    
    init() {
        testCreateGroup()
        testAddBills()
    }
    
    func testCreateGroup() {
        group.addMember(weiby)
        group.addMember(thalia)
        
        print("\n----- GROUP ------")
        print("Title: \(group.title)")
        print("Description: \(group.description ?? String())")
        print("Initial date: \(group.initialDate)")
        print("Is archived: \(group.isArchived)")
        print("Owner: \(group.owner.name)")
        print("Members: \(group.members)")
    }
    
    func testAddBills() {
        group.addBill(payer: debora, amount: 30.0, paymentMethod: .cash)
        group.addBill(payer: thalia, amount: 6.0, paymentMethod: .cash)
        group.addBill(payer: weiby, amount: 54.0, paymentMethod: .cash)
        
        print("\n----- BALANCE ------")
        debora.printMembersBalance()
        weiby.printMembersBalance()
        thalia.printMembersBalance()
    }
}
