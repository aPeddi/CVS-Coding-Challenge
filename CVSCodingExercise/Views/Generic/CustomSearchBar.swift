//
//  CustomSearchBar.swift
//  CVSCodingExercise
//
//  Created by Avinash Peddi on 08/02/21.
//  Copyright © 2020 Avinash Peddi. All rights reserved.
//

import SwiftUI

struct CustomSearchBar : View {
    @Binding var text: String
    
    var body: some View {
        ZStack {
			Color.black.opacity(0.3)
            HStack {                
                TextField("Search", text: $text)
                    .padding([.leading, .trailing], 6)
                    .frame(height: 30)
                    .background(Color.white.opacity(0.4))
                    .cornerRadius(15)
                }
                  .padding([.leading, .trailing], 14)
            }
            .frame(height: 60)
    }
}

#if DEBUG
struct CustomSearchBar_Previews : PreviewProvider {
    static var previews: some View {
        CustomSearchBar(text: .constant(""))
            .previewLayout(.fixed(width: 275, height: 55))
    }
}
#endif
