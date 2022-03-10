//
//  ViewController.swift
//  AssignmentNinee
//
//  Created by karma on 3/10/22.
//

import UIKit

class ViewController: UIViewController {
    var urlPok = URL(string: "https://pokeapi.co/api/v2/pokemon?offset=0&limit=40")!
    var poke: Poke?
    var pokList:[PokeList]?
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // call 2 times for 40 pokemon
       
        getPokemons()
        tableView.delegate = self
        tableView.dataSource = self
    
        
    }
    func getPokemons(){

        let session = URLSession.shared.dataTask(with: urlPok) { [self] data, response, error in
            if let error = error {
                print("there are errors: \(error.localizedDescription)")
                return
            }else{
                
                do{
                    poke = try JSONDecoder().decode(Poke.self, from: data!)
                    guard let poke = poke else {
                        print("no data in poke")
                        return
                    }
                    pokList = poke.results
                    print("these are the results: \(String(describing: pokList))")
                    print(pokList![0].name)
//                     print("poke list: \(poke?.results)")
                }catch let error{
                    print(error.localizedDescription)
                }
                
            }
            
        }
        session.resume()
    }
    
    // this should be called when the cell is tapped
    func getPokemonDetails(id: Int){
        //
    }


}


extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // call the function and send the id to get the details
        guard pokList != nil else{
            print("empty pok list at did select row at")
            return
        }
        print("you tapped \(String(describing: pokList![indexPath.row]))")
    }
}

extension ViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard pokList != nil else{
            print(" pok list is empty")
            return 0
        }
        return pokList!.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let pokemon = pokList![indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonViewCell",for: indexPath) as! PokemonViewCell
        cell.setName(poke: pokemon)
        return cell
    }


}
