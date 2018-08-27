//
//  DealsBanners.swift
//  Deals
//
//  Created by Nakama on 23/08/18.
//  Copyright © 2018 Tokopedia. All rights reserved.
//

import UIKit
import IGListKit

class DealsBanners: NSObject {
    let items: [DealsBanner]
    
    init(items: [DealsBanner]) {
        self.items = items
    }
}

extension DealsBanners: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return self
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? DealsBanners else {
            return false
        }
        return self.items == object.items
    }
}

class DealsBanner: NSObject {
    let id: String
    let imageUrlString: String
    
    init(id: String, imageUrlString: String) {
        self.id = id
        self.imageUrlString = imageUrlString
    }
}

extension DealsBanner: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return id as NSString
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? CategoryVoucher else {
            return false
        }
        return self.id == object.id
    }
}
