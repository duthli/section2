//
//  TableViewController.swift
//  session
//
//  Created by do duy hung on 14/09/2016.
//  Copyright © 2016 do duy hung. All rights reserved.
//

import UIKit
class TableViewController: UITableViewController {
    var arrayData : NSMutableArray!
    var dictContacts = NSMutableDictionary()
    var arrKey : NSArray!
    override func viewDidLoad() {
        super.viewDidLoad()
        createContact()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.tableView.sectionIndexBackgroundColor = UIColor.grayColor()
        self.tableView.sectionIndexColor = UIColor.purpleColor()
    }

    func createContact(){
        arrayData = NSMutableArray()
        for i in 0..<60{
            arrayData.addObject(Person())
            //let person = arrayData[i] as! Person
        }
        
        for element in arrayData
        {

            let person = element as! Person
            var firstLetter: String = (person.firstName as NSString!).substringToIndex(1)
            
            
            if(firstLetter == "Đ"){
                firstLetter = "D"
            }
            if(firstLetter == "Á"){
                firstLetter = "A"
            }
            
            var arrForLetter: NSMutableArray!
            
            if (dictContacts.valueForKey(firstLetter) != nil){
                arrForLetter = dictContacts.valueForKey(firstLetter) as! NSMutableArray
                arrForLetter.addObject(person)
                dictContacts.setValue(arrForLetter,forKey:firstLetter)
                
            }else{
                
                arrForLetter = NSMutableArray(object:person)
                dictContacts.setValue(arrForLetter, forKey: firstLetter)
            }
            

        }
        arrKey = dictContacts.allKeys as! [String]
        arrKey = arrKey.sortedArrayUsingSelector("compare:")

    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return arrKey.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionTitle = arrKey[section]
        let sectionPerson = dictContacts[sectionTitle as! String]
        return (sectionPerson?.count)!
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrKey[section] as? String
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")

        //var cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        //if (cell == nil){
        //    cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        
       // }
        // Configure the cell...
        let sectionTitle = arrKey[indexPath.section]
        let sectionPerson = dictContacts[sectionTitle as! String]
        let person = sectionPerson![indexPath.row] as!Person
        cell.textLabel?.text = person.fullName
        cell.detailTextLabel?.text = person.numberPhone
        return cell
        
    }
    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
         return arrKey as! [String]
    }
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.grayColor()
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.purpleColor()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailVC = DetailVC()
        
        let sectionTitle = arrKey[indexPath.section]
        let sectionPerson = dictContacts[sectionTitle as! String]
        let person = sectionPerson![indexPath.row] as!Person
        detailVC.person = person
        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }
}
