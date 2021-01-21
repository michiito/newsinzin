//
//  Task.swift
//  newsinjinkun
//
//  Created by 伊藤倫 on 2020/08/02.
//  Copyright © 2020 michi.ito. All rights reserved.
//

import RealmSwift

class Task: Object {
    // 管理用 ID。プライマリーキー
    @objc dynamic var id = 0

    // 名前
    @objc dynamic var name = ""

    // 内容
    @objc dynamic var contents = ""

    // 日時
    @objc dynamic var date = Date()
    
    //見込みランク
    @objc dynamic var rank1 = ""
    
    //counterの数字
    @objc dynamic var Counter = 0
    
    

    // id をプライマリーキーとして設定
    override static func primaryKey() -> String? {
        return "id"
    }
}
class Task2: Object{
    @objc dynamic var Counter = 0
    @objc dynamic var id = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
class Task3: Object{
    @objc dynamic var text = ""
    @objc dynamic var id = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

