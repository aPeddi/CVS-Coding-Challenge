//
//  APIService.swift
//  CVSCodingExercise
//
//  Created by Avinash Peddi on 08/02/21.
//  Copyright © 2020 Avinash Peddi. All rights reserved.
//

import Foundation
import Combine


enum FlickrImageSearchService {
	///Can be replaced with redirectURL for fallback behaviour
	static let dummyUrl: URL = URL.init(string: "https://google.com")!

	///Base URL for API Connection
	static var baseURL: String {
        get {
            return "https://api.flickr.com/services/feeds/photos_public.gne?format=json&tags="
        }
    }
    
    static func searchBy(string: String) -> AnyPublisher<[MediaItem], Error> {
		///Construct URL Request
		var request = URLRequest(url: URL.init(string: baseURL + string.replacingOccurrences(of: " ", with: "")) ?? dummyUrl)
        request.httpMethod = "GET"
        
        return URLSession.shared.send(request: request)
			.tryMap() { item -> Data in
				guard let data = String.init(data: item, encoding: .utf8) else { return Data() }
				let dataString = data.replacingOccurrences(of: "jsonFlickrFeed(", with: "")
				return dataString.dropLast().data(using: .utf8) ?? Data()
			}
            .decode(type: ResultItem.self, decoder: JSONDecoder())
            .tryMap {
				return $0.items
            }
            .eraseToAnyPublisher()
    }
}
