import CoreData

extension Bird {
    static func fetchAll(viewContext: NSManagedObjectContext) -> [Bird] {
        let request: NSFetchRequest<Bird> = Bird.fetchRequest()
        do {
            return try viewContext.fetch(request)
        } catch {
            print("Error fetching birds: \(error)")
            return []
        }
    }
}
