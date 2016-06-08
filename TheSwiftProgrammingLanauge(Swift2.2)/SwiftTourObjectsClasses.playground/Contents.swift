//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

var str = "Hello, SwiftToorObjectsClasses playground"

// A very simple class
class C {}

// Can create an anonymous class by
// trying to leave off the name
//class _ {} // Expected identifier in the class declaration.

for i in 1...3 {
    i
}

print(str)

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    let items = ["Hello one", "Hello two", "Hello 3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)
        self.tableView = UITableView(frame:self.view.frame)
        self.tableView!.dataSource = self
        self.tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tableView)
        
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.items.count;
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = "\(self.items[indexPath.row])"
        return cell
    }

}

var ctrl = ViewController()

XCPlaygroundPage.currentPage.liveView = ctrl.view

print("something2")



