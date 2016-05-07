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
    override func viewDidLoad() {
        super.viewDidLoad()
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        //db.execute("create table if not exists t_user(uid integer primary key,uname varchar(20),mobile varchar(20))")
        //如果有数据则加载
        var dta = db.query("select Word from words where ID=13")
        let row = dta[0]
        if var words = row["Word"] {
            showWord.text = words as? String
        }
        
        //showWord.text = "123"
        //showWord.text = data as! String
        /*if data.count > 0{
            //let words = data[data.count-1]
            showWord.text = data as? String
            
        }*/
    }
    

    
    


    /*//从SQLite加载数据
    func initUser() {
        let data = db.query("select * from t_user")
        if data.count > 0 {
            //获取最后一行数据显示
            let user = data[data.count - 1]
            txtUname.text = user["uname"] as? String
            txtMobile.text = user["mobile"] as? String
        }
    }*/
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

