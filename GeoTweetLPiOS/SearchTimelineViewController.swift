//
//  SearchTimelineViewController.swift
//  GeoTweetLPiOS
//
//  Created by Laura Daufeld on 13/01/2017.
//  Copyright © 2017 Laura Daufeld. All rights reserved.
//

import UIKit
import TwitterKit

class SearchTimelineViewController: TWTRTimelineViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // ajoute une marge en haut
        self.tableView.contentInset = UIEdgeInsetsMake(30, 0, 0, 0);
        
        let client = TWTRAPIClient()
        self.dataSource = TWTRSearchTimelineDataSource(searchQuery: "#LPDev since:2017-01-01", apiClient: client)
    }
}
