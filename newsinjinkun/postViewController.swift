//
//  postViewController.swift
//  newsinjinkun
//
//  Created by 伊藤倫 on 2020/08/13.
//  Copyright © 2020 michi.ito. All rights reserved.
//

import UIKit
import RealmSwift

class postViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var postLabel: UILabel!
    @IBOutlet weak var more: UITextField!
    @IBOutlet weak var textComment: UITextView!
    
    let realm = try! Realm()
    var task2 = Task2()
    var task3 = Task3()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.more.delegate = self
        let result = realm.objects(Task2.self).filter("id == '1'").first
        
        if result != nil{
        postLabel.text = "\(result!.Counter)枚です！"
        
        }else{
            postLabel.text = "0枚です。"
            minusButton.isEnabled = false
        }
        
        let result2 = realm.objects(Task3.self).filter("id == '1'").first
        
        if result2 != nil{
            textComment.text = result2!.text
        }
        textComment.layer.borderColor = UIColor.black.cgColor
        textComment.layer.borderWidth = 1
    }
    
    @IBAction func plusButton(_ sender: UIButton) {
        let m = realm.objects(Task2.self).filter("id == '1'").first
        
        if m == nil{
            task2.Counter += 1
            task2.id = "1"
            try! realm.write{
                realm.add(task2)
            }
            postLabel.text = "1枚です！"
        }else{
            
            try! realm.write{
                m?.Counter += 1
            }
            print(m)
            postLabel.text = "\(m!.Counter)枚です！"
        }
        minusButton.isEnabled = true
        
    }
    @IBAction func minusButton(_ sender: UIButton) {
        let m = realm.objects(Task2.self).filter("id == '1'").first
        
        if m != nil{
            try! realm.write{
                m?.Counter -= 1
            }
      }
        postLabel.text = "\(m!.Counter)枚です！"
        if m!.Counter == 0{
            minusButton.isEnabled = false
        }
    }
    
    @IBAction func push(_ sender: UIButton) {
        let m = realm.objects(Task2.self).filter("id == '1'").first
        let togather: Int! = Int(more.text!)
        
        if m == nil {
            task2.Counter += togather!
            task2.id = "1"
            try! realm.write{
                realm.add(task2)
            }
            postLabel.text = "\(togather!)枚です！"
        }else{
            try! realm.write{
                m?.Counter += togather!
            }
             postLabel.text = "\(m!.Counter)枚です！"
        }
       
    }
    func textField(){
        let a = realm.objects(Task3.self).filter("id == '1'").first
        
        if a == nil{
            task3.text = textComment.text
            task3.id = "1"
            try! realm.write{
                realm.add(task3)
            }
        }else{
            try! realm.write{
                a?.text += textComment.text
            }
        }
    }
    @IBAction func hold(_ sender: UIButton) {
        textField()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.textComment.isFirstResponder {
            self.textComment.resignFirstResponder()
        }
    }
}
