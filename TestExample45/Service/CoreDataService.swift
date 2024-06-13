//
//  CoreDataService.swift
//  TestExample45
//
//  Created by Uday Venkat on 13/06/24.
//

import CoreData

class CoreDataService {
    static let shared = CoreDataService()
    private let context = PersistenceController(inMemory: true).container.viewContext

    func saveList(_ listData: [Doc]) {
        clearList()
        listData.forEach { item in
            let itemEntity = Item(context: context)
            itemEntity.title = item.headline.main
            itemEntity.descriptionBody = item.abstract
            itemEntity.pubDate = formatDate(from: item.pub_date)
            itemEntity.imageUrl = item.multimedia.first?.url
        }
        saveContext()
    }
    
    func fetchList() -> [Item] {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        do {
            return try context.fetch(request)
        } catch {
            print("Failed to fetch list: \(error)")
            return []
        }
    }
    
    private func clearList() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = Item.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try context.execute(deleteRequest)
        } catch {
            print("Failed to clear list: \(error)")
        }
    }
    
    private func saveContext() {
        do {
            try context.save()
        } catch {
            print("Failed to save context: \(error)")
        }
    }
    
    private func formatDate(from string: String) -> Date {
        let dateFormatter = ISO8601DateFormatter()
        return dateFormatter.date(from: string) ?? Date()
    }
}
