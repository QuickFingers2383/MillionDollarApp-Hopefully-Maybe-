//
//  ContentView.swift
//  MillionDollarApp(hopefully(maybe))
//
//  Created by Yanjun Wang on 9/4/21.
//

import SwiftUI
import CoreData


struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    @State private var settingsView = false
    @State private var newUser = true
    @State var didDismiss = false

    @State var theColorScheme: ColorScheme = .light

    func toggleColorScheme() {
        theColorScheme = (theColorScheme == .dark) ? .light : .dark
    }
    
    func toggleSettingsView() -> SettingsView {
        guard settingsView == false else { return SettingsView() }
        return SettingsView()
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    Text("Post Title").foregroundColor(Color("accent")).bold().font(.title)
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color.gray)
                        .frame(width: 300, height: 400)
                    Text("Posted on \(item.timestamp!, formatter: itemFormatter)").foregroundColor(Color("accent")).bold()
                }
                .onDelete(perform: deleteItems)
                Button(action: addItem) {
                    Label("Add Item", systemImage: "plus")
                }
            }
//            Button(action: {
//                settingsView.toggle()
//            }) {
//                Image(systemName: "gear")
//                    .resizable()
//                    .frame(width: 30, height: 30, alignment: .trailing)
//            }

            
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .accentColor(Color("accent"))
            .background(Color("accent"))
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarTitle("Berri")
            .navigationBarItems(trailing:
                Button(action: {
                    settingsView.toggle()
                }) {
                    Image(systemName: "gear")
                        .resizable()
                        .frame(width: 30, height: 30, alignment: .trailing)
                })
            .navigationBarHidden(false)
            .toolbar {
                #if os(iOS)
                EditButton()
                #endif

                Button(action: addItem) {
                    Label("Add Item", systemImage: "plus")
                }
            
            }
            
        }

        .sheet(isPresented: $newUser) {
            VStack {
                NewUserView()
                Button("Dismiss",
                       action: { newUser.toggle() })

            }
        }
        .sheet(isPresented: $settingsView) {
            SettingsView()
            Button("Dismiss",
                   action: {settingsView.toggle() })
        }
        .colorScheme(theColorScheme)
    }
        
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
}


private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
