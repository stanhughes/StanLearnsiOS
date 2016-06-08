//
//  ViewController.swift
//  SimpleTable
//
//  Created by Stan Hughes on 5/30/16.
//  Copyright © 2016 Stan Hughes. All rights reserved.
//

import UIKit

class ViewController: UIViewController /*, UITableViewDelegate, UITableViewDataSource*/ {
    
    var tableView: UITableView!
    let items = ["Hello one", "Hello two", "Hello Three"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("viewDidLoad")
        
        //self.view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)
        self.tableView = UITableView(frame:self.view.frame)
        //self.tableView!.dataSource = self
        //self.tableView!.delegate = self
        self.tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tableView)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //
    // Methods realted to UITableViewDataSource
    //
    
    // Required by UITableViewDataSource protocol
    // These are called when the table is constructed.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.items.count;
    }
    
    // Required by UITableViewDataSource protocol
    // This is called when the table is constructed.
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = "\(self.items[indexPath.row])"
        return cell
    }
    
    //
    // Methods related to UITableViewDelegate
    //
    
    // Optional Method
    // Returns the section and row selected.
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("didSelectRowAtIndexPath=\(indexPath)")
        print("section=\(indexPath.section) row=\(indexPath.row)")
    }
    
}

