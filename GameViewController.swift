//
//  GameViewController.swift
//  BarabaraGame
//
//  Created by 共田 恭輔 on 2016/02/20.
//  Copyright © 2016年 共田 恭輔. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet var imgview1: UIImageView!
    @IBOutlet var imgview2: UIImageView!
    @IBOutlet var imgview3: UIImageView!
    
    
    @IBOutlet var resultLabel:UILabel!
    
    var timer: NSTimer!
    var score: Int = 1000
    let defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    let width: CGFloat = UIScreen.mainScreen().bounds.size.width
    
    var positionX: [CGFloat] = [0.0,0.0,0.0]
    var dx : [CGFloat] = [1.0,0.5, -1.0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        positionX = [width/2,width/2,width/2]
        self.start()
        
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
    
    func start(){
        resultLabel.hidden = true
        timer = NSTimer.scheduledTimerWithTimeInterval(0.005, target: self, selector: "up", userInfo: nil, repeats: true)
    }
    
    func up(){
        for i in 0..<3 {
            if positionX[i] > width || positionX[i] < 0 {
                dx[i] = dx[i]*(-1)
            }
            
            positionX[i] += dx[i]
            
        }
        imgview1.center.x = positionX[0]
        imgview2.center.x = positionX[1]
        
    }
    
    @IBAction func stop(){
        if timer.valid == true{
            timer.invalidate()
        }
        for i in 0..<3{
            score = score - abs(Int(width/2 - positionX[i]))*2
        }
        resultLabel.text = "Score:" + String(score)
        resultLabel.hidden = false
        
        var HighScore1 : Int = defaults.integerForKey("score1")
        var HighScore2 : Int = defaults.integerForKey("score2")
        var HighScore3 : Int = defaults.integerForKey("score3")
        
        if score > HighScore1 {
            defaults.setInteger(score, forKey: "score1")
            defaults.setInteger(HighScore2, forKey: "score2")
            defaults.setInteger(HighScore3, forKey: "score3")
        }else if score > HighScore2 {
            defaults.setInteger(score, forKey: "score2")
            defaults.setInteger(HighScore3, forKey: "score3")
        }else if score > HighScore3 {
            defaults.setInteger(score, forKey: "score3")
        }
        defaults.synchronize()
    }
    
    @IBAction func retry() {
        score = 1000
        positionX = [width/2,width/2,width/2]
        self.start()
    }
    @IBAction func toTop() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
   
}
