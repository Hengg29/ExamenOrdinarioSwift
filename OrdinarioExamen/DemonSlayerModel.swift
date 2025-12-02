//
//  DemonSlayerModel.swift
//  OrdinarioExamen
//
//  Created by Alexander Hernandez Henggeler on 01/12/25.
//

import Foundation
import Combine

class DemonSlayerModel: ObservableObject {
    @Published var demonSlayer: [DemonSlayer] = []
    
    func getPersonajes() {
        let endPoint = "https://www.demonslayer-api.com/api/v1/characters?limit=150"
        guard let apiURL = URL(string: endPoint) else {
            fatalError("URL no válida o no definida")
        }

        URLSession.shared.dataTask(with: apiURL) { data, response, error in

            if let error = error {
                print("Error al conectar: \(error.localizedDescription)")
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                print("Respuesta inválida del servidor")
                return
            }

            guard let data = data else {
                print("Datos vacíos")
                return
            }

            do {
                let decoded = try JSONDecoder().decode(Response.self, from: data)

                DispatchQueue.main.async {
                    self.demonSlayer = decoded.content
                }

            } catch {
                print("Error al decodificar JSON: \(error)")
            }

        }.resume()
    }
}
