//
//  InboxTableViewCell.swift
//  Tweebli
//
//  Created by Steve Baird on 09/09/2014.
//  Copyright (c) 2014 Tweebli. All rights reserved.
//

import UIKit

class InboxTableViewCell: UITableViewCell {
    
    @IBOutlet weak var sender: UILabel!
    @IBOutlet weak var subject: UILabel!
    @IBOutlet weak var received: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
