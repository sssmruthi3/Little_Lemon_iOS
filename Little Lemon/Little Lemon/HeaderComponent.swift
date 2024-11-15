//
//  HeaderComponent.swift
//  Little Lemon
//
//  Created by Byron Cantillano on 11/14/24.
//

import SwiftUI

struct HeaderComponent: View {
    var body: some View {
        HStack{
            Image("Logo")
            Image("Profile").resizable()
                .aspectRatio( contentMode: .fit)
                .frame(maxHeight: 50)
                .clipShape(Circle())
                .padding(.trailing)
        }
    }
}

#Preview {
    HeaderComponent()
}
