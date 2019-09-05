//
//  ViewController.swift
//  FullScreenDemo
//
//  Created by XuHao on 2019/8/15.
//  Copyright © 2019 FH. All rights reserved.
//

import UIKit
import TABAnimated
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    var tableView: UITableView!
    let disposed = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initUI()
    }

    func initUI() {
        tableView = UITableView.init()
        tableView.frame = view.frame
        tableView.delegate = self
//        tableView.dataSource = self
        view.addSubview(tableView)
        
        tableView.tabAnimated = TABTableAnimated.init(cellClass: viewCell.self, cellHeight: 500)
        tableView.tabAnimated?.animatedSectionCount = 1
        tableView.tabAnimated?.showTableHeaderView = false
        tableView.tabAnimated?.superAnimationType = .shimmer
        tableView.tabAnimated?.canLoadAgain = true
//  如果这样调用会不崩溃
//        tableView.tab_startAnimation(withDelayTime: 5) {
//            self.afterGetData()
//        }

        /// 下面这样会崩溃    
        /**
         
         UITableView+TABAnimated 文件中的
         - (NSInteger)tab_numberOfSectionsInTableView:(UITableView *)tableView
         方法进入到 if 的外面就会崩溃
         
         tableView.tab_startAnimation()
         要放在 item.bind(to: tableView.rx.items) 前面
         这样就进入不了 if 的外面就不会崩溃
         
         */
        
        let item = Observable.of(["1", "2", "3"])
        item.bind(to: tableView.rx.items)(self.cellFactory)
            .disposed(by: disposed)
        tableView.tab_startAnimation()
        
    }
    
    func afterGetData() {
        let item = Observable.of(["1", "2", "3"])
        item.bind(to: tableView.rx.items)(self.cellFactory)
        .disposed(by: disposed)
    }
    
    func cellFactory(tableView: UITableView, row: Int, item: String) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: IndexPath.init(row: row, section: 0))
        
        return cell
    }

}



extension ViewController: UITableViewDelegate {

//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 3
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
//
//        if cell == nil {
//            cell = viewCell.init(style: .default, reuseIdentifier: "cell")
//        }
//
//        return cell!
//    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
}
