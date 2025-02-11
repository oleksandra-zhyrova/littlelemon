//
//  AuthorizationForm.swift
//  MyApp_LittleLemon
//
//  Created by Oleksandra Zhyrova on 09.02.2025.
//


import SwiftUI

struct AuthorizationView: View {
//    @State private var name: String = ""
//    @State private var email: String = ""

    @State var personaInfo = PersonaInfo()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "leaf.fill")
                            .foregroundColor(.yellow)
                        Text("LITTLE LEMON")
                            .font(.headline)
                            .bold()
                    }
                    
                    Text("Little Lemon")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.yellow)
                    
                    Text("Chicago")
                        .font(.title2)
                        .foregroundColor(.black)
                    
                    Text("We are a family-owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                        .font(.body)
                        .foregroundColor(.white)
                }
                .padding()
                .background(Color.init(cgColor: CGColor(red: 57.0/255.0,
                                                        green: 76.0/255.0,
                                                        blue: 69.0/255.0,
                                                        alpha: 1.0)))
//                .cornerRadius(10)
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("Name *")
                        .font(.headline)
                    TextField("Enter your first name", text: $personaInfo.firstName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Text("Email *")
                        .font(.headline)
                    TextField("Enter your email", text: $personaInfo.email)
                        .keyboardType(.emailAddress)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    NavigationLink(destination: PersonalInformationView(personaInfo: $personaInfo))
                    {
                        Text("Continue")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.init(cgColor: CGColor(red: 57.0/255.0,
                                                                    green: 76.0/255.0,
                                                                    blue: 69.0/255.0,
                                                                    alpha: 1.0)))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding()
                Spacer()
            }
        }
    }
}


struct AuthorizationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizationView()
    }
}
