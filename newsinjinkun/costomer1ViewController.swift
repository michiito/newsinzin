//
//  costomer1ViewController.swift
//  newsinjinkun
//
//  Created by 伊藤倫 on 2020/08/02.
//  Copyright © 2020 michi.ito. All rights reserved.
//

import UIKit
import RealmSwift

class costomer1ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    let realm = try! Realm()

    var taskArray = try! Realm().objects(Task.self).sorted(byKeyPath: "date", ascending: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
    }
    // データの数（＝セルの数）を返すメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
        
    }

    // 各セルの内容を返すメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用可能な cell を得る
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let task = taskArray[indexPath.row]
        cell.textLabel?.text = task.name

        let formatter = DateFormatter()
        formatter.dateFormat = "見込みレベル\(task.rank1)"

        let dateString:String = formatter.string(from: task.date)
        cell.detailTextLabel?.text = dateString
        
        return cell
    }

    // 各セルを選択した時に実行されるメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "cellSegue",sender: nil)
        
    }

    // セルが削除が可能なことを伝えるメソッド
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath)-> UITableViewCell.EditingStyle {
        return .delete
    }

    // Delete ボタンが押された時に呼ばれるメソッド
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            // データベースから削除する
            try! realm.write {
                self.realm.delete(self.taskArray[indexPath.row])
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let dataViewController:dataViewController = segue.destination as! dataViewController

        if segue.identifier == "cellSegue" {
            let indexPath = self.tableView.indexPathForSelectedRow
            dataViewController.task = taskArray[indexPath!.row]
        } else {
            let task = Task()

            let allTasks = realm.objects(Task.self)
            if allTasks.count != 0 {
                task.id = allTasks.max(ofProperty: "id")! + 1
            }

            dataViewController.task = task
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        
    }
    
}
