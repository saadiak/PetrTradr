//
//  ContactViewController.swift
//  PetrTradr
//
//  Created by Saadia Karim on 2/2/20.
//  Copyright © 2020 Safiyah Lakhany. All rights reserved.
//

import UIKit
import Alamofire
import Parse

class ContactViewController: UIViewController {

    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var messageField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var userNameRequest: String?
    
    @IBAction func sendMessage(_ sender: Any) {
        
        var userData =  [PFObject]()
        let query = PFQuery(className: "_User")
        let user = userNameRequest?.replacingOccurrences(of: "@", with: "")
        query.whereKey("username", equalTo: user)
        query.findObjectsInBackground { (request, error) in
              if request != nil
              {
                userData = request!
              }
            
            //Then you can access user_data[0][“phone_number”]
            let num = "+1" + String(userData[0]["phone_number"] as! String)
            let url = "https://api.twilio.com/2010-04-01/Accounts/AC7cfd2ae05be5d65652bf07532561cf34/Messages"
            let messageText = self.messageField.text ?? ""
            let parameters = ["From": "+19172424683", "To": num, "Body": messageText]
             
            Alamofire.request(url, method: .post, parameters: parameters)
              .authenticate(user: "AC7cfd2ae05be5d65652bf07532561cf34", password: "88f6d63250223ece2d5aeb93caea800a")
              .responseJSON { response in
                debugPrint(response)
            }
            //self.navigationController?.popToRootViewController(animated: true)
            let alert = UIAlertController(title: "Success!", message: "Message sent!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {
                action in
                self.navigationController?.popToRootViewController(animated: true)
            }))
            self.present(alert, animated: true, completion: nil)
            }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
