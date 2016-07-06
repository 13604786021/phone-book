//
//  revise.swift
//  phone book
//
//  Created by CIEC_iMac on 16/7/5.
//  Copyright © 2016年 CIEC_iMac. All rights reserved.
//

import Foundation

import UIKit

class reviseController: UIViewController {
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
    
    @IBOutlet weak var rname: UITextField!
    @IBOutlet weak var rphone: UITextField!
    @IBOutlet weak var rmail: UITextField!
    @IBOutlet weak var radress: UITextField!
    @IBAction func revise(sender: AnyObject) {
        let name=rname.text!
        let phone=rphone.text!
        let mail=rmail.text!
        let adress=radress.text!
        if phone != ""{
        let sql="update message set phone='\(phone)' where name='\(name)'"
            print("aql:\(sql)")
            let result = db.execute(sql)
            print(result)
        }
        
        if mail != ""{
            let sql="update message set mail='\(mail)' where name='\(name)'"
            print("aql:\(sql)")
            let result = db.execute(sql)
            print(result)
        }
        
        if adress != ""{
            let sql="update message set adress='\(adress)' where name='\(name)'"
            print("aql:\(sql)")
            let result = db.execute(sql)
            print(result)
        }
        rname.text=""
        rphone.text=""
        rmail.text=""
        radress.text=""
    }
}