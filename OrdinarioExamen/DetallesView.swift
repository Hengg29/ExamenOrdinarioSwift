//
//  DetallesView.swift
//  OrdinarioExamen
//
//  Created by Alexander Hernandez Henggeler on 01/12/25.
//

import SwiftUI

struct DetallesView: View {
    @State  var id: Int
    @State var nombre: String
    @State var race: String
    @State var descripcion: String
    @State var imagen: String
    @State var edad: Int?
    
    var body: some View {
        HStack{
          Spacer()
            
            AsyncImage(url: URL(string: imagen)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 150, height: 150)
            VStack{
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Text("\(id)")
                    .padding(6)
                Text("\(nombre)")
                    .underline()
                    .padding(6)
                
                HStack{
                    Text("Age")
                    Spacer()
                    Text("race")
                        .padding(.bottom , 12)
                }
                HStack{
                    Text("\(edad)")
                    Spacer()
                    Text("\(race)")
                        .padding(.bottom , 12)
                }
                Spacer()
                Spacer()
                
                
                
            
            }
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            
            
            
                
            
            
        }
        VStack(){
            Spacer()
            Text("\(descripcion)")
                .font(.system(size: 15, weight: .bold, design: .default))
                Spacer()
                Spacer()
                Spacer()
                
                
        }
        
        
    }
    
}

#Preview {
    DetallesView(id: 1, nombre: "Test", race: "Test", descripcion: "Test", imagen: "Test")
}
