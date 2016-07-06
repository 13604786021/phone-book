//
//  phonelookup.swift
//  phone book
//
//  Created by CIEC_iMac on 16/7/5.
//  Copyright © 2016年 CIEC_iMac. All rights reserved.
//

import Foundation
import UIKit

class phonelookupController: UIViewController {
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
    @IBOutlet weak var lookphone: UITextField!
    @IBOutlet weak var textp: UITextView!
    @IBAction func seekphone(sender: AnyObject) {
        var lookp = lookphone.text!
        let data = db.query("select * from message where phone='\(lookp)'")
        for i in 0 ..< data.count {
            var user=data[i]
            textp.text!+="用户名：" + String(user["name"]!) + "\n\n" + "电话号：" + String(user["phone"]!) + "\n\n"
            textp.text!+="邮箱：" + String(user["mail"]!) + "\n\n" + "地址:"+String(user["adress"]!) + "\n\n"
            
            
            
        }
       lookphone.text=""
    }
    
}
