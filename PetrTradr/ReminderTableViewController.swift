//
//  ReminderTableViewController.swift
//  PetrTradr
//
//  Created by Saadia Karim on 2/1/20.
//  Copyright © 2020 Safiyah Lakhany. All rights reserved.
//

import UIKit
import Parse

protocol PopupVCDelegate {
    func popupDidDisappear()
}

class ReminderTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, PopupVCDelegate {

    @IBOutlet var tableView: UITableView!
    var reminderList = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.queryForDatabase()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    func queryForDatabase(){
        let query = PFQuery(className:"reminder")
        query.includeKeys(["date", "time", "bodyContent"])
        query.findObjectsInBackground { (objects, error) in
          if let objects = objects {
            //Success!
            self.reminderList = objects
            self.tableView.reloadData()
            print(self.reminderList)
          }
          else {
            //Fail!
            print("ERROR: ReminderTableViewController in viewDidLoad()")
          }
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "reminderCell") as! ReminderCell
        cell.dateLabel.text = self.reminderList[indexPath.row]["date"] as? String
        cell.timeLabel.text = self.reminderList[indexPath.row]["time"] as? String
        cell.contentLabel.text = self.reminderList[indexPath.row]["bodyContent"] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.reminderList.count
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "remindVC") {
            let destinationVC = segue.destination as! ReminderFormViewController
            destinationVC.delegate = self
        }
    }
    
    func popupDidDisappear() {
        //This method will be called when the popup is closed
        self.queryForDatabase()
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
