//
//  TweebliService.swift
//  Tweebli
//
//  Created by Steve Baird on 05/09/2014.
//  Copyright (c) 2014 Tweebli. All rights reserved.
//

import Foundation
import class UIKit.UIImage

protocol User {
    var profile: Profile {get}
    var inbox: Inbox {get}
    var outbox: Outbox {get}
    var invites: Invites {get}
    var connections: Connections {get}
}

protocol UserRef {
    var name: String {get}
    var profile: Profile {get}
}

protocol Profile {
    var firstname: String {get}
    var lastname: String {get}
    var email: String {get}
    var image: UIImage {get}
}

protocol InboxEntry {
    var sender: UserRef {get}
    var subject: String {get}
    var received: NSDate {get}
    var notification: Notification {get}
}

protocol Notification {
    var sender: UserRef {get}
    var subject: String {get}
    var received: NSDate {get}
    var tags: [String] {get}
    var message: String {get}
}

protocol OutboxEntry {
    var subject: String {get}
    var sent: NSDate {get}
    var posting: Posting {get}
}

protocol Posting {
    var subject: String {get}
    var sent: NSDate {get}
    var tags: [String] {get}
    var message: String {get}
}

protocol InvitesEntry {
    var invitee: String {get}
    var sent: NSDate {get}
    var invite: Invite {get}
}

protocol Invite {
    var invitee: String {get}
    var sent: NSDate {get}
    var message: String {get}
    var state: String {get}
}

protocol ConnectionsEntry {
    var name: String {get}
    var email: String {get}
    var profile: Profile? {get}
    var connection: Connection {get}
}

protocol Connection {
    var name: String {get}
    var email: String {get}
    var tags: [String] {get}
    var profile: Profile? {get}
}

protocol TweebliService {
    var profile: Profile {get}
}

class LocalTweebli {
    let profile: Profile
    
    init(profile: Profile) {
        self.profile = profile
    }
}

typealias Inbox = [InboxEntry]
typealias Outbox = [OutboxEntry]
typealias Invites = [InvitesEntry]
typealias Connections = [ConnectionsEntry]

