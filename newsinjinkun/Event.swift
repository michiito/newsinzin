//
//  Event.swift
//  newsinjinkun
//
//  Created by 伊藤倫 on 2020/08/27.
//  Copyright © 2020 michi.ito. All rights reserved.
//

import Foundation
import RealmSwift

class Event: Object {

    @objc dynamic var date: String = ""
    @objc dynamic var event: String = ""

}
