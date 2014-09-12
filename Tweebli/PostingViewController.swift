//
//  PostingViewController.swift
//  Tweebli
//
//  Created by Steve Baird on 12/09/2014.
//  Copyright (c) 2014 Tweebli. All rights reserved.
//

import UIKit

class PostingViewController: UIViewController, UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posting!.tags.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = tagsCollectionView.dequeueReusableCellWithReuseIdentifier("TagCell", forIndexPath: indexPath) as UICollectionViewCell
        (cell.viewWithTag(100) as UILabel).text = posting!.tags[indexPath.item]
        return cell
    }
    
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var sentLabel: UILabel!
    @IBOutlet weak var tagsCollectionView: UICollectionView!
    @IBOutlet weak var messageTextView: UITextView!
    
    var posting: Posting?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        sentLabel.text = posting?.sent.description
        subjectLabel.text = posting?.subject
        messageTextView.text = posting?.message
        tagsCollectionView.dataSource = self
    }

    override func viewDidLayoutSubviews() {
        messageTextView.sizeToFit()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
