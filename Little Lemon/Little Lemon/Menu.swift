//
//  Menu.swift
//  Little Lemon
//
//  Created by Byron Cantillano on 11/11/24.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var searchText = ""
    @State var startersEnabled = true
    @State var mainsEnabled = true
    @State var dessertsEnabled = true
    @State var drinksEnabled = true
    
    var body: some View {
        VStack{
            HeaderComponent()
            
            VStack{
                HeroSection()
                .onAppear(){
                    getMenuData(viewContext: viewContext);
                }
                

                TextField("Search menu", text: $searchText)
                    .textFieldStyle(.roundedBorder)
            }
            
            VStack{
                
                Text("ORDER FOR DELIVERY!")
                    .font(.sectionTitle())
                    .foregroundColor(.highlightColor2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                    .padding(.leading)
                
                HStack(spacing: 20) {
                    Toggle("Starters", isOn: $startersEnabled)
                    Toggle("Mains", isOn: $mainsEnabled)
                    Toggle("Desserts", isOn: $dessertsEnabled)
                    Toggle("Drinks", isOn: $drinksEnabled)

                }
                .toggleStyle(MyToggleStyle())
                .toggleStyle(.button)
                
                FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) {
                    (dishes: [Dish]) in
                    List(dishes) { dish in
                        ListItem(dish: dish)
                    }.listStyle(PlainListStyle())
                    
                }
            }
        }
        
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
            return [NSSortDescriptor(key: "title",
                                      ascending: true,
                                      selector:
                                        #selector(NSString.localizedStandardCompare))]
        }

    func buildPredicate() -> NSPredicate {
        let search = searchText == "" ? NSPredicate(value: true) : NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        let starters = !startersEnabled ? NSPredicate(format: "category != %@", "starters") : NSPredicate(value: true)
        let mains = !mainsEnabled ? NSPredicate(format: "category != %@", "mains") : NSPredicate(value: true)
        let desserts = !dessertsEnabled ? NSPredicate(format: "category != %@", "desserts") : NSPredicate(value: true)
        let drinks = !drinksEnabled ? NSPredicate(format: "category != %@", "drinks") : NSPredicate(value: true)

        let compoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [search, starters, mains, desserts, drinks])
        return compoundPredicate
        }
}

#Preview {
    Menu()
}
