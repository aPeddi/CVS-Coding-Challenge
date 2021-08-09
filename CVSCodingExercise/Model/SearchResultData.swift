//
//  FlickrImage.swift
//  CombineBookSearch
//
//  Created by Avinash Peddi on 08/02/21.
//  Copyright © 2020 Avinash Peddi. All rights reserved.
//

import Foundation

struct ResultItem: Codable {
	let title: String
	let link: String
	let items: [MediaItem]
}

struct MediaItem: Codable {
	let media: MediaImageItem
}

struct MediaImageItem: Codable {
	let media: String
	
	enum CodingKeys: String, CodingKey {
		case media = "m"
	}
}
