//
//  ViewController.swift
//  Tarea01
//
//  Created by academiamoviles on 5/31/17.
//  Copyright © 2017 Academia moviles. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var formView: UIView!
    @IBOutlet weak var responseTextView: UITextView!
    
    
    @IBOutlet weak var montoRHIn: UITextField!
    @IBOutlet weak var nombresIn: UITextField!
    @IBOutlet weak var edadIn: UITextField!
    @IBOutlet weak var emailIn: UITextField!
    @IBOutlet weak var afiliacionIn: UISwitch!
    
    var sueldo : Double! = 0.0
    var nombres : String = ""
    var edad : Int! = 0
    var email : String = ""
    // variables de calculo
    var descuentoAFP : Double = 0.0
    var descuentoRenta : Double = 0.0
    var totalRecibir : Double = 0.0
    
    //Constantes
    let DESCUENTO_RENTA_07 = 0.07
    let DESCUENTO_RENTA_10 = 0.1
    let DESCUENTO_AFP = 0.13
    let SUELDO_700 = 700.00
    let SUELDO_1500 = 1500.00

    let alert = UIAlertController(title: "Advertencia", message: "", preferredStyle: UIAlertControllerStyle.alert)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default, handler: nil))
        
        let grayColor : UIColor = UIColor.gray
        formView.layer.borderWidth = 2.0
        formView.layer.borderColor = grayColor.cgColor
        responseTextView.layer.borderWidth = 2.0
        responseTextView.layer.borderColor = grayColor.cgColor
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func calculando(_ sender: Any) {
        guard validarCampos() else {
            return
        }
        asignarAtributos()
        procesarDatos()
        imprimirResultado()
    }
    
    func validarCampos() -> Bool {
        
        guard
            let montoVal = montoRHIn.text,
            let nombreVal = nombresIn.text,
            let edadVal = edadIn.text,
            let emailVal = emailIn.text,
            !montoVal.isEmpty,
            !nombreVal.isEmpty,
            !edadVal.isEmpty,
            !emailVal.isEmpty,
            validateEmail(emailVal: emailIn.text!)
            else {
                print("Es necesario ingresar todos los campos")
                return false
        }
        return true
    }
    
    func asignarAtributos(){
        
        self.sueldo = Double(montoRHIn.text!)
        self.nombres = nombresIn.text!
        self.edad = Int(edadIn.text!)
        self.email = emailIn.text!
        
    }
    
    func procesarDatos(){
        
        if self.edad < 40 {
            if self.sueldo >= SUELDO_700 && self.sueldo < SUELDO_1500 {
                self.descuentoRenta = self.sueldo * DESCUENTO_RENTA_07
            }
            if self.sueldo >= 1500 {
                self.descuentoRenta = self.sueldo * DESCUENTO_RENTA_10
            }
        } else {
           self.descuentoRenta = 0.0
        }
        if afiliacionIn.isOn {
            self.descuentoAFP = self.sueldo * DESCUENTO_AFP
        } else {
            self.descuentoAFP = 0.0
        }
        self.totalRecibir = self.sueldo - self.descuentoRenta - self.descuentoAFP
        
    }
    func imprimirResultado(){
        
        var result : String
        result = "Resultado. \n"
        result += "Nombre: \(self.nombres) \n"
        result += "Edad: \(self.edad!) \n"
        result += "Sueldo RHH: \(self.sueldo!) \n"
        result += "Descuento AFP: \(self.descuentoAFP) \n"
        result += "Descuento Renta: \(self.descuentoRenta) \n"
        result += "Total a recibir: \(self.totalRecibir) \n"
        
        responseTextView.text = result
    }

    func isValidEmail(textEmail:String) -> Bool {
        
        print("validate emilId: \(textEmail)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: textEmail)
        return result
        
    }
    
    func validateEmail(emailVal: String) -> Bool{
        guard
            isValidEmail(textEmail: emailVal)
        else{
            alert.message = "El Email ingresado es incorrecto."
            self.dismiss(animated: false, completion: nil)
            self.present(alert, animated: true, completion: nil)            
            return false
        }
        return true
    }

}

