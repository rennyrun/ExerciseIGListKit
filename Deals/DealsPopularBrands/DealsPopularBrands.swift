//
//  DealsPopularBrands.swift
//  Deals
//
//  Created by Nakama on 23/08/18.
//  Copyright © 2018 Tokopedia. All rights reserved.
//

import UIKit
import IGListKit

class DealsPopularBrands: NSObject {
    let items: [DealsPopularBrand]
    
    init(items: [DealsPopularBrand]) {
        self.items = items
    }
}

extension DealsPopularBrands: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return self
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? DealsPopularBrands else {
            return false
        }
        return self.items == object.items
    }
}

class DealsPopularBrand: NSObject {
    let id: String
    let imageUrlString: String
    
    init(id: String, imageUrlString: String) {
        self.id = id
        self.imageUrlString = imageUrlString
    }
}

extension DealsPopularBrand: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return id as NSString
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? DealsPopularBrand else {
            return false
        }
        return self.id == object.id
    }
}
