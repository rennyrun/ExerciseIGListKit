//
//  DealsVoucherCategorySectionController.swift
//  Deals
//
//  Created by Nakama on 20/08/18.
//  Copyright © 2018 Tokopedia. All rights reserved.
//

import UIKit
import IGListKit

final class DealsVoucherCategorySectionController: ListSectionController {
    
    private var categories: [CategoryVoucher]?

    override init() {
        super.init()
        self.supplementaryViewSource = self
        self.inset = UIEdgeInsetsMake(16, 16, 16, 16)
        self.minimumInteritemSpacing = 16
        self.minimumLineSpacing = 16
    }
    override func numberOfItems() -> Int {
        return categories?.count ?? 0
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        let screenWidth = UIScreen.main.bounds.size.width - 96
        let cellWidth = screenWidth/4
        let cellHeight = cellWidth + 25
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(withNibName: "DealsVoucherCategoryCell", bundle: nil, for: self, at: index) as? DealsVoucherCategoryCell else {
            fatalError()
        }
        if let object = categories?[index] {
            cell.bind(object)
        }
        return cell
    }
    
    override func didUpdate(to object: Any) {
        if let categories = object as? CategoryVouchers {
            self.categories = categories.items
        }
    }
}

extension DealsVoucherCategorySectionController: ListSupplementaryViewSource {
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
        header.titleLabel.text = "Kategori Voucher"
        return header
    }
}
