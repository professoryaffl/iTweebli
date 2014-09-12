//
//  InviteViewController.swift
//  Tweebli
//
//  Created by Steve Baird on 12/09/2014.
//  Copyright (c) 2014 Tweebli. All rights reserved.
//

import UIKit

class InviteViewController: UIViewController {
    
    @IBOutlet weak var inviteeLabel: UILabel!
    @IBOutlet weak var sentLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var messageTextView: UITextView!
    
    var invite: Invite?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        inviteeLabel.text = invite?.invitee
        sentLabel.text = invite?.sent.description
        statusLabel.text = invite?.state
        messageTextView.text = invite?.message
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    override func viewDidLayoutSubviews() {
        messageTextView.sizeToFit()
    }
}
