//
//  ViewController.swift
//  GeoTweetLPiOS
//
//  Created by Laura Daufeld on 13/01/2017.
//  Copyright © 2017 Laura Daufeld. All rights reserved.
//

import UIKit
import TwitterKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // LOGIN BUTTON TWITTER //
        
        let logInButton = TWTRLogInButton { (session, error) in
            if let unwrappedSession = session {
                let alert = UIAlertController(title: "Logged In",
                                              message: "User \(unwrappedSession.userName) has logged in",
                    preferredStyle: UIAlertControllerStyle.alert
                )
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            } else {
                NSLog("Login error: %@", error!.localizedDescription);
            }
        }
        // TODO: Change where the log in button is positioned in your view
        logInButton.center = self.view.center
        self.view.addSubview(logInButton)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

