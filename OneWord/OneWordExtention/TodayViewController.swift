//
//  TodayViewController.swift
//  OneWordExtention
//
//  Created by 王聪 on 16/5/8.
//  Copyright © 2016年 TeamRandom. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {

    @IBOutlet weak var extWord: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        let userDefault = NSUserDefaults(suiteName: "group.OneWord")
        userDefault!.synchronize()
        //let labelWord = userDefault!.stringForKey("com.random.OneWord.kkk")
        let labelWord: String = userDefault?.objectForKey("com.random.OneWord.kkk") as! String
        extWord.text = labelWord

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData

        completionHandler(NCUpdateResult.NewData)
    }
    
}
