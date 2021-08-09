//
//  FlickrImageFinderViewModel.swift
//  CVSCodingExercise
//
//  Created by Avinash Peddi on 08/02/21.
//  Copyright © 2020 Avinash Peddi. All rights reserved.
//

import SwiftUI
import Combine

final class FlickrImageFinderViewModel: ObservableObject {
	@Published private (set) var items = [FlickrImageRenderModel]()
    @Published var searchString = ""
    
    private var searchCancellable: Cancellable? {
        didSet {
            oldValue?.cancel()
        }
    }
    
    deinit {
        searchCancellable?.cancel()
    }
    
    init () {
        print("Init ViewModel")
        
        searchCancellable = $searchString
            .debounce(for: 0.3, scheduler: DispatchQueue.main)
            .removeDuplicates()
			/// Ground Rules for Search Text
			/// - no empty values
			/// - cannot start with whitespace
			.filter { !$0.isEmpty && $0.first != " " }
            .flatMap { (searchString) -> AnyPublisher<[MediaItem], Never> in
                print("searchString: \(searchString)")
                return FlickrImageSearchService.searchBy(string: searchString)
                    .replaceError(with: []) ///TODO: Error Handling
                    .eraseToAnyPublisher()
            }
            .map {
                self.createRenderModelItems(mediaItems: $0)
            }
            .replaceError(with: []) ///TODO: Error Handling
            .assign(to: \.items, on: self)
    }

	/// converts data model to a generic render model to be passed on to the view
	/// - Parameter mediaItems: media items obtained from service response
	/// - Returns: generic view display render models
    private func createRenderModelItems(mediaItems: [MediaItem]) -> [FlickrImageRenderModel]  {
        var renderModelItems = [FlickrImageRenderModel]()
		mediaItems.forEach { item in
			let renderModel = FlickrImageRenderModel(title: "Title", ratings: [""], summary: "", thumbnail: URL.init(string: item.media.media))
			renderModelItems.append(renderModel)
        }
        return renderModelItems
    }
}

