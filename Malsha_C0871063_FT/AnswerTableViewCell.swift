//
//  AnswerTableViewCell.swift
//  Malsha_C0871063_FT
//
//  Created by Malsha Lambton on 2022-11-07.
//

import UIKit

class AnswerTableViewCell: UITableViewCell {

    @IBOutlet var answerLabel : UILabel?
    @IBOutlet var answerImage : UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
