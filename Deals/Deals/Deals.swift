//
//  Deals.swift
//  Deals
//
//  Created by Nakama on 21/08/18.
//  Copyright © 2018 Tokopedia. All rights reserved.
//

import UIKit
import IGListKit

enum DealType {
    case trending
    case all
}

class Deals {
    let type: DealType
    let deals: [Deal]
    
    init(type: DealType, deals: [Deal]) {
        self.type = type
        self.deals = deals
    }
}

extension Deals: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return type.hashValue as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? Deals else {
            return false
        }
        return self.type == object.type
    }
}

class Deal: NSObject {
    let id: String
    let name: String
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}

extension Deal: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return id as NSString
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? Deal else {
            return false
        }
        return self.id == object.id
    }
}

