//
//  ListItem.swift
//  Little Lemon
//
//  Created by Byron Cantillano on 11/13/24.
//

import SwiftUI

struct ListItem: View {
        
    var dish: Dish
        
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 8) {
                Text(dish.title ?? "Unknown Dish")
                    .font(.sectionCategories())
                    .foregroundColor(.black)
                Text(dish.dishDescription ?? "")
                    .font(.paragraphText())
                    .foregroundColor(.primaryColor1)
                Text("\(dish.price ?? "N/A")")
                    .font(.highlightText())
                    .foregroundColor(.primaryColor1)
                
                // Add any other dish details or styling here
            }
            Image("Pasta")
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: 90, maxHeight: 90)
                .clipShape(Rectangle())
        }.padding()
            .background(Color.white)
            .cornerRadius(3)
            .shadow(radius: 5)
    }
}

#Preview {
    ListItem(dish: PersistenceController.oneDish())
}
