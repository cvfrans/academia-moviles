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
    
    
    var listaPaises : Array<Pais> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listaPaises = PaisService.shared.listarPaies()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaPaises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaPaises", for: indexPath) as! PaisesTableViewCellController
        
        
        let nombrePais = listaPaises[indexPath.row].nombrePais
        let imagen = listaPaises[indexPath.row].banderaImg
        
        cell.nombrePaisLbl.text = nombrePais
        cell.paisImage.image = UIImage(named: imagen)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueDetalle" {
            let detalleVC = segue.destination as! DetallePaisViewController
            detalleVC.paisModelParam = getDetallePais()
        }
        if segue.identifier == "segueNuevo" {
            PaisService.shared.pais = Pais()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        listaPaises = PaisService.shared.listarPaies()
        self.paisesTableView.reloadData()
        
    }
    
    func getDetallePais()-> Pais{
        var paisModel : Pais? = nil
        
        if let indexPathPais = paisesTableView.indexPathForSelectedRow {
            paisModel = listaPaises[indexPathPais.row]
            PaisService.shared.pais = paisModel!
        }
        return paisModel!
    }
    
    
    

}

