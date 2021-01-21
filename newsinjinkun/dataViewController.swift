//
//  dataViewController.swift
//  newsinjinkun
//
//  Created by 伊藤倫 on 2020/08/02.
//  Copyright © 2020 michi.ito. All rights reserved.
//

import UIKit
import RealmSwift

class dataViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var content: UITextView!
    @IBOutlet weak var rank: UITextField!
    @IBOutlet weak var firstcontact: UIDatePicker!
    
    let realm = try! Realm()
    var task: Task!
    var change: costomer1ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        
        name.text = task.name
        content.text = task.contents
        firstcontact.date = task.date
        rank.text = task.rank1
        
        rank.keyboardType = UIKeyboardType.numberPad
        
    }
    @objc func dismissKeyboard(){
        // キーボードを閉じる
        view.endEditing(true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        try! realm.write {
            self.task.name = self.name.text!
            self.task.contents = self.content.text
            self.task.date = self.firstcontact.date
            self.task.rank1 = self.rank.text!
            self.realm.add(self.task, update: .modified)
        }

        super.viewWillDisappear(animated)
    }
    
}
