import Foundation

// FIXME: Temporary
class GroupsRepository {
    
    // MARK: - Properties
    var groups: [Group] = []
    
    // MARK: - Methods
    func saveGroup(_ group: Group) {
        groups.append(group)
    }
    
    func removeGroup(_ group: Group) {
        groups.removeAll { $0 == group }
    }
}
