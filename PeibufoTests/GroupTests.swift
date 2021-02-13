import XCTest
@testable import Peibufo

class GroupTests: XCTestCase {
    
    var debora: Member!
    var weiby: Member!
    var thalia: Member!
    var group: Group!
    var initialDate = Date()

    override func setUp() {
        debora = Member(name: "Débora", email: "deb@email.com", password: "123456", phone: 98765432)
        weiby = Member(name: "Weiby", email: "weiby@email.com", password: "123456", phone: 98765431)
        thalia = Member(name: "Thalia", email: "thalia@email.com", password: "123456", phone: 98765430)
        group = Group(title: "Maragogi/AL", description: "O caribe brasileiro.", owner: debora, initialDate: initialDate)
    }
    
    override func tearDown() {
        debora = nil
        weiby = nil
        thalia = nil
        group = nil
    }
    
    func testCreateGroup() {
        XCTAssertEqual(group.title, "Maragogi/AL")
        XCTAssertEqual(group.description, "O caribe brasileiro.")
        XCTAssertEqual(group.initialDate, initialDate)
        XCTAssertEqual(group.isArchived, false)
        XCTAssertEqual(group.owner.name, "Débora")
        XCTAssertEqual(group.numberOfMembers, 1)
        XCTAssertEqual(group.bills, [])
    }
    
    func testAddMember() {
        group.addMember(thalia)
        XCTAssertEqual(group.owner.name, "Débora")
        XCTAssertEqual(group.members.last?.name, "Thalia")
        XCTAssertEqual(group.numberOfMembers, 2)
    }
    
    func testAddBill() {
        group.addMember(thalia)
        group.addMember(weiby)
        let bill = group.addBill(payer: thalia, amount: 6.0, paymentMethod: .cash)
        _ = group.addBill(payer: debora, amount: 30.0, paymentMethod: .creditCard)
        _ = group.addBill(payer: weiby, amount: 54.0, paymentMethod: .debitCard)
        XCTAssertEqual(group.bills.count, 3)
        XCTAssertEqual(bill?.amount, 6.0)
        XCTAssertEqual(bill?.paymentMethod, .cash)
        XCTAssertEqual(bill?.payer, thalia)
        XCTAssertEqual(bill?.group, group)
    }
    
    func testAddBillMemberNotInGroup() {
        let bill = group.addBill(payer: weiby, amount: 54.0, paymentMethod: .cash)
        XCTAssertEqual(group.bills.count, 0)
        XCTAssertNil(bill)
    }
    
    func testDeleteBill() {
        group.addMember(weiby)
        group.addMember(thalia)
        _ = group.addBill(payer: debora, amount: 30.0, paymentMethod: .creditCard)
        let bill = group.addBill(payer: weiby, amount: 15.0, paymentMethod: .debitCard)
        XCTAssertEqual(group.bills.count, 2)
        XCTAssertEqual(thalia.transactions.count, 2)
        group.delete(bill: bill!)
        XCTAssertEqual(group.bills.count, 1)
        XCTAssertEqual(thalia.transactions.count, 1)
    }
    
    func testDelete() {
        group.delete()
    }

}
