//
//  Notifications Model.swift
//  Killuanco
//
//  Created by Muhammad Reyadh on 5/30/22.
//  Copyright © 2022 PA&A. All rights reserved.
//

import Foundation


struct Notification {
    let header :String
    let content :String
}
struct Notifications {
    let date: String
    let notifications : [Notification]
}
