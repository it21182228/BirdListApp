import SwiftUI

struct EditBirdView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) private var presentationMode

    @ObservedObject var bird: Bird

    var body: some View {
        Form {
            Section(header: Text("Bird Information")) {
                TextField("Bird Name", text: Binding(
                    get: { bird.name ?? "" },
                    set: { bird.name = $0 }
                ))

                TextField("Description", text: Binding(
                    get: { bird.descriptionText ?? "" },
                    set: { bird.descriptionText = $0 }
                ))
            }

            Button("Save Changes") {
                saveChanges()
                presentationMode.wrappedValue.dismiss()
            }
            .disabled(bird.name?.isEmpty ?? true || bird.descriptionText?.isEmpty ?? true)
        }
        .navigationTitle("Edit Bird")
    }

    private func saveChanges() {
        do {
            try viewContext.save()
        } catch {
            print("Failed to save changes: \(error)")
        }
    }
}
