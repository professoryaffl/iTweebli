//
//  Date.swift
//  Tweebli
//
//  Created by Steve Baird on 09/09/2014.
//  Copyright (c) 2014 Tweebli. All rights reserved.
//

import Foundation

extension NSDate
    {
    convenience
    init(dateString:String) {
        let dateStringFormatter = NSDateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        let d = dateStringFormatter.dateFromString(dateString)
        self.init(timeInterval:0, sinceDate:d!)
    }
}