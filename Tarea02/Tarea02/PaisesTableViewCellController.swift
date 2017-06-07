//
//  PaisesTableViewCellController.swift
//  Tarea02
//
//  Created by Frans Valdivia on 7/06/17.
//  Copyright © 2017 Frans Valdivia. All rights reserved.
//

import UIKit

class PaisesTableViewCellController: UITableViewCell {

    
    @IBOutlet weak var paisImage: UIImageView!    
    @IBOutlet weak var nombrePaisLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
