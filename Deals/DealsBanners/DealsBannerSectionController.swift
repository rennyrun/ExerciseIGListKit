//
//  DealsBannerSectionController.swift
//  Deals
//
//  Created by Nakama on 20/08/18.
//  Copyright © 2018 Tokopedia. All rights reserved.
//

import UIKit
import IGListKit

final class DealsBannerSectionController: ListSectionController {
    
    private var banners: [DealsBanner]?
    
    override init() {
        super.init()
        self.supplementaryViewSource = self
    }
    override func numberOfItems() -> Int {
        return 0
    }
    override func didUpdate(to object: Any) {
        if let banners = object as? DealsBanners {
            self.banners = banners.items
        }
    }
}

extension DealsBannerSectionController: ListSupplementaryViewSource {
    func supportedElementKinds() -> [String] {
        return [UICollectionElementKindSectionHeader]
    }
    
    func sizeForSupplementaryView(ofKind elementKind: String, at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 228)
    }
    
    func viewForSupplementaryElement(ofKind elementKind: String, at index: Int) -> UICollectionReusableView {
        guard let header = collectionContext?.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, for: self, nibName: "DealsHeaderView", bundle: nil, at: index) as? DealsHeaderView else {
            fatalError()
        }
        return header
    }
}
