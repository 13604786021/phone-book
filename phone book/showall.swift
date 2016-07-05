//
//  showall.swift
//  phone book
//
//  Created by CIEC_iMac on 16/7/4.
//  Copyright © 2016年 CIEC_iMac. All rights reserved.
//

import Foundation
import UIKit

class showallController: UIViewController {
    var db:SQLiteDB!
    
    @IBOutlet weak var show: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        db = SQLiteDB.sharedInstance()
        db.execute("create table if not exists message(uid integer primary key,name varchar(20),phone varchar(20),mail varchar(25),adress varstring(50))")
        initUser()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func initUser()  {
        
        let data = db.query("select * from message")
        for i in 0 ..< data.count {
            var user=data[i]
            show.text!+="用户名：" + String(user["name"]!) + "电话号：" + String(user["phone"]!) + "\n"
            show.text!+="邮箱：" + String(user["mail"]!) + "地址:"+String(user["adress"]!) + "\n"
        }
    }
    
}