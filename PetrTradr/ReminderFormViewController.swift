//
//  ReminderFormViewController.swift
//  PetrTradr
//
//  Created by Saadia Karim on 2/1/20.
//  Copyright © 2020 Safiyah Lakhany. All rights reserved.
//

import UIKit

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
