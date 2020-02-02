//
//  TradeViewController.swift
//  PetrTradr
//
//  Created by Iqra Abbaali on 2/1/20.
//  Copyright © 2020 Safiyah Lakhany. All rights reserved.
//

import UIKit
import Parse

class TradeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var tradeTableView: UITableView!
    
    var requests = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tradeTableView.delegate = self
        tradeTableView.dataSource = self
        // Do any additional setup after loading the view.
        loadRequests()
    }
    
    func loadRequests()
    {
        let query = PFQuery(className: "TradeRequests")
        query.includeKeys(["user"])
        
        query.findObjectsInBackground { (request, error) in
            if request != nil
            {
                self.requests = request!
                self.tradeTableView.reloadData()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        loadRequests()
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return requests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tradeTableView.dequeueReusableCell(withIdentifier: "TradeTableViewCell") as! TradeTableViewCell
        
        let current_request = requests[indexPath.row]
        
        cell.usernameLabel.text = current_request["username"] as! String
        cell.willingToGiveLabel.text = current_request["my_stickers"] as! String
        cell.lookingForLabel.text = current_request["want_stickers"] as! String

        return cell
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "makeRequestSegue"
        {
            let destination = segue.destination as! TradeRequestViewController
            destination.vc = self
        }
        

    }

}
