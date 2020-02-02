//
//  ProfileViewController.swift
//  PetrTradr
//
//  Created by Iqra Abbaali on 2/1/20.
//  Copyright © 2020 Safiyah Lakhany. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var sticker1: UIButton!
    @IBOutlet weak var sticker2: UIButton!
    @IBOutlet weak var sticker3: UIButton!
    @IBOutlet weak var sticker4: UIButton!
    @IBOutlet weak var sticker5: UIButton!
    @IBOutlet weak var sticker6: UIButton!
    @IBOutlet weak var sticker7: UIButton!
    @IBOutlet weak var sticker8: UIButton!
    @IBOutlet weak var sticker9: UIButton!
    @IBOutlet weak var sticker10: UIButton!
    @IBOutlet weak var sticker11: UIButton!
    @IBOutlet weak var sticker12: UIButton!
    
    var imageName = ""
    var stickerCount = 0
    var releaseDate = ""
    var stickerName = ""
    
    var stickers = [PFObject]()
    
    var petrButtons = [UIButton]()
    var buttonNames = [String]()
    var stickerCounts = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stickerCounts = [0,0,0,0,0,0,0,0,0,0,0,0]

        // Do any additional setup after loading the view.
        loadStickers()
        
        petrButtons = [sticker1, sticker2, sticker3, sticker4, sticker5, sticker6,
        sticker7, sticker8, sticker9, sticker10, sticker11, sticker12]
        buttonNames = ["sticker1", "sticker2", "sticker3", "sticker4", "sticker5", "sticker6",
                       "sticker7", "sticker8", "sticker9", "sticker10", "sticker11", "sticker12"]
    }
    
    func loadStickers()
    {
        let user = PFUser.current()?.username
        let query = PFQuery(className: "_User")
        query.whereKey("username", equalTo: user)
                
        query.findObjectsInBackground { (request, error) in
            if request != nil
            {
                self.stickers = request!
                for n in 0...11
                {
                    let a = "sticker" + String(n+1)
                    self.stickerCounts[n] = self.stickers[0][a] as? Int ?? 0
                    
                    if self.stickerCounts[n] == 0
                    {
                        (self.petrButtons[n]).alpha = 0.30
                    }
                    else
                    {
                        (self.petrButtons[n]).alpha = 1.0
                    }
                    
                }
            }

        }
    }
    
    @IBAction func onGraduation(_ sender: Any)
    {
        imageName = "GraduationPetr"
        releaseDate = "September 2018"
        stickerName = "Graduation Petr"
        stickerCount = stickers[0]["sticker12"] as! Int
    }
    
    
    @IBAction func onThanos(_ sender: Any)
    {
        imageName = "ThanosPetr"
        releaseDate = "September 2018"
        stickerName = "Thanos Petr"
        stickerCount = stickers[0]["sticker11"] as! Int
    }
    
    @IBAction func onEaster(_ sender: Any)
    {
        imageName = "EastrPetr"
        releaseDate = "September 2018"
        stickerName = "Eastr Petr"
        stickerCount = stickers[0]["sticker10"] as! Int
    }
    
    @IBAction func onSummer(_ sender: Any)
    {
        imageName = "BeachBumPetr"
        releaseDate = "September 2018"
        stickerName = "Beach Bum Petr"
        stickerCount = stickers[0]["sticker9"] as! Int
    }
    
    @IBAction func onBBall(_ sender: Any)
    {
        imageName = "MarchMadnessPetr"
        releaseDate = "September 2018"
        stickerName = "March Madness Petr"
        stickerCount = stickers[0]["sticker8"] as! Int
    }
    
    @IBAction func onLeprechaun(_ sender: Any)
    {
        imageName = "LuckyPetr"
        releaseDate = "September 2018"
        stickerName = "Lucky Petr"
        stickerCount = stickers[0]["sticker7"] as! Int
    }
    
    @IBAction func onCupid(_ sender: Any)
    {
        imageName = "RomanticPetr"
        releaseDate = "September 2018"
        stickerName = "Romantic Petr"
        stickerCount = stickers[0]["sticker6"] as! Int
    }
    
    @IBAction func onNewYear(_ sender: Any)
    {
        imageName = "2019Petr"
        releaseDate = "September 2018"
        stickerName = "New Year, New Petr"
        stickerCount = stickers[0]["sticker5"] as! Int
    }
    
    @IBAction func onSanta(_ sender: Any)
    {
        imageName = "JollyPetr"
        releaseDate = "September 2018"
        stickerName = "Jolly Petr"
        stickerCount = stickers[0]["sticker4"] as! Int
    }
    
    @IBAction func onOG(_ sender: Any)
    {
        imageName = "OGpetr"
        releaseDate = "September 2018"
        stickerName = "Original Petr"
        stickerCount = stickers[0]["sticker1"] as! Int
    }
    
    @IBAction func onSpooky(_ sender: Any)
    {
        imageName = "SpookyPetr"
        releaseDate = "September 2018"
        stickerName = "Spooky Petr"
        stickerCount = stickers[0]["sticker2"] as! Int
    }
    
    @IBAction func onThanks(_ sender: Any)
    {
        imageName = "TurkeyPetr"
        releaseDate = "September 2018"
        stickerName = "Turkey Petr"
        stickerCount = stickers[0]["sticker3"] as! Int
    }
    
    @IBAction func onLogout(_ sender: Any)
    {
        PFUser.logOut()
        let main = UIStoryboard(name: "Main", bundle: nil)
        let logInViewController = main.instantiateViewController(identifier: "LogInScreen")
        
        
        let delegate = self.view.window?.windowScene?.delegate as! SceneDelegate
        delegate.window?.rootViewController = logInViewController
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation*/
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let dest = segue.destination as! BigPetrViewController
        dest.vc = self
    }
    

}
