//
//  NuevoPaisViewController.swift
//  Tarea02
//
//  Created by Frans Valdivia on 6/06/17.
//  Copyright © 2017 Frans Valdivia. All rights reserved.
//

import UIKit

class NuevoPaisViewController: UIViewController, ModalViewControllerDelegate {
    
    @IBOutlet weak var nomPaisTxt: UITextField!
    @IBOutlet weak var nombrePresidenteTxt: UITextField!
    @IBOutlet weak var descripCortaTxt: UITextField!
    @IBOutlet weak var descripLargaTxt: UITextField!
    @IBOutlet weak var poblacionTxt: UITextField!    
    @IBOutlet weak var imagenBanderaImg: UITextField!
    @IBOutlet weak var imagenPresidenteImg: UITextField!
    
    let arrayPaises = ["peru", "argentina", "bolivia", "brasil", "chile", "colombia", "ecuador", "guyana", "paraguay", "surinam", "uruguay", "venezuela"]
    let arrayPresidentes = ["pedro_pablo_kuczynski","mauricio_acri", "evo_morales_ayma"]
    let TIPO_MODAL_BANDERA : Int = 1
    let TIPO_MODAL_PRESIDENTE : Int = 2
    
    var storyBoard = UIStoryboard(name: "Main", bundle: nil)
    var modalImageVC = ModalImageTableViewController()
    
    var tipoModal : Int = 0
    
    let objDAO = DataBase()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func obtenerNombreBandera(_ sender: Any) {
        self.modalImageVC = storyBoard.instantiateViewController(withIdentifier: "modalImageIdentity") as! ModalImageTableViewController
        self.tipoModal = 1
        self.modalImageVC.delegateModal = self
        self.modalImageVC.arrayImagen = arrayPaises
        self.present(modalImageVC, animated: true, completion: nil)
        
    }
    
    
    @IBAction func obtenerNombrePresidente(_ sender: Any) {
        //let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        //let modalImageVC = storyBoard.instantiateViewController(withIdentifier: "modalImageIdentity") as! ModalImageTableViewController
        
        self.modalImageVC = storyBoard.instantiateViewController(withIdentifier: "modalImageIdentity") as! ModalImageTableViewController
        self.tipoModal = 2
        self.modalImageVC.delegateModal = self
        self.modalImageVC.arrayImagen = arrayPresidentes
        self.present(modalImageVC, animated: true, completion: nil)
    }
    
    @IBAction func guardarPais(_ sender: Any) {
        
        objDAO.ejecutarInsert("")
    }
    
    
    func saveImagePath( imagePath : String){
        if TIPO_MODAL_BANDERA == tipoModal {
            imagenBanderaImg.text = imagePath + ".jpg"
        }
        if TIPO_MODAL_PRESIDENTE == tipoModal {
            imagenPresidenteImg.text = imagePath
        }
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
