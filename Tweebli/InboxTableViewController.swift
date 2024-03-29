//
//  InboxTableViewController.swift
//  Tweebli
//
//  Created by Steve Baird on 09/09/2014.
//  Copyright (c) 2014 Tweebli. All rights reserved.
//

import UIKit

class InboxTableViewController: UITableViewController {
    
    let inbox: Inbox = TestData.zaphod.inbox
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        var nibName=UINib(nibName: "InboxTableCell", bundle:nil)
        
        self.tableView.registerNib(nibName, forCellReuseIdentifier: "InboxTableCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: (UITableView!)) -> Int {
        return 1
    }

    override func tableView(tableView: (UITableView!), numberOfRowsInSection section: Int) -> Int {
        return inbox.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 78
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("InboxTableCell", forIndexPath: indexPath) as InboxTableViewCell
        let inboxEntry = inbox[indexPath.row]
        cell.sender.text = inboxEntry.sender.name
        cell.subject.text = inboxEntry.subject
        cell.received.text = inboxEntry.received.description

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("GotoNotification", sender: tableView.cellForRowAtIndexPath(indexPath))
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "GotoNotification") {
            let target = segue.destinationViewController as NotificationViewController
            
            let selectedRow = tableView.indexPathForCell(sender as UITableViewCell)?.row
            target.notification = inbox[selectedRow!].notification
        }
    }
    

}
