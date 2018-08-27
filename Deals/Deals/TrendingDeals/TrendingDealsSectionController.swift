//
//  TrendingDealsSectionController.swift
//  Deals
//
//  Created by Nakama on 20/08/18.
//  Copyright © 2018 Tokopedia. All rights reserved.
//

import UIKit
import IGListKit

final class TrendingDealsSectionController: ListSectionController, ListAdapterDataSource {
    
    private var deals: [Deal]?
    
    lazy var adapter: ListAdapter = {
        let adapter = ListAdapter(updater: ListAdapterUpdater(),
                                  viewController: self.viewController)
        adapter.dataSource = self
        return adapter
    }()
    
    override init() {
        super.init()
        self.supplementaryViewSource = self
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 235)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: TrendingDealsContainerCell.self,
                                                                for: self,
                                                                at: index) as? TrendingDealsContainerCell else {
                                                                    fatalError()
        }
        adapter.collectionView = cell.collectionView
        return cell
    }
    
    override func didUpdate(to object: Any) {
        guard let objects = object as? Deals else {
            return
        }
        self.deals = objects.deals
    }
    
    // MARK: ListAdapterDataSource
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return self.deals ?? []
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return EmbeddedSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
}

extension TrendingDealsSectionController: ListSupplementaryViewSource {
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
        header.titleLabel.text = "Trending Deals"
        return header
    }
}

final class EmbeddedSectionController: ListSectionController {
    
    private var deal: Deal?
    
    override init() {
        super.init()
        self.inset = UIEdgeInsetsMake(16, 8, 16, 8)
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        let width = UIScreen.main.bounds.size.width - UIScreen.main.bounds.size.width/4

        return CGSize(width: width, height: 230)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(withNibName: "TrendingDealsCell", bundle: nil, for: self, at: index) as? TrendingDealsCell else {
            fatalError()
        }
        if let object = deal {
            cell.bind(object)
        }
        return cell
    }
    
    override func didUpdate(to object: Any) {
        deal = object as? Deal
    }
    
}

class TrendingDealsContainerCell: UICollectionViewCell {
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.alwaysBounceVertical = false
        view.alwaysBounceHorizontal = true
        view.contentInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        self.contentView.addSubview(view)
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.frame
    }
}
