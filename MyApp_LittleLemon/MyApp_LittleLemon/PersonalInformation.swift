//
//  PersonalInformation.swift
//  MyApp_LittleLemon
//
//  Created by Oleksandra Zhyrova on 09.02.2025.
//


import SwiftUI

struct PersonaInfo: Codable {
    struct NotificationPreferences: Codable {
        var orderStatuses: Bool = false
        var passwordChanges: Bool = false
        var specialOffers: Bool = false
        var newsletter: Bool = false
    }

    var firstName: String = ""
    var email: String = ""
    var lastName: String = ""
    var phoneNumber: String = ""
    var notificationPreferences: NotificationPreferences = .init()
    
    mutating func reset() {
        firstName = ""
        email = ""
        lastName = ""
        phoneNumber = ""
        notificationPreferences = .init()
    }
}

func deletePersonaInfo() {
    UserDefaults.standard.removeObject(forKey: "personalInfo")
}

func save(personaInfo: PersonaInfo) {
    let info = personaInfo
    if let encoded = try? JSONEncoder().encode(info) {
        UserDefaults.standard.set(encoded, forKey: "personalInfo")
    }
}

func loadPersonalInfo() -> PersonaInfo? {
    if let savedData = UserDefaults.standard.data(forKey: "personalInfo"),
       let decodedInfo = try? JSONDecoder().decode(PersonaInfo.self, from: savedData) {
        return decodedInfo
    }
    return nil
}



struct PersonalInformationView: View {
    @Environment(\.presentationMode) var presentationMode

//    @Binding var firstName: String
//    @Binding var email: String
    @Binding var personaInfo: PersonaInfo
    
//    @State private var lastName: String = ""
//    @State private var phoneNumber: String = ""
//    @State private var orderStatuses: Bool = true
//    @State private var passwordChanges: Bool = true
//    @State private var specialOffers: Bool = true
//    @State private var newsletter: Bool = true
    
    var body: some View
    {
        VStack(alignment: .leading, spacing: 16) {
            
            // Logo + Profile
            HStack {
                ZStack {
                    HStack {
                        Spacer()
                        Image("Logo")
                            .resizable()
                            .frame(width: 200, height: 50)
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        Image("Profile")
                            .resizable()
                            .frame(width: 60, height: 50)
                            .clipShape(Circle())
                    }
                }
            }
            
            Text("Personal information")
                .font(.title3)
                .fontWeight(.bold)
            
            Text("Avatar")
                .font(.body)
                .fontWeight(.regular)
            
            HStack {
                Image("Profile")
                    .resizable()
                    .frame(width: 88, height: 88)
                    .clipShape(Circle())
                
                
                Button("Change") {}
                    .padding()
                    .background(Color.init(cgColor: CGColor(red: 57.0/255.0,
                                                            green: 76.0/255.0,
                                                            blue: 69.0/255.0,
                                                            alpha: 1.0)))
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .frame(maxWidth: .maximum(100.0, 10.0))
                    .frame(maxHeight: .maximum(20.0, 10.0))
                
                Button("Remove") {}
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1.5)
                    )
            }
            
            TextField("First name", text: $personaInfo.firstName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            
            
            TextField("Last name", text: $personaInfo.lastName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            
            
            TextField("Email", text: $personaInfo.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            
            
            
            TextField("Phone number", text: $personaInfo.phoneNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Text("Email notifications")
                .font(.headline)
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Image(systemName: personaInfo.notificationPreferences.orderStatuses ? "checkmark.square.fill" : "square")
                        .foregroundColor(Color.init(cgColor: CGColor(red: 57.0/255.0,
                                                                     green: 76.0/255.0,
                                                                     blue: 69.0/255.0,
                                                                     alpha: 1.0)))
                        .onTapGesture {
                            personaInfo.notificationPreferences.orderStatuses.toggle()
                        }
                    Text("Order statuses")}
                
                HStack {
                    Image(systemName: personaInfo.notificationPreferences.passwordChanges ? "checkmark.square.fill" : "square")
                        .foregroundColor(Color.init(cgColor: CGColor(red: 57.0/255.0,
                                                                     green: 76.0/255.0,
                                                                     blue: 69.0/255.0,
                                                                     alpha: 1.0)))
                        .onTapGesture {
                            personaInfo.notificationPreferences.passwordChanges.toggle()
                        }
                    Text("Password changes")}
                
                
                HStack {
                    Image(systemName: personaInfo.notificationPreferences.specialOffers ? "checkmark.square.fill" : "square")
                        .foregroundColor(Color.init(cgColor: CGColor(red: 57.0/255.0,
                                                                     green: 76.0/255.0,
                                                                     blue: 69.0/255.0,
                                                                     alpha: 1.0)))
                        .onTapGesture {
                            personaInfo.notificationPreferences.specialOffers.toggle()
                        }
                    Text("Special offers")}
                
                HStack {
                    Image(systemName: personaInfo.notificationPreferences.newsletter ? "checkmark.square.fill" : "square")
                        .foregroundColor(Color.init(cgColor: CGColor(red: 57.0/255.0,
                                                                     green: 76.0/255.0,
                                                                     blue: 69.0/255.0,
                                                                     alpha: 1.0)))
                        .onTapGesture {
                            personaInfo.notificationPreferences.newsletter.toggle()
                        }
                    Text("Newsletter")}
            }
            
            Button("Log out") {
                personaInfo.reset()
                deletePersonaInfo()
                self.presentationMode.wrappedValue.dismiss()
            }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.yellow)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            HStack {
                Button("Discard changes") {}
                    .padding()
                    .frame(maxWidth: .infinity)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                            .font(.caption))
            
                NavigationLink(destination: MainScreen()) {
                    Text("Save changes")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 57.0/255.0, green: 76.0/255.0, blue: 69.0/255.0))
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .foregroundColor(.white)
                        .cornerRadius(10)
//                        .onTapGesture {
//                            save(personaInfo: personaInfo)
//                        }
                }
            }
        }
        .onDisappear {
            save(personaInfo: personaInfo)
        }
        .padding()
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrow.left")
                        .padding()
                        .background(Color.init(cgColor: CGColor(red: 57.0/255.0,
                                                                green: 76.0/255.0,
                                                                blue: 69.0/255.0,
                                                                alpha: 1.0)))
                        .clipShape(Circle())
                }
            }
        }
    }
}

struct PersonalInformationView_Previews: PreviewProvider {
    static var previews: some View {
        
        let personaInfo = PersonaInfo(firstName: "_firstName",
                                      email: "_email",
                                      lastName: "_lastName",
                                      phoneNumber: "_phoneNumber",
                                      notificationPreferences: .init(orderStatuses: true,
                                                                     passwordChanges: true,
                                                                     specialOffers: true,
                                                                     newsletter: true))
        PersonalInformationView(personaInfo: .constant(personaInfo))
//        PersonalInformationView(firstName: .constant("John Doe"),
//                                email: .constant("john@example.com"))
    }
}
