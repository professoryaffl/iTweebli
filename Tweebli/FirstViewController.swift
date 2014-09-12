//
//  FirstViewController.swift
//  Tweebli
//
//  Created by Steve Baird on 05/09/2014.
//  Copyright (c) 2014 Tweebli. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
                            
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var firstnameField: UILabel!
    @IBOutlet weak var lastnameField: UILabel!
    @IBOutlet weak var emailField: UILabel!
    
    var profile: Profile = TestData.zaphod.profile
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        firstnameField.text = profile.firstname
        lastnameField.text = profile.lastname
        emailField.text = profile.email
        imageView.image = profile.image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

