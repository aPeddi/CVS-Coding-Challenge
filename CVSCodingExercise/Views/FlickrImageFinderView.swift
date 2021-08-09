//
//  FlickrImageFinderView.swift
//  CVSCodingExercise
//
//  Created by Avinash Peddi on 08/02/21.
//  Copyright © 2020 Avinash Peddi. All rights reserved.
//

import SwiftUI

struct FlickrImageFinderView : View {
    @ObservedObject private var viewModel = FlickrImageFinderViewModel()
	
	var columns: [GridItem] =
		Array(repeating: .init(.fixed(screenWidth*0.3)), count: 3)

    
    var body: some View {
        NavigationView {
            VStack {
                CustomSearchBar(text: $viewModel.searchString)
				ScrollView {
					LazyVGrid(columns: columns, spacing: 0) {
						ForEach((viewModel.items), id: \.self) { item in
							FlickrImageCell(renderModel: item)

						  }
					}
				}
				Spacer()
			}
            .navigationBarTitle(Text("Flickr Image Search"))
        }
    }
}

#if DEBUG
struct FlickrImageFinderView_Previews : PreviewProvider {
    static var previews: some View {
        FlickrImageFinderView()
    }
}
#endif

let screenWidth = UIScreen.main.bounds.width
