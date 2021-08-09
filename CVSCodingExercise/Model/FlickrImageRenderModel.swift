//
//  FlickrImageDisplayData.swift
//  CVSCodingExercise
//
//  Created by Avinash Peddi on 08/02/21.
//  Copyright © 2020 Avinash Peddi. All rights reserved.
//

import Foundation
import SwiftUI

struct FlickrImageRenderModel: Identifiable, Hashable {
	let id: String = UUID().uuidString
    let title: String
    let ratings: [String]
    let summary: String
    let thumbnail: URL?
}


