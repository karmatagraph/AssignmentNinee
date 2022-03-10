//
//  API.swift
//  AssignmentNinee
//
//  Created by karma on 3/10/22.
//

import Foundation
class API{
    var pokeDetail: Pokemon?
    func getPokemonDetails(tappedPoke: PokeList?)async -> Pokemon?{
        //
        guard let tappedPoke = tappedPoke else {
            print("empty tapped poke")
            return nil
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
        return pokeDetail
    }
}
