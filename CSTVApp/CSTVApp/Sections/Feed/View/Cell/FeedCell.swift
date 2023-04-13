//
//  FeedCell.swift
//  App
//
//  Created by Felipe Santolim on 12/04/23.
//

import UIKit
import Kingfisher

class FeedCell: UITableViewCell {
    
    @IBOutlet weak var icLeft: UIImageView!
    @IBOutlet weak var icRight: UIImageView!
    @IBOutlet weak var lblLeft: UILabel!
    @IBOutlet weak var lblRight: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension FeedCell {
    
    public func config(_ items: [MatchModelElement]?, _ row: Int) {
        guard let item = items else { return }
        
        lblLeft.text = item[row].opponents?.first?.opponent?.name
        lblRight.text = item[row].opponents?.last?.opponent?.name
        
        icLeft.kf.setImage(with: URL(string: item[row].opponents?.first?.opponent?.imageURL ?? ""))
        icRight.kf.setImage(with: URL(string: item[row].opponents?.last?.opponent?.imageURL ?? ""))
    }
}
