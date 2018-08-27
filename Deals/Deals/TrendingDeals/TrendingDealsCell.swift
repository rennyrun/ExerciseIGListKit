//
//  Created by Sebastian Boldt on 06.03.18.
//  Copyright © 2018 Sebastian Boldt. All rights reserved.
//

import UIKit

class TrendingDealsCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!

    func bind(_ deal: Deal) {
        self.nameLabel.text = deal.name
    }
}
