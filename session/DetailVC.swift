//
//  DetailVC.swift
//  session
//
//  Created by do duy hung on 15/09/2016.
//  Copyright © 2016 do duy hung. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    var person = Person()
    var labelName = UILabel()
    var labelMobile = UILabel()
    var labelPhoneNumber = UILabel()
    var imageCall = UIImageView()
    var imageMessenger = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        //set frame
        self.labelName.frame = CGRectMake(30,100,300,50)
        self.labelMobile.frame = CGRectMake(30,200,100,50)
        self.labelPhoneNumber.frame = CGRectMake(30, 230, 250, 50)
        self.imageCall.frame  = CGRectMake(280, 230, 50, 50)
        self.imageMessenger.frame = CGRectMake(350, 230, 50, 50)
        
        // set color
        self.labelMobile.textColor = UIColor.blueColor()
        self.view.backgroundColor = UIColor.whiteColor()

        
        //set font
        self.labelName.font = UIFont.boldSystemFontOfSize(35)
        self.labelPhoneNumber.font = UIFont.italicSystemFontOfSize(20)
        
        
        //data
        self.labelName.text = person.fullName
        self.labelPhoneNumber.text = person.numberPhone
        self.labelMobile.text = "Mobile"
        self.imageCall.image = UIImage(named: "call")
        self.imageMessenger.image = UIImage(named: "messenger")
        
        
        //addview
        self.view.addSubview(self.labelName)
        self.view.addSubview(self.labelMobile)
        self.view.addSubview(self.labelPhoneNumber)
        self.view.addSubview(imageCall)
        self.view.addSubview(imageMessenger)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
