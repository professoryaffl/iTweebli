//
//  ConnectionViewController.swift
//  Tweebli
//
//  Created by Steve Baird on 12/09/2014.
//  Copyright (c) 2014 Tweebli. All rights reserved.
//

import UIKit

class ConnectionViewController: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var tagsCollectionView: UICollectionView!
    
    var connection: Connection?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameLabel.text = connection?.name
        emailLabel.text = connection?.email
        tagsCollectionView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return connection!.tags.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = tagsCollectionView.dequeueReusableCellWithReuseIdentifier("TagCell", forIndexPath: indexPath) as UICollectionViewCell
        (cell.viewWithTag(100) as UILabel).text = connection!.tags[indexPath.item]
        return cell
    }

}
