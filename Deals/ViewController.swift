//
//  ViewController.swift
//  Deals
//
//  Created by Nakama on 16/08/18.
//  Copyright © 2018 Tokopedia. All rights reserved.
//

import UIKit
import IGListKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var adapter: ListAdapter =  {
        let updater = ListAdapterUpdater()
        let adapter = ListAdapter(updater: updater,
                                  viewController: self,
                                  workingRangeSize: 1)
        adapter.collectionView = collectionView
        return adapter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adapter.dataSource = DealsDataSource()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
