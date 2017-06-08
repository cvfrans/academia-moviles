//
//  ViewController.swift
//  Tarea02
//
//  Created by Frans Valdivia on 6/06/17.
//  Copyright © 2017 Frans Valdivia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var paisesTableView: UITableView!
    
    
    var paisesArray = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let objDAO = DataBase()
        paisesArray = objDAO.ejecutarSelect("select * from paises") as! [[String:String]]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paisesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaPaises", for: indexPath) as! PaisesTableViewCellController
        
        let nombrePais = paisesArray[indexPath.row]["nombre_pais"]
        let imagen = paisesArray[indexPath.row]["bandera_img"]
        
        cell.nombrePaisLbl.text = nombrePais
        cell.paisImage.image = UIImage(named: imagen!)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueDetalle" {
            
            let detalleVC = segue.destination as! DetallePaisViewController
            detalleVC.paisModelParam = getDetallePais()
            
        }
    }
    
    func getDetallePais()-> Pais{
        var paisModel : Pais? = nil
        if let indexPathPais = paisesTableView.indexPathForSelectedRow {
            paisModel = Pais()
            paisModel?.nombrePais = paisesArray[indexPathPais.row]["nombre_pais"]!
            paisModel?.nombrePresidente = paisesArray[indexPathPais.row]["nombre_presidente"]!
            paisModel?.descripCorta = paisesArray[indexPathPais.row]["descrip_corta"]!
            paisModel?.descripLarga = paisesArray[indexPathPais.row]["descrip_larga"]!
            paisModel?.poblacion = paisesArray[indexPathPais.row]["poblacion"]!
            paisModel?.presidenteImg = paisesArray[indexPathPais.row]["presidente_img"]!
            paisModel?.banderaImg = paisesArray[indexPathPais.row]["bandera_img"]!
        }
        return paisModel!
    }

}

