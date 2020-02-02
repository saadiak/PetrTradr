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
    
    public var delegate: PopupVCDelegate?

    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var addReminderButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var bodyContextTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DAAATEEEE", Date())
        //datePicker.minimumDate = Calendar.current.date(byAdding: .year, value: -1, to: Date())
        let currentDate = Date()
        datePicker.minimumDate = currentDate
        datePicker.date = currentDate
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelAction(_ sender: Any) {
    }
    
    @IBAction func addReminder(_ sender: Any) {
        
        let dateFormatterForDate = DateFormatter()
        dateFormatterForDate.dateFormat = "dd MMMM yyyy"
        let selectedDate = dateFormatterForDate.string(from: datePicker.date)
        let dateFormatterForTime = DateFormatter()
        dateFormatterForTime.dateFormat = "hh:mm a"
        let selectedTime = dateFormatterForTime.string(from: datePicker.date)
        let reminder = PFObject(className:"reminder")
        reminder["user"] = PFUser.current()
        reminder["date"] = selectedDate
        reminder["time"] = selectedTime
        reminder["bodyContent"] = bodyContextTextField.text
        reminder.saveInBackground{(succeeded, error) in
            if (succeeded) {
                //The object has been saved
                self.dismiss(animated: true, completion: nil)
                self.delegate?.popupDidDisappear()
            }
            else {
                //There was a problem, check error description
            }
            
        }
    }
    

    @IBAction func cancelForm(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        self.delegate?.popupDidDisappear()
    }
    

}
