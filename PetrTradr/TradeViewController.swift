//
//  TradeViewController.swift
//  PetrTradr
//
//  Created by Iqra Abbaali on 2/1/20.
//  Copyright © 2020 Safiyah Lakhany. All rights reserved.
//

import UIKit

class TradeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var tradeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tradeTableView.delegate = self
        tradeTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*let cell = UITableViewCell()
        
        cell.textLabel!.text = "row: \(indexPath.row)"
        
        return cell*/
        
        let cell = tradeTableView.dequeueReusableCell(withIdentifier: "TradeTableViewCell") as! TradeTableViewCell

        return cell
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
