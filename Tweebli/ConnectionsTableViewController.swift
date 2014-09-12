//
//  ConnectionsTableViewController.swift
//  Tweebli
//
//  Created by Steve Baird on 12/09/2014.
//  Copyright (c) 2014 Tweebli. All rights reserved.
//

import UIKit

class ConnectionsTableViewController: UITableViewController {
    
    let connections = TestData.zaphod.connections

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        var nibName=UINib(nibName: "ConnectionsTableCell", bundle:nil)
        
        self.tableView.registerNib(nibName, forCellReuseIdentifier: "ConnectionsTableCell")
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
        return connections.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 78
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ConnectionsTableCell", forIndexPath: indexPath) as ConnectionsTableViewCell
        let connectionsEntry = connections[indexPath.row]
        cell.nameLabel.text = connectionsEntry.name
        cell.emailLabel.text = connectionsEntry.email
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("GotoConnection", sender: tableView.cellForRowAtIndexPath(indexPath))
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "GotoConnection") {
            let target = segue.destinationViewController as ConnectionViewController
            
            let selectedRow = tableView.indexPathForCell(sender as UITableViewCell)?.row
            target.connection = connections[selectedRow!].connection
        }
    }

}
