//
//  Namelookup.swift
//  phone book
//
//  Created by CIEC_iMac on 16/7/5.
//  Copyright © 2016年 CIEC_iMac. All rights reserved.
//

import Foundation
import UIKit

class NamelookupController: UIViewController {
    var db:SQLiteDB!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        db = SQLiteDB.sharedInstance()
        
        db.execute("create table if not exists message(uid integer primary key,name varchar(20),phone varchar(20),mail varchar(25),adress varstring(50))")
        
    }
    
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var seekT: UITextField!
    @IBOutlet weak var seekup: UITextView!
    @IBAction func seek(sender: AnyObject) {
        
        var lookn = seekT.text!
        let data = db.query("select * from message where name='\(lookn)'")
        for i in 0 ..< data.count {
            var user=data[i]
            seekup.text!+="用户名：" + String(user["name"]!) + "\n\n" + "电话号：" + String(user["phone"]!) + "\n\n"
            seekup.text!+="邮箱：" + String(user["mail"]!) + "\n\n" + "地址:"+String(user["adress"]!) + "\n\n"
        }
    }
}