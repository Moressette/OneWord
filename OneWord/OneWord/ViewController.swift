//
//  ViewController.swift
//  OneWord
//
//  Created by 王聪 on 16/5/7.
//  Copyright © 2016年 TeamRandom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var db:SQLiteDB!
    
    
    @IBOutlet weak var showWord: UILabel!
    
    var newWords:NSString = "bbbbb"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        //db.execute("create table if not exists t_user(uid integer primary key,uname varchar(20),mobile varchar(20))")
        //如果有数据则加载
        var dta = db.query("select Word from words where ID=1")
        let row = dta[0]
        if var words = row["Word"] {
            showWord.text = words as? String
        }
        
        let userDefault = NSUserDefaults(suiteName: "group.OneWord")
        userDefault!.setObject(newWords, forKey: "com.random.OneWord.kkk")
        userDefault!.synchronize()
    }
    
    
    
    
    
    
    var id = 2
    @IBAction func okTapped(sender: AnyObject) {
        //Insert code here... :)
        var words = db.query("select Word from words where ID=?" , parameters:[id])
        let row = words[0]
        if var w = row["Word"]{
            showWord.text = w as? String
        }
        id++
        //new insert
        newWords = "ddddd"
        let userDefault = NSUserDefaults(suiteName: "group.OneWord")
       // userDefault!.removeObjectForKey("com.random.OneWord.kkk")
        userDefault!.setObject(newWords, forKey: "com.random.OneWord.kkk")
        userDefault!.synchronize()
    }
   
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

