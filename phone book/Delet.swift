//
//  Delet.swift
//  phone book
//
//  Created by CIEC_iMac on 16/7/5.
//  Copyright © 2016年 CIEC_iMac. All rights reserved.
//

import Foundation
import UIKit

class DeletController: UIViewController {
    var db:SQLiteDB!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        db = SQLiteDB.sharedInstance()
        db.execute("create table if not exists message(uid integer primary key,name varchar(20),phone varchar(20),mail varchar(25),adress varstring(50))")
        
    }
    
    @IBOutlet weak var a: UITextField!
    
    @IBOutlet weak var b: UITextField!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func delet(sender: AnyObject) {
        let Dname=a.text!
        let Dphone=b.text!
        if Dname==""{
            if Dphone==""{
            }else{
                let sql="delete from message where phone = '\(Dphone)'"
                print("aql:\(sql)")
                let result=db.execute(sql)
                print(result)
            }
            
        }else{
        let sql = "delete from message where name = '\(Dname)'"
        print("aql:\(sql)")
        let result = db.execute(sql)
            print(result)
        }
        
    }
    @IBAction func deletall(sender: AnyObject) {
        let sql="delete from message"
        print("aql:\(sql)")
        let result = db.execute(sql)
        print(result)
        
    }
    
}