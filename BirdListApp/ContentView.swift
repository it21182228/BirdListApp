import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        entity: Bird.entity(),
        sortDescriptors: []
    ) private var birds: FetchedResults<Bird>

    var body: some View {
        
            
            NavigationView {
                List {
                    ForEach(birds, id: \.self) { bird in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(bird.name ?? "Unknown Bird")
                                    .font(.headline)
                               
                        
                                Text(bird.descriptionText ?? "No Description")
                                    .font(.subheadline)
                                    
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                navigateToEdit(bird: bird)
                            }) {
                                Image(systemName: "pencil")
                                    .foregroundColor(.blue)
                            }
                            .buttonStyle(BorderlessButtonStyle())
                            
                            
                            Button(action: {
                                deleteBird(bird: bird)
                            }) {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                            .buttonStyle(BorderlessButtonStyle())
                        }
                    }
                }
                .navigationTitle("Bird List")
                .foregroundColor(.blue)
                
                
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: AddBirdView()) {
                            Text("Add Bird")
                        }
                    }
                }
            }
        }
    
    private func navigateToEdit(bird: Bird) {
        
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = scene.windows.first,
           let rootView = window.rootViewController {
            let editBirdView = UIHostingController(rootView: EditBirdView(bird: bird).environment(\.managedObjectContext, viewContext))
            rootView.present(editBirdView, animated: true, completion: nil)
        }
    }

    private func deleteBird(bird: Bird) {
        viewContext.delete(bird)
        saveContext()
    }

    private func saveContext() {
        do {
            try viewContext.save()
        } catch {
            print("Error saving context: \(error)")
        }
    }
}
