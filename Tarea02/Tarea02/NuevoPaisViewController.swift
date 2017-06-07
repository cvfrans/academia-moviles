//
//  NuevoPaisViewController.swift
//  Tarea02
//
//  Created by Frans Valdivia on 6/06/17.
//  Copyright © 2017 Frans Valdivia. All rights reserved.
//

import UIKit

class NuevoPaisViewController: UIViewController {
    
    @IBOutlet weak var nomPaisTxt: UITextField!
    @IBOutlet weak var nombrePresidenteTxt: UITextField!
    @IBOutlet weak var descripCortaTxt: UITextField!
    @IBOutlet weak var descripLargaTxt: UITextField!
    @IBOutlet weak var poblacionTxt: UITextField!    
    @IBOutlet weak var imagenBanderaImg: UITextField!
    @IBOutlet weak var imagenPresidenteImg: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func obtenerNombreBandera(_ sender: Any) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let modalImageVC = storyBoard.instantiateViewController(withIdentifier: "modalImageIdentity") as! UITableViewController
        self.present(modalImageVC, animated: true, completion: nil)        
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
