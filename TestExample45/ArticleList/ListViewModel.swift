//
//  ListViewModel.swift
//  TestExample45
//
//  Created by Uday Venkat on 13/06/24.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var listData: [Item] = [Item]()
    private let apiService: APIServiceProtocol = APIService()
    private let coreDataService = CoreDataService()
    
    func fetchListData() {
        if NetworkMonitor.shared.isConnected {
            apiService.fetchListData { [weak self] result in
                switch result {
                case .success(let list):
                    self?.coreDataService.saveList(list)
                    self?.listData = self?.coreDataService.fetchList() ?? []
                case .failure(let error):
                    print("Failed to fetch list: \(error)")
                }
            }
        }
        else {
            listData = coreDataService.fetchList()
        }
    }
    
    func formatDate(_ date: Date?) -> String {
        guard let date = date else { return "" }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        return dateFormatter.string(from: date)
    }
}
