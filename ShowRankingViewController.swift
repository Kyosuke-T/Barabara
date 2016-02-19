//
//  ShowRankingViewController.swift
//  BarabaraGame
//
//  Created by 共田 恭輔 on 2016/02/20.
//  Copyright © 2016年 共田 恭輔. All rights reserved.
//

import UIKit

class ShowRankingViewController: UIViewController {

    @IBOutlet var Label1:UILabel!
    @IBOutlet var Label2:UILabel!
    @IBOutlet var Label3:UILabel!
    
    let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Label1.text = String(defaults.integerForKey("score1"))
        Label2.text = String(defaults.integerForKey("score2"))
        Label3.text = String(defaults.integerForKey("score3"))
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func toTop(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
