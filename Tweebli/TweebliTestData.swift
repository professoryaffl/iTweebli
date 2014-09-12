//
//  TweebliTestData.swift
//  Tweebli
//
//  Created by Steve Baird on 09/09/2014.
//  Copyright (c) 2014 Tweebli. All rights reserved.
//

import Foundation
import class UIKit.UIImage

struct SimpleNotification: Notification {
    let sender: UserRef
    let subject: String
    let received: NSDate
    let tags: [String]
    let message: String
}

struct SimpleInboxEntry: InboxEntry {
    let sender: UserRef
    let subject: String
    let received: NSDate
    let notification: Notification
}

struct SimplePosting : Posting {
    let subject: String
    let sent: NSDate
    let tags: [String]
    let message: String
}

struct SimpleOutboxEntry: OutboxEntry {
    let subject: String
    let sent: NSDate
    let posting: Posting
}

struct SimpleUserRef: UserRef {
    let name: String
    let profile: Profile
}

struct SimpleProfile: Profile {
    let firstname: String
    let lastname: String
    let email: String
    let image: UIImage
}

struct SimpleUser: User {
    let profile: Profile
    let inbox: Inbox
    let outbox: Outbox
}

class ZaphodData {
    
    let userRefs: Dictionary<String, UserRef> = [
        "zaphod": SimpleUserRef(name: "Zaphod Beeblebrox", profile: SimpleProfile(firstname: "Zaphod", lastname: "Beeblebrox", email: "zaphod@beeblebrox.com", image: UIImage(named: "noimage"))),
        "ford" : SimpleUserRef(name: "Ford Prefect", profile: SimpleProfile(firstname: "Ford", lastname: "Prefect", email: "ford@beeblebrox.com", image: UIImage(named: "noimage"))),
        "arthur": SimpleUserRef(name: "Arthur Dent", profile: SimpleProfile(firstname: "Arthur", lastname: "Dent", email: "arthur@beeblebrox.com", image: UIImage(named: "noimage")))
    ]
    
    var notifications: [Notification] {
        get {
            return [
                SimpleNotification(sender: userRefs["ford"]!, subject: "Hello", received: NSDate(dateString: "2015-09-09 10:00:00"), tags: ["Dev", "London"], message: "Check it out"),
                SimpleNotification(sender: userRefs["arthur"]!, subject: "Help", received: NSDate(dateString: "2015-09-09 10:30:00"), tags: ["Des", "London"], message: "Designer wanted")
            ]
        }
    }
    
    var postings: [Posting] {
        get {
            return [
                SimplePosting(subject: "New Job", sent: NSDate(dateString: "2015-09-08 10:00:00"), tags: ["Manager", "London"], message: "We want you"),
                SimplePosting(subject: "New Role", sent: NSDate(dateString: "2015-09-07 10:30:00"), tags: ["Architect", "London"], message: "You're just what we need")
            ]
        }
    }
    
    var inbox: [InboxEntry] {
        get {
            return notifications.map { SimpleInboxEntry(sender: $0.sender, subject: $0.subject, received: $0.received, notification: $0) }
        }
    }
    
    var outbox: [OutboxEntry] {
        get {
            return postings.map { SimpleOutboxEntry(subject: $0.subject, sent: $0.sent, posting: $0) }
        }
    }
    
    var user: User {
        get {
            return SimpleUser(profile: userRefs["zaphod"]!.profile, inbox: self.inbox, outbox: self.outbox)
        }
    }
    
}

class TestData {
    class var zaphod: User {
        get { return ZaphodData().user }
    }
}