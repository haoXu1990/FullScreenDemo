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
    @IBOutlet weak var playerContentSubView: UIView!
    
    @IBOutlet weak var playerContentView: UIView!
    var disposeBas = DisposeBag.init()
    var fullStatus = false
    override func awakeFromNib() {
        super.awakeFromNib()
// 问题出在这里
        playerContentSubView.frame = CGRect.init(x: 15, y: 50, width: UIScreen.main.bounds.size.width - 30, height: 150)
        playerContentSubView.backgroundColor = .orange
        playerContentSubView.rx
            .tapGesture()
            .when(.recognized)
            .subscribe(onNext: { [weak self](_) in
                guard let self = self else { return }
                self.fullStatus = !self.fullStatus
                if (self.fullStatus) {
                    self.lxf.enterFullScreen(specifiedView: self.playerContentSubView)
                } else {
                    self.lxf.exitFullScreen(superView: self)
                }

        }).disposed(by: disposeBas)
    }
    
}
