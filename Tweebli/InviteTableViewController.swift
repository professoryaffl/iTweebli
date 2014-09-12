//
//  InviteTableViewController.swift
//  Tweebli
//
//  Created by Steve Baird on 12/09/2014.
//  Copyright (c) 2014 Tweebli. All rights reserved.
//

import UIKit

class InviteTableViewController: UITableViewController {
    
    let invites: Invites = TestData.zaphod.invites

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        var nibName=UINib(nibName: "InvitesTableCell", bundle:nil)
        
        self.tableView.registerNib(nibName, forCellReuseIdentifier: "InvitesTableCell")
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
        return invites.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 78
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("InvitesTableCell", forIndexPath: indexPath) as InvitesTableViewCell
        let invitesEntry = invites[indexPath.row]
        cell.inviteeLabel.text = invitesEntry.invitee
        cell.sentLabel.text = invitesEntry.sent.description
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("GotoInvite", sender: tableView.cellForRowAtIndexPath(indexPath))
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "GotoInvite") {
            let target = segue.destinationViewController as InviteViewController
            
            let selectedRow = tableView.indexPathForCell(sender as UITableViewCell)?.row
            target.invite = invites[selectedRow!].invite
        }
    }

}
