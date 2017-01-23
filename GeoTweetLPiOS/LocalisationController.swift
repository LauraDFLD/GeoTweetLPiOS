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
        
        /*Twitter.sharedInstance().APIClient.sendTwitterRequest("https://api.twitter.com/1.1/search/tweets.json?q=%23LPDev") {
            (response, data, connectionError) -> Void in
            if (connectionError == nil) {
                var jsonError : NSError?
                let parsedResult  =
                    NSJSONSerialization.JSONObjectWithData(data,
                                                           options: nil,
                                                           error: &jsonError) as NSDictionary
                println(parsedResult)
                if let tweets = parsedResult["status"] as? NSDictionary {
                    println(tweets)
                    for tweetsDict in tweets {
                        let title = tweetsDict["text"] as NSString
                        println("text: \(title)")
                        let coordinates = tweetsDict["coordinates"]
                        println("coordinates: \(coordinates)\n")
                    }
                }else {
                    println("Error: \(connectionError)")
                }
                
            }*/
        
        
        // Create an array of tweet model objects from a JSON array
        /*let tweetData = TWTRTweet.tweetsWithJSONArray("https://api.twitter.com/1.1/search/tweets.json?q=%23LPDev")
        //tableView.reloadData()
        
        //create Tweet cells
        
        override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let tweet = tweetData[indexPath.row]
            let cell = tableView.dequeueReusableCellWithIdentifier(tweetTableReuseIdentifier, forIndexPath: indexPath) as TWTRTweetTableViewCell
            cell.configureWithTweet(tweet)
            
            print(cell)
            
            return cell
        }*/

        
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
                let json = try JSONSerialization.jsonObject(with: data!, options: []) as! [String:Any]
                let statuses = json["statuses"]
                print("json: \(statuses)")
                //let created = statuses["created_at"]
                //print("created: \(created)")
                /*if json["statuses"] != nil {
                    let currentConditions = json[0] as! [String:Any]
                    print(currentConditions)
                }*/
                
            } catch let jsonError as NSError { // erreur json
                print("json error: \(jsonError.localizedDescription)")
            }
            
         }
        
        /*let urlString = "https://api.twitter.com/1.1/search/tweets.json?q=%23LPDev"
        
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with:url!) { (data, response, error) in
            if error != nil {
                print(error)
            } else {
                do {
                    
                    let parsedData = try JSONSerialization.jsonObject(with: data!, options: []) as! [String:Any]
                    //let currentConditions = parsedData["currently"] as! [String:Any]
                    
                    print(parsedData)
                    
                } catch let error as NSError {
                    print(error)
                }
            }
            
            }.resume()*/
        
        
    }
}
