//
//  HeroSection.swift
//  Little Lemon
//
//  Created by Byron Cantillano on 11/14/24.
//

import SwiftUI

struct HeroSection: View {
    var body: some View {
        HStack{
            VStack{
                Text("Little Lemon")
                    .foregroundColor(Color.primaryColor2)
                    .font(.displayFont())
                Text("Chicago")
                    .foregroundColor(.white)
                    .font(.subTitleFont())
                Text("""
         We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.
         """)
                .foregroundColor(.white)
                .font(.leadText())
            }
            .multilineTextAlignment(.leading)
            
            Image("hero-image")
                .resizable()
                .aspectRatio( contentMode: .fill)
                .frame(maxWidth: 120, maxHeight: 140)
                .clipShape(Rectangle())
                .cornerRadius(16)
            
        }.frame(maxHeight: 180)
            .background(Color.primaryColor1)
    }
}

#Preview {
    HeroSection()
}
