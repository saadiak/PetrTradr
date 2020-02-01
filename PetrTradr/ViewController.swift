//
//  ViewController.swift
//  PetrTradr
//
//  Created by Safiyah Lakhany on 2/1/20.
//  Copyright © 2020 Safiyah Lakhany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBAction func SignIn(_ sender: Any) {
        let vc = HomePageViewController()
        vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
        self.present(vc, animated: true, completion: nil)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

