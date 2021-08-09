//
//  FlickrImageCell.swift
//  CVSCodingExercise
//
//  Created by Avinash Peddi on 08/02/21.
//  Copyright © 2020 Avinash Peddi. All rights reserved.
//

import SwiftUI

struct FlickrImageCell: View {
    private let renderModel: FlickrImageRenderModel
    
    init(renderModel: FlickrImageRenderModel) {
        self.renderModel = renderModel
    }
    
    var body: some View {
        HStack {
			RemoteImage(url: self.renderModel.thumbnail?.absoluteString ?? "")
				///TODO: Use placeholder imageUrl here
				.aspectRatio(contentMode: .fit)
				.frame(width: screenWidth*0.29, height: screenWidth*0.29)
        }
    }
}

#if DEBUG
let flickrDemoData = FlickrImageRenderModel(title: "FlickrImage Finder Demo", ratings: ["PG-13"], summary: "Dummy Description", thumbnail: nil)

struct FlickrImageCell_Previews : PreviewProvider {
    static var previews: some View {
		FlickrImageCell(renderModel: flickrDemoData)
            .previewLayout(.fixed(width: 300, height: 65))
            .previewDisplayName("FlickrImageCell")
    }
}
#endif

