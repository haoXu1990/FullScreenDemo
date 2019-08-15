//
//  PlayerView.swift
//  FullScreenDemo
//
//  Created by XuHao on 2019/8/15.
//  Copyright © 2019 FH. All rights reserved.
//

import UIKit
import LXFProtocolTool
import RxSwift
import RxGesture

class PlayerView: UIView, NibLoadable, FullScreenable {
    @IBOutlet weak var playerContentView: UIView!
    var disposeBas = DisposeBag.init()
    var fullStatus = false
    override func awakeFromNib() {
        super.awakeFromNib()
// 问题出在这里
//        playerContentView.rx.tapGesture().subscribe(onNext: { [weak self](_) in
//            guard let self = self else { return }
//
//            self.fullStatus = !self.fullStatus
//            self.lxf.switchFullScreen(isEnter: self.fullStatus, specifiedView: self.playerContentView, superView: self, config: nil, completed: nil)
//
//        }).disposed(by: disposeBas)
    }
    
}
