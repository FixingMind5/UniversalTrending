//
//  TableViewCell.swift
//  UniversalTrending
//
//  Created by eyc on 27/04/19.
//  Copyright © 2019 Manuel Alejandro Aguilar Tellez Giron. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    let viewTwitter = UIView()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(viewTwitter)
        viewTwitter.backgroundColor = .green
        viewTwitter.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init coder has not been implemented")
    }

}
