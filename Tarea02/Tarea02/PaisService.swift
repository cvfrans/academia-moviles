//
//  PaisService.swift
//  Tarea02
//
//  Created by Frans Valdivia on 8/06/17.
//  Copyright © 2017 Frans Valdivia. All rights reserved.
//

import Foundation

class PaisService{
    
    var pais = Pais()
    
    let objDAO = DataBase()
    
    static let shared = PaisService()
    
    func guardarPais(paisModel: Pais) -> Void{
        
        var insert = "insert into paises("
        insert += "  'nombre_pais'"
        insert += ", 'nombre_presidente'"
        insert += ", 'descrip_corta'"
        insert += ", 'descrip_larga'"
        insert += ", 'poblacion'"
        insert += ", 'presidente_img'"
        insert += ", 'bandera_img')"
        insert += " values("
        insert += "  '\(paisModel.nombrePais)'"
        insert += ", '\(paisModel.nombrePresidente)'"
        insert += ", '\(paisModel.descripCorta)'"
        insert += ", '\(paisModel.descripLarga)'"
        insert += ", '\(paisModel.poblacion)'"
        insert += ", '\(paisModel.presidenteImg)'"
        insert += ", '\(paisModel.banderaImg)')"
        
        objDAO.ejecutarInsert(insert)
    }
    
    func listarPaies() -> [Pais]{
    
        var paisesList : Array<Pais> = Array()
        let arrayPises = objDAO.ejecutarSelect("select * from paises") as! [[String:String]]
        
        for paisArg in arrayPises {
            let pais = Pais()
            pais.id = Int(paisArg["id"]!)!
            pais.nombrePais = paisArg["nombre_pais"]!
            pais.nombrePresidente = paisArg["nombre_presidente"]!
            pais.descripCorta = paisArg["descrip_corta"]!
            pais.descripLarga = paisArg["descrip_larga"]!
            pais.poblacion = paisArg["poblacion"]!
            pais.presidenteImg = paisArg["presidente_img"]!
            pais.banderaImg = paisArg["bandera_img"]!
            
            paisesList.append(pais)
            
        }
        
        return paisesList
    }
    
    func eliminarPais(idPais : Int) -> Void {
        
        var query = "delete from paises where"
        query += " id = \(idPais)"
        
        objDAO.ejecutarDelete(query)
    }
    
    func actualizarPais(paisModel: Pais) -> Void{
        
        var update = "update paises set"
        update += "  nombre_pais = '\(paisModel.nombrePais)'"
        update += ", nombre_presidente = '\(paisModel.nombrePresidente)'"
        update += ", descrip_corta = '\(paisModel.descripCorta)'"
        update += ", descrip_larga = '\(paisModel.descripLarga)'"
        update += ", poblacion = '\(paisModel.poblacion)'"
        update += ", presidente_img = '\(paisModel.presidenteImg)'"
        update += ", bandera_img = '\(paisModel.banderaImg)'"
        update += " where id = \(paisModel.id)"
        
        objDAO.ejecutarUpdate(update)
        
    }
    
}







