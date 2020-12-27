import Foundation

class Group {
    var title: String
    var description: String?
    var owner: Member
    var members: [Member]
    var isArchived: Bool
    
    init(title: String, description: String? = nil, owner: Member, members: [Member]) {
        self.title = title
        self.description = description
        self.owner = owner
        self.members = members
        self.isArchived = false
    }
}
