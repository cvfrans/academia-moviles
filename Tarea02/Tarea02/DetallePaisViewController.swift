//
//  DetallePaisViewController.swift
//  Tarea02
//
//  Created by Frans Valdivia on 6/06/17.
//  Copyright © 2017 Frans Valdivia. All rights reserved.
//

import UIKit

class DetallePaisViewController: UIViewController {

    var paisModelParam: Pais?
    
    @IBOutlet weak var nombrePaisLbl: UILabel!
    @IBOutlet weak var nomPresidenteLbl: UILabel!
    @IBOutlet weak var descripCortaLbl: UILabel!
    @IBOutlet weak var descripLargaLbl: UILabel!
    @IBOutlet weak var poblacionLbl: UILabel!
    @IBOutlet weak var imagenPresidenteImg: UIImageView!
    @IBOutlet weak var imagenBanderaImg: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let paisModel = paisModelParam {
            cargarPais(paisDetalleEdicion: paisModel)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Cargar detalle... \(PaisService.shared.pais.nombrePais)")
        cargarPais(paisDetalleEdicion: PaisService.shared.pais)
    }
    
    
    @IBAction func eliminarPais(_ sender: Any) {
        
        if let paisModel = paisModelParam {
            
            let msgBoxAlert = UIAlertController(title: "Advertencia", message: "Está seguro de eliminar el Pais de \(paisModel.nombrePais)", preferredStyle: UIAlertControllerStyle.alert)
            msgBoxAlert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: {(action : UIAlertAction!) in
                    PaisService.shared.eliminarPais(idPais: paisModel.id)
                    self.detailSegueToReturnBack()
            }))
            msgBoxAlert.addAction(UIAlertAction(title: "Cancelar", style: .default, handler: nil))
            
            self.present(msgBoxAlert, animated: true, completion: nil)
            
        }
        
    }
    
    func cargarPais(paisDetalleEdicion paisModel: Pais){
        nombrePaisLbl.text = paisModel.nombrePais
        nomPresidenteLbl.text = paisModel.nombrePresidente
        descripCortaLbl.text = paisModel.descripCorta
        descripLargaLbl.text = paisModel.descripLarga
        poblacionLbl.text = paisModel.poblacion
        imagenPresidenteImg.image = UIImage(named: paisModel.presidenteImg)
        imagenBanderaImg.image = UIImage(named: paisModel.banderaImg)
    }
    
    func detailSegueToReturnBack()  {
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }

}
