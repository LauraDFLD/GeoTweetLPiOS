//
//  Localisation.swift
//  GeoTweetLPiOS
//
//  Created by Laura Daufeld on 16/01/2017.
//  Copyright © 2017 Laura Daufeld. All rights reserved.
//

import UIKit
import TwitterKit

class LocalisationController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
         let client = TWTRAPIClient()
         let statusesShowEndpoint = "https://api.twitter.com/1.1/search/tweets.json?q=%23LPDev"
         let params = ["id": ""]
         var clientError : NSError?
         
         let request = client.urlRequest(withMethod: "GET", url: statusesShowEndpoint, parameters: params, error: &clientError)
         
         client.sendTwitterRequest(request) { (response, data, connectionError) -> Void in
            
            // si erreur de connexion
            if connectionError != nil {
                print("Error: \(connectionError)")
            }
         
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                print("json: \(json)")
            } catch let jsonError as NSError { // erreur json
                print("json error: \(jsonError.localizedDescription)")
            }
         }
    }
}
