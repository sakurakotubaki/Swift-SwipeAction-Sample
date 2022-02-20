//
//  ViewController.swift
//  SwipeApp
//
//  Created by 橋本純一 on 2022/02/20.
//

import UIKit

class ViewController: UIViewController {

    var tableData:[String] = [
            "1. Apple",
            "2. Swift",
            "3. iPad",
            "4. iPhone",
            "5. MacBook"
        ]

        // tableViewという名前でUITableViewを設置しておく前提
        @IBOutlet weak var tableView: UITableView!

        override func viewDidLoad() {
            super.viewDidLoad()

            tableView.dataSource = self
            tableView.delegate = self
        }
    
    }

    extension ViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel!.text = self.tableData[indexPath.row]
            return cell
        }
       
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.tableData.count
        }


}

extension ViewController: UITableViewDelegate {
    // スワイプした時に表示するアクションの定義
      func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        // 編集処理
        let editAction = UIContextualAction(style: .normal, title: "編集") { (action, view, completionHandler) in
          // 編集処理を記述
          print("編集がタップされた")

        // 実行結果に関わらず記述
        completionHandler(true)
        }
          // 編集ボタンの色を変更
          editAction.backgroundColor = UIColor.systemBlue
          // アクションボタンに画像を設定
          editAction.image = UIImage(named: "edit")

       // 削除処理
          let deleteAction = UIContextualAction(style: .destructive, title: "削除") { (action, view, completionHandler) in
          //削除処理を記述
          print("削除がタップされた")

          // 実行結果に関わらず記述
          completionHandler(true)
        }
          // アクションボタンに画像を設定
          deleteAction.image = UIImage(named: "trash")

        // 定義したアクションをセット
        return UISwipeActionsConfiguration(actions: [deleteAction, editAction])
      }
}

