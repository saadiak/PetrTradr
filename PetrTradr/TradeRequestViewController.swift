//
//  TradeRequestViewController.swift
//  PetrTradr
//
//  Created by Iqra Abbaali on 2/1/20.
//  Copyright © 2020 Safiyah Lakhany. All rights reserved.
//

import UIKit
import Parse

class TradeRequestViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var vc:TradeViewController?
    
    let stickers = ["Original Petr", "Spooky Petr", "Thankful Petr", "Jolly Petr",
    "New Year, New Petr", "Romantic Petr", "Lucky Petr", "March Madness Petr", "Beach Bum Petr", "Eastr Petr", "Thanos Petr", "Don't Talk to Me or My Petrs Ever Again", "Grad Petr"]
    
    var want_sticker = ""
    var give_sticker = ""
    
    
    @IBOutlet weak var wantStickersPicker: UIPickerView!
    @IBOutlet weak var giveStickersPicker: UIPickerView!
    
    
    @IBAction func onSubmitRequest(_ sender: Any)
    {
        let user_request = PFObject(className: "TradeRequests")
        
        user_request["username"] = PFUser.current()?.username
        user_request["my_stickers"] = want_sticker
        user_request["want_stickers"] = give_sticker
        
        user_request.saveInBackground { (success, error) in
            if (success)
            {
                print("yeet")
            }
            
        }
        vc!.loadRequests()
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func onCancelRequest(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return stickers.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return stickers[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if pickerView.tag == 1
        {
            want_sticker = stickers[row]
        }
        else
        {
            give_sticker = stickers[row]
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
