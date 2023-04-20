//
//  ViewController.swift
//  S_16_Tablas
//
//  Created by Eva Lopez Marquez on 19/4/23.
//

import UIKit

class ViewController: UIViewController {
    
    // Outlets
    
    @IBOutlet weak var myTableView: UITableView!
    
    // Variables (Clean Code)
    
    let reuseIdentifier = "cell"
    let myColorYellow = "PastelYellow"
    let myColorGreen = "PastelGreen"
    let cellIdenfifier = "myCell"
    let myCustomCell = "myCustomCell"
    let nombreCelda = "MyCustomTableViewCell"
    private let myCountries = ["España","Japón","Portugal","México","Colombia","Francia","Alemania","Cuba",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Color fondo + uso color personalizado con => UIColor(named: "NombreColor")
        myTableView.backgroundColor = UIColor(named: myColorYellow )
        
        // Datasource = Protocolo delegado asociado a las tablas para indicarle que elementos tiene la tabla
        myTableView.dataSource = self
        // Delegate = Protocolo delegado que recoge los eventos
        myTableView.delegate = self
        // Footer tabla sin celdas...
        myTableView.tableFooterView = UIView()
        // Añadir la celda customizada a la tabla
        myTableView.register(UINib(nibName: nombreCelda, bundle: nil), forCellReuseIdentifier: myCustomCell)
        
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    // Indicar nº celdas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Nº total de myCountries
        return myCountries.count
    }
    
    // Indicar cuantas secciones tiene la tabla
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    // Definir altura celda
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0  {
            return 50
        } else { // * else se puede quitar
            return 150
        }
    }
    
    // Definir contenidos celdas
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0  {
            var cell = tableView.dequeueReusableCell(withIdentifier: cellIdenfifier)
            if cell == nil {
                // Creamos una const + tipo de estilo + id de reuso => reutilizar la celda anterior vacia
                cell = UITableViewCell(style: .default , reuseIdentifier: reuseIdentifier)
                // Aquí personalización de celdas
                cell?.backgroundColor = UIColor(named: myColorYellow)
                cell?.textLabel?.font = UIFont.systemFont(ofSize: 20)
                cell?.accessoryType = .disclosureIndicator
            }
            // Cubrir una etiqueta con = accedemos al array[celda y sección por filas]
            // * Desempaquetamos porque estamos seguros de que hay contenido.
            cell!.textLabel?.text = myCountries[indexPath.row]
            // Cambiar color del background según si el número de la celda es par o impar
            cell?.backgroundColor = indexPath.row % 2 == 0 ? UIColor(named: myColorYellow) : UIColor(named: myColorGreen)
            
            return cell! // Sí estamos en la primera seccion (if == 0)
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: myCustomCell, for: indexPath) as? MyCustomTableViewCell
            
            // Propiedades custom
            cell?.myFirstLabel.text = String(indexPath.row + 1) // numerar la celda
            cell?.mySecondLabel.text = myCountries[indexPath.row] //
            // Cambiar color del background según si el número de la celda es par o impar
            cell?.backgroundColor = indexPath.row % 2 == 0 ? UIColor(named: myColorYellow) : UIColor(named: myColorGreen)
            
            return cell! // Sí estamos en la 2ª seccion
            
        }
    }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    // Función que se llama cada vez que se haga clic
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        print(myCountries[indexPath.row])
    }
}
