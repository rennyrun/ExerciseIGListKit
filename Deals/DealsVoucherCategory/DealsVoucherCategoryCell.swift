//
//  DealsVoucherCategoryCell.swift
//  Deals
//
//  Created by Nakama on 23/08/18.
//  Copyright © 2018 Tokopedia. All rights reserved.
//

import UIKit

class DealsVoucherCategoryCell: UICollectionViewCell {

    @IBOutlet weak var label: UILabel!
    
    func bind(_ categoryVoucher: CategoryVoucher) {
        self.label.text = categoryVoucher.name
    }

}
