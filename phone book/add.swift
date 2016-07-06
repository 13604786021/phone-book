//
//  add.swift
//  phone book
//
//  Created by CIEC_iMac on 16/7/4.
//  Copyright © 2016年 CIEC_iMac. All rights reserved.
//

import Foundation
import UIKit

class addController: UIViewController {
    var db:SQLiteDB!
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var mail: UITextField!
    @IBOutlet weak var adress: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        db = SQLiteDB.sharedInstance()
       
         db.execute("create table if not exists message(uid integer primary key,name varchar(20),phone varchar(20),mail varchar(25),adress varstring(50))")
        
    }
    
    @IBAction func a(sender: AnyObject) {
        let uname = self.name.text!
        let uphone = self.phone.text!
        let umail = self.mail.text!
        let uadress = self.adress.text!
        let sql = "insert into message(name,phone,mail,adress) values('\(uname)','\(uphone)','\(umail)','\(uadress)')"
        print("aql:\(sql)")
        let result = db.execute(sql)
        print(result)
        name.text=""
        phone.text=""
        mail.text=""
        adress.text=""
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
}
    

