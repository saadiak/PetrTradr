//
//  BigPetrViewController.swift
//  PetrTradr
//
//  Created by Iqra Abbaali on 2/1/20.
//  Copyright © 2020 Safiyah Lakhany. All rights reserved.
//

import UIKit
import Parse

class BigPetrViewController: UIViewController {

    @IBOutlet weak var petrImage: UIImageView!
    @IBOutlet weak var numStickerLabel: UILabel!
    @IBOutlet weak var petrNameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    var vc: ProfileViewController?
    
    @IBAction func onMinusButton(_ sender: Any)
    {
        
    }
    
    
    @IBAction func onPlusButton(_ sender: Any)
    {
        let user = PFUser.current()
        var sticker = ""
        
        switch petrNameLabel.text!
        {
            case "Graduation Petr":
                sticker = "sticker12"
            case "Spooky Petr":
                sticker = "sticker2"
            case "Turkey Petr":
                sticker = "sticker3"
            case "New Year, New Petr":
                sticker = "sticker5"
            case "Jolly Petr":
                sticker = "sticker4"
            case "Original Petr":
                sticker = "sticker1"
            case "Beach Bum Petr":
                sticker = "sticker9"
            case "March Madness Petr":
                sticker = "sticker8"
            case "Lucky Petr":
                sticker = "sticker7"
            case "Romantic Petr":
                sticker = "sticker6"
            case "Eastr Petr":
                sticker = "sticker10"
            case "Thanos Petr":
                sticker = "sticker11"
            
        default:
            sticker = "sticker1"
        }
        
        
        var temp = vc?.stickers[0][sticker] as! Int
        temp += 1
        user![sticker] = temp
        vc?.stickers[0][sticker] = temp
        
        user?.saveInBackground(block: { (success, error) in
            if success
            {
                print("added sticker")
            }
        })
        
        
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        petrImage.image = UIImage(named: vc!.imageName)
        numStickerLabel.text = String(vc?.stickerCount ?? 0)
        releaseDateLabel.text = vc?.releaseDate
        petrNameLabel.text = vc?.stickerName
        
        // Do any additional setup after loading the view.
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
