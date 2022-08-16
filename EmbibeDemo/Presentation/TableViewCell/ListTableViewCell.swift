//
//  ListTableViewCell.swift
//  EmbibeDemo
//
//  Created by Admin on 8/16/22.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    static let nibName = "ListTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(data:RepoDetailsModel?) {
        
    }
    
}
