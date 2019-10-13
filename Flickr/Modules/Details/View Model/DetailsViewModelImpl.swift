//
//  DetailsViewModelImpl.swift
//  Flickr
//
//  Created by Герман on 9/15/19.
//  Copyright © 2019 Nikita Semenov. All rights reserved.
//

import UIKit

class DetailsViewModelImpl: DetailsViewModel {
    var id: String = ""
    
    var owner: String = ""
    
    var ispublic: Int = 0
    
    var isfriend: Int = 0
    
    var isfamily: Int = 0
    
    var title: String = ""
    
    var url: URL? {
        return URL(string: "https://farm\(photo.farm).staticflickr.com/\(photo.server)/\(photo.id)_\(photo.secret)_b.jpg")
    }
    var isFav: Bool  {
        get {
            return state.getPhoto(id: photo.id).1
        }
        set {
            print("\(#function) \(isFav)")
            state.updatePhoto(id: photo.id, isFav: isFav)
            favButtonTitle.value = isFav ? "❤️ Лайк" : "♡ Лайк"
        }
    }
    private let state: AppState
    private let photo: Photo
    
    init(state: AppState, photoId: String) {
        self.photo = state.getPhoto(id: photoId).0
        self.state = state
    }
    var favButtonTitle: Observable<String> = Observable<String>()
}
