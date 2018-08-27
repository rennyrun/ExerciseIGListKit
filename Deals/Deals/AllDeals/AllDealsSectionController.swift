//
//  AllDealsSectionController.swift
//  Deals
//
//  Created by Nakama on 20/08/18.
//  Copyright © 2018 Tokopedia. All rights reserved.
//

import UIKit
import IGListKit

final class AllDealsSectionController: ListSectionController {
    
    private var deals: [Deal]?

    override init() {
        super.init()
        self.supplementaryViewSource = self
    }
    
    override func numberOfItems() -> Int {
        return deals?.count ?? 0
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        let width = collectionContext?.containerSize.width ?? 0
        
        return CGSize(width: width - 32, height: 246)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(withNibName: "AllDealsCell", bundle: nil, for: self, at: index) as? AllDealsCell else {
            fatalError()
        }
        if let object = deals?[index] {
            cell.bind(object)
        }
        return cell
    }
    
    override func didUpdate(to object: Any) {
        if let deals = object as? Deals {
            self.deals = deals.deals
        }
    }
}

extension AllDealsSectionController: ListSupplementaryViewSource {
    func supportedElementKinds() -> [String] {
        return [UICollectionElementKindSectionHeader]
    }
    
    func sizeForSupplementaryView(ofKind elementKind: String, at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 54)
    }
    
    func viewForSupplementaryElement(ofKind elementKind: String, at index: Int) -> UICollectionReusableView {
        guard let header = collectionContext?.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, for: self, nibName: "DealsSectionHeaderView", bundle: nil, at: index) as? DealsSectionHeaderView else {
            fatalError()
        }
        header.titleLabel.text = "All Deals"
        return header
    }
}
