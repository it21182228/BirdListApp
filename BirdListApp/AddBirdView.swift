import SwiftUI

struct AddBirdView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode

    @State private var name: String = ""
    @State private var descriptionText: String = ""

    var body: some View {
        Form {
            Section(header: Text("Bird Information")) {
                TextField("Bird Name", text: $name)
                TextField("Description", text: $descriptionText)
            }

            Button("Save Bird") {
                addBird()
                presentationMode.wrappedValue.dismiss()
            }
            .disabled(name.isEmpty || descriptionText.isEmpty)
        }
        .navigationTitle("Add Bird")
        
    }

    private func addBird() {
        let newBird = Bird(context: viewContext)
        newBird.name = name
        newBird.descriptionText = descriptionText

        do {
            try viewContext.save()
        } catch {
            print("Failed to save bird: \(error)")
        }
    }
}
