//
//  viewCellTableViewCell.swift
//  FullScreenDemo
//
//  Created by XuHao on 2019/8/15.
//  Copyright © 2019 FH. All rights reserved.
//

import UIKit
import RxSwift
import LXFProtocolTool
class viewCell: UITableViewCell, FullScreenable {

    var playerView: PlayerView!
    var disposeBas = DisposeBag.init()  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code.
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initUI() 
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initUI() {
        self.selectionStyle = .none
        playerView = PlayerView.loadFromNib()
        playerView.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 500)
        contentView.addSubview(playerView)
    }

}

protocol NibLoadable {
    
}

extension NibLoadable where Self : UIView {
    static func loadFromNib(_ nibNmae :String? = nil) -> Self {
        
        return Bundle.main.loadNibNamed(nibNmae ?? "\(self)", owner: nil, options: nil)?.first as! Self
    }
}
