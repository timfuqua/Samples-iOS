import Foundation

protocol HasDataSource {
	typealias DSType
	var dataSource: [DSType] { get set }
}

class ListController {
	
	typealias DSType = String
	var dataSource: [DSType] = []
	
}

extension ListController: HasDataSource {
	
}
