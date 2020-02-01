//
//  ReminderFormViewController.swift
//  PetrTradr
//
//  Created by Saadia Karim on 2/1/20.
//  Copyright © 2020 Safiyah Lakhany. All rights reserved.
//

import UIKit
import Alamofire
import Parse

class ReminderFormViewController: UIViewController {

    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var addReminderButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var bodyContextTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelAction(_ sender: Any) {
    }
    
    @IBAction func addReminder(_ sender: Any) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy hh:mm"
        let selectedDate = dateFormatter.string(from: datePicker.date)
        print(selectedDate)
        let reminder = PFObject(className:"reminder")
        reminder["date"] = datePicker.date
        reminder["bodyContent"] = bodyContextTextField
        reminder.saveInBackground{(succeeded, error) in
            if (succeeded) {
                //The object has been saved
            }
            else {
                //There was a problem, check error description
            }
            
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
