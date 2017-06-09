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
    let arrayPresidentes = ["pedro_pablo_kuczynski","mauricio_acri", "evo_morales_ayma", "michel_temer", "juan_manuel_santos", "lenin_moreno"]
    let TIPO_MODAL_BANDERA : Int = 1
    let TIPO_MODAL_PRESIDENTE : Int = 2
    
    var storyBoard = UIStoryboard(name: "Main", bundle: nil)
    var modalImageVC = ModalImageTableViewController()
    
    var tipoModal : Int = 0
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let paisService = PaisService.shared.pais
        if paisService.id > 0 {
            nomPaisTxt.text = paisService.nombrePais
            nombrePresidenteTxt.text = paisService.nombrePresidente
            descripCortaTxt.text = paisService.descripCorta
            descripLargaTxt.text = paisService.descripLarga
            poblacionTxt.text = paisService.poblacion
            imagenBanderaImg.text = paisService.banderaImg
            imagenPresidenteImg.text = paisService.presidenteImg
        }
        
        
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
        let paisModel = Pais()
        paisModel.nombrePais = nomPaisTxt.text!
        paisModel.nombrePresidente = nombrePresidenteTxt.text!
        paisModel.descripCorta = descripCortaTxt.text!
        paisModel.descripLarga = descripLargaTxt.text!
        paisModel.poblacion = poblacionTxt.text!
        paisModel.banderaImg = imagenBanderaImg.text!
        paisModel.presidenteImg = imagenPresidenteImg.text!
        
        if PaisService.shared.pais.id > 0 {
            paisModel.id = PaisService.shared.pais.id
            PaisService.shared.actualizarPais(paisModel: paisModel)
            PaisService.shared.pais = paisModel
        } else {
            PaisService.shared.guardarPais(paisModel: paisModel)
        }
        
        
        let alert = UIAlertController(title: "Transacción", message: "Se guardo correctamente.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default, handler: {(action : UIAlertAction) in
            self.detailSegueToReturnBack()
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    func saveImagePath( imagePath : String){
        if TIPO_MODAL_BANDERA == tipoModal {
            imagenBanderaImg.text = imagePath + ".jpg"
        }
        if TIPO_MODAL_PRESIDENTE == tipoModal {
            imagenPresidenteImg.text = imagePath
        }
    }
    
    func detailSegueToReturnBack()  {
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }


}
