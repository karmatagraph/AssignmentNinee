//
//  DisplayViewController.swift
//  AssignmentNinee
//
//  Created by karma on 3/10/22.
//

import UIKit
import Kingfisher
class DisplayViewController: UIViewController {

    let api = API()
    var tappedPoke: PokeList? = nil
    var pokeDetail: Pokemon?
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var idLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    
    override func viewDidLoad()  {
        super.viewDidLoad()
        
        print("tapped pokemon is: \(String(describing: tappedPoke?.name))")
        getPokemonDetails()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.4) {
            // Put your code which should be executed with a delay here
            self.setLabel()
//            self.setImage()
            
            
        }
        //call the func and save it inside pokedetails
        
        
        
        
        
    }
    
//    func callAsync()async{
//        pokeDetail = await api.getPokemonDetails(tappedPoke: tappedPoke)
//    }
    
    
    
    
    
    // this should be called when the cell is tapped
    func getPokemonDetails(){
        //
        guard let tappedPoke = tappedPoke else {
            print("empty tapped poke")
            return
        }

        let session = URLSession.shared.dataTask(with: tappedPoke.url) { [self] data, response, error in
            if let error = error {
                print("there are errors: \(error.localizedDescription)")
            }else{
                // call the detail of the pokemon
                do{

                    pokeDetail = try JSONDecoder().decode(Pokemon.self, from: data!)
                }catch let error {
                    print(error.localizedDescription)
                }
            }
        }

        session.resume()
    }
    
//    func setImage(){
//        DispatchQueue.global(qos: .background).async { [self] in
//                do
//                 {
//                     let data = try Data.init(contentsOf: (pokeDetail?.imageURL!)!)
//                       DispatchQueue.main.async {
//                           imgView.image = UIImage(data: data)
//                       }
//                 }
//                catch {
//                       // error
//                      }
//         }
//    }
    
    func setLabel(){
        idLbl.text = "ID: " + String(pokeDetail!.id)
        nameLbl.text = "Name: " + pokeDetail!.name
        heightLbl.text = "Height: " + String(pokeDetail!.height)
        weightLbl.text = "Weight: " + String(pokeDetail!.weight)
//        imgView.image = KFImage(pokeDetail?.imageURL)
        let imgUrl = String(pokeDetail!.imageURL)
        imgView.kf.setImage(with: URL(string: imgUrl), placeholder: nil, options: nil, completionHandler: nil)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
