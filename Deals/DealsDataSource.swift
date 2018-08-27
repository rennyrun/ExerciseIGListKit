//
//  DealsDataSource.swift
//  Deals
//
//  Created by Nakama on 16/08/18.
//  Copyright © 2018 Tokopedia. All rights reserved.
//

import UIKit
import IGListKit

class DealsDataSource: NSObject, ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return [DealsBanners(items: [DealsBanner(id: "1", imageUrlString: "asd"),
                                     DealsBanner(id: "2", imageUrlString: "asd"),
                                     DealsBanner(id: "3", imageUrlString: "asd"),
                                     DealsBanner(id: "4", imageUrlString: "asd")]),
                CategoryVouchers(items: [CategoryVoucher(id: "1", name: "Relaksasi"),
                                         CategoryVoucher(id: "2", name: "Makanan"),
                                         CategoryVoucher(id: "3", name: "Hiburan"),
                                         CategoryVoucher(id: "4", name: "Hotel"),
                                         CategoryVoucher(id: "5", name: "Kecantikan"),
                                         CategoryVoucher(id: "6", name: "Kegiatan"),
                                         CategoryVoucher(id: "7", name: "Jasa"),
                                         CategoryVoucher(id: "8", name: "Lainnya")]),
                Deals(type: .trending,
                      deals: [
                        Deal(id: "1", name: "aaa"),
                        Deal(id: "2", name: "bbb"),
                        Deal(id: "3", name: "ccc")]),
                DealsPopularBrands(items: [DealsPopularBrand(id: "1", imageUrlString: "asd"),
                                           DealsPopularBrand(id: "2", imageUrlString: "asd"),
                                           DealsPopularBrand(id: "3", imageUrlString: "asd"),
                                           DealsPopularBrand(id: "4", imageUrlString: "asd"),
                                           DealsPopularBrand(id: "5", imageUrlString: "asd"),
                                           DealsPopularBrand(id: "6", imageUrlString: "asd"),
                                           DealsPopularBrand(id: "7", imageUrlString: "asd"),
                                           DealsPopularBrand(id: "8", imageUrlString: "asd")]),
                Deals(type: .all,
                      deals: [
                        Deal(id: "1", name: "aaa"),
                        Deal(id: "2", name: "bbb"),
                        Deal(id: "3", name: "ccc")])]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        
        if object is DealsBanners {
            return DealsBannerSectionController()
        }
        
        if let obj = object as? Deals {
            switch obj.type {
            case .trending:
                return TrendingDealsSectionController()
            case .all:
                return AllDealsSectionController()
            }
        }
        if object is CategoryVouchers {
            return DealsVoucherCategorySectionController()
        }
        
        if object is DealsPopularBrands {
            return DealsPopularBrandsSectionController()
        }
        
        return ListSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
