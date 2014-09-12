//
//  NotificationViewController.swift
//  Tweebli
//
//  Created by Steve Baird on 09/09/2014.
//  Copyright (c) 2014 Tweebli. All rights reserved.
//

import UIKit
import Foundation

class NotificationViewController: UIViewController, UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return notification!.tags.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = tagCollectionView.dequeueReusableCellWithReuseIdentifier("TagCell", forIndexPath: indexPath) as UICollectionViewCell
        (cell.viewWithTag(100) as UILabel).text = notification!.tags[indexPath.item]
        return cell
    }
    
    @IBOutlet weak var senderLabel: UILabel!
    @IBOutlet weak var receivedLabel: UILabel!
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var tagCollectionView: UICollectionView!
    @IBOutlet weak var messageTextView: UITextView!
    
    var notification: Notification?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        senderLabel.text = notification?.sender.name
        receivedLabel.text = notification?.received.description
        subjectLabel.text = notification?.subject
        messageTextView.text = notification?.message
        tagCollectionView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        messageTextView.sizeToFit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
