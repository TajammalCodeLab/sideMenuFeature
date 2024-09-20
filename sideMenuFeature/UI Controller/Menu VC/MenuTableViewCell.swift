//
//  MenuTableViewCell.swift
//  sideMenuFeature
//
//  Created by SID on 18/09/2024.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var cellview: UIView!
    @IBOutlet weak var cellimage: UIImageView!
    @IBOutlet weak var cellLable: UILabel!
    
    
    private var indexPath: IndexPath?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updateData(for cellData: MenuCellData) {
        cellLable.text = cellData.screenName
        cellimage.image = UIImage(systemName: cellData.screenImage ?? "person.circle")
    }
    
}
