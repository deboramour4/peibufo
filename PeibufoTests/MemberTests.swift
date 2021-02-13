import XCTest
@testable import Peibufo

class MemberTests: XCTestCase {
    
    var maria: Member!
    var joao: Member!
    var member: Member!
    var group: Group!

    override func setUp() {
        maria = Member(name: "Maria", email: "maria@email.com", password: "123456", phone: 98765432)
        joao = Member(name: "João", email: "joao@email.com", password: "123456", phone: 98765431)
        member = Member(name: "Ana", email: "ana@email.com", password: "123456", phone: 98765430)
        group = Group(title: "Fernando de Noronha", description: "Férias", owner: member, initialDate: Date())
        group.addMember(maria)
        group.addMember(joao)
    }
    
    override func tearDown() {
        maria = nil
        joao = nil
        member = nil
        group = nil
    }
    
    func testBalance() {
        _ = group.addBill(payer: joao, amount: 24.0, paymentMethod: .cash)
        _ = group.addBill(payer: maria, amount: 150.0, paymentMethod: .debitCard)
        XCTAssertEqual(member.balance, -58)
        XCTAssertEqual(maria.balance, 92)
        XCTAssertEqual(joao.balance, -34)
    }
    
    func testMembersBalance() {
        _ = group.addBill(payer: maria, amount: 150.0, paymentMethod: .creditCard)
        XCTAssertEqual(member.membersBalance[joao], nil)
        XCTAssertEqual(member.membersBalance[maria], -50)
        XCTAssertEqual(joao.membersBalance[maria], -50)
        XCTAssertEqual(joao.membersBalance[member], nil)
        XCTAssertEqual(maria.membersBalance[member], 50)
        XCTAssertEqual(maria.membersBalance[joao], 50)
    }
    
    func testCredit() {
        let bill = Bill(payer: member, amount: 60.0, paymentMethod: .creditCard, group: group)
        member.credit(amount: 20.0, from: maria, bill: bill)
        member.credit(amount: 20.0, from: joao, bill: bill)
        XCTAssertEqual(member.transactions.count, 2)
        XCTAssertEqual(member.transactions[0].bill, bill)
        XCTAssertEqual(member.transactions[0].amount, 20)
        XCTAssertEqual(member.transactions[1].member, joao)
    }
    
    func testDebit() {
        let bill = Bill(payer: maria, amount: 33.0, paymentMethod: .debitCard, group: group)
        member.debit(amount: 11.0, bill: bill)
        XCTAssertEqual(member.transactions.count, 1)
        XCTAssertEqual(member.transactions[0].bill, bill)
        XCTAssertEqual(member.transactions[0].amount, -11)
        XCTAssertEqual(member.transactions[0].member, maria)
    }
    
    func testDeleteTransactions() {
        let bill1 = Bill(payer: maria, amount: 33.0, paymentMethod: .debitCard, group: group)
        member.debit(amount: 11.0, bill: bill1)
        let bill2 = Bill(payer: member, amount: 102.0, paymentMethod: .debitCard, group: group)
        member.credit(amount: 34.0, from: maria, bill: bill2)
        member.credit(amount: 34.0, from: joao, bill: bill2)
        XCTAssertEqual(member.transactions.count, 3)
        member.deleteTransactions(of: bill2)
        XCTAssertEqual(member.transactions.count, 1)
    }
}
