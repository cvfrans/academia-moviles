//
//  DetallePaisViewController.swift
//  Tarea02
//
//  Created by Frans Valdivia on 6/06/17.
//  Copyright © 2017 Frans Valdivia. All rights reserved.
//

import UIKit

class DetallePaisViewController: UIViewController {

    
    @IBOutlet weak var nombrePaisLbl: UILabel!
    @IBOutlet weak var nomPresidenteLbl: UILabel!
    @IBOutlet weak var descripCortaLbl: UILabel!
    @IBOutlet weak var descripLargaLbl: UILabel!
    @IBOutlet weak var poblacionLbl: UILabel!
    @IBOutlet weak var imagenPresidenteImg: UIImageView!
    @IBOutlet weak var imagenBanderaImg: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
