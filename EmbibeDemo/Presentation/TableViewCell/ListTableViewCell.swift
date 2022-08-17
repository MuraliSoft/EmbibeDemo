//
//  ListTableViewCell.swift
//  EmbibeDemo
//
//  Created by Admin on 8/16/22.
//

import SDWebImage
import UIKit

class ListTableViewCell: UITableViewCell {
    static let nibName = "ListTableViewCell"

    @IBOutlet var userImgView: UIImageViewExtended!
    @IBOutlet var tittleLbl: UILabel!
    @IBOutlet var userNameLbl: UILabel!
    @IBOutlet var createdDateLbl: UILabel!
    @IBOutlet var closedDateLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func config(data: RepoDetailsModel?) {
        tittleLbl.text = data?.title ?? ""
        userNameLbl.text = data?.user?.login ?? ""
        createdDateLbl.text = "Created date: \(data?.createdAt?.toDate()?.getFormattedDate(style: .medium) ?? "")"
        closedDateLbl.text = "Cosed date: \(data?.closedAt?.toDate()?.getFormattedDate(style: .medium) ?? "")"

        let imageURL = data?.user?.avatarURL
        if imageURL != nil {
            userImgView.sd_setImage(with: URL(string: imageURL!), placeholderImage: nil)
        } else {
            userImgView.image = nil
        }
    }
}
