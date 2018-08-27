//
//  CategoryVoucher.swift
//  Deals
//
//  Created by Nakama on 23/08/18.
//  Copyright © 2018 Tokopedia. All rights reserved.
//

import UIKit
import IGListKit

class CategoryVouchers: NSObject {
    let items: [CategoryVoucher]
    
    init(items: [CategoryVoucher]) {
        self.items = items
    }
}

extension CategoryVouchers: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return self
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? CategoryVouchers else {
            return false
        }
        return self.items == object.items
    }
}

class CategoryVoucher: NSObject {
    let id: String
    let name: String
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}

extension CategoryVoucher: ListDiffable {
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
