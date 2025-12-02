//
//  ContentView.swift
//  OrdinarioExamen
//
//  Created by Alexander Hernandez Henggeler on 01/12/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var DemonList = DemonSlayerModel()
    var body: some View {
        NavigationStack{
            VStack {
                
                Text("Listatado de Personajes")
                    .font(.system(size: 25, weight: .bold, design: .default))
                Spacer()
                
              
                    
                    
                    
                List(DemonList.demonSlayer) { personaje in
                    NavigationLink(destination: DetallesView(id: personaje.id,nombre: personaje.name,race: personaje.race,descripcion: personaje.description,imagen: personaje.img,edad:personaje.age )){
                        HStack(spacing: 16) {
                            AsyncImage(url: URL(string: personaje.img)) { img in
                                img.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 100, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            VStack(spacing: 8){
                                Text(personaje.name)
                                    .foregroundColor(.black)
                                    .font(.system(size: 20, weight: .bold, design: .default))
                                
                                
                            }
                            
                            
                        }
                        .padding(.vertical, 8)
                        .listRowBackground(Color.white)//cambia la lista de color
                    }
                }
                    .scrollContentBackground(.hidden)//esto tmb es importante
                    .onAppear {
                        DemonList.getPersonajes()
                    }
                }
                
            
        }
    }
}

#Preview {
    ContentView()
}
