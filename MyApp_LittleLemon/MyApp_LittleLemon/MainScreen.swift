//
//  MainScreen.swift
//  MyApp_LittleLemon
//
//  Created by Oleksandra Zhyrova on 10.02.2025.
//

import SwiftUI

enum Category: String, CaseIterable {
    case starters = "Starters"
    case mains = "Mains"
    case dessert = "Dessert"
    case drinks = "Drinks"
}
struct MainScreen: View {
    
    @State private var searchText: String = ""
    @State private var selectedCategory: Category = .starters
    
    var filteredMenuItems: [MenuItem] {
        var filteredItems = menuItems
        
        // Filter by category
        filteredItems = filteredItems.filter { item in
            item.category == selectedCategory
        }
        
        // Filter by search text
        if !searchText.isEmpty {
            filteredItems = filteredItems.filter { item in
                item.name.lowercased().contains(searchText.lowercased()) ||
                item.description.lowercased().contains(searchText.lowercased())
            }
        }
        
        return filteredItems
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // Header
                HStack {
                    ZStack {
                        Image("Logo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 55)
                        
                        HStack {
                            Spacer()
                            Image("Profile")
                                .resizable()
                                .frame(width: 60, height: 55)
                                .clipShape(Circle())
                        }
                    }
                }
                
                RestaurantInfo(searchText: $searchText)
                
                // Order for Delivery
                Text("ORDER FOR DELIVERY!")
                    .font(.headline)
                    .padding(.horizontal)
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(Category.allCases, id: \.self ) { item in
                            CategoryButton(title: item.rawValue) {
                                selectedCategory = item
                            }
                        }
                    }
                }.padding(.horizontal)

                if filteredMenuItems.isEmpty
                {
                    Text("No items found")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    ForEach(filteredMenuItems) { item in
                        MenuItemRow(item: item)
                    }
                }
            }
        }
    }
    
    struct RestaurantInfo: View {
        
        @Binding var searchText: String
        
        var body: some View {
            HStack {
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Little Lemon")
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(.yellow)
                            Text("Chicago")
                                .font(.title2)
                                .foregroundColor(.white)
                            Text("We are a family-owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                                .font(.body)
                        }
                        
                        Spacer()
                        
                        Image("hero_image")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .scaledToFit()
                            .cornerRadius(10)
                    }
                    
                    //                // Search Icon
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .padding()
                            .background(Color.white.opacity(0.2))
                            .clipShape(Circle())
                        
                        TextField("Search...", text: $searchText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        //                                .padding(.horizontal)
                    }
                    .padding(.horizontal)
                }
            }
            .padding()
            .background(Color.init(cgColor: CGColor(red: 94.0/255.0,
                                                    green: 109.0/255.0,
                                                    blue: 104.0/255.0,
                                                    alpha: 1.0)))
        }
    }
}

// Category Button
struct CategoryButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Text(title)
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            .onTapGesture {
                action()
            }
    }
}

// Menu Item Model
struct MenuItem: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let price: String
    let imageName: String
    let category: Category
}

// Menu Item Row
struct MenuItemRow: View {
    let item: MenuItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text(item.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text("$\(item.price)")
                    .font(.headline)
            }
            Spacer()
            Image(item.imageName)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(10)
        }
        .padding()
    }
}

// Sample Menu Items
let menuItems = [
    MenuItem(name: "Greek Salad",
             description: "The famous greek salad of crispy lettuce, peppers, olives...",
             price: "12.99",
             imageName: "greek_salad",
             category: .starters),
    
    MenuItem(name: "Bruschetta",
             description: "Our Bruschetta is made from grilled bread smeared with garlic...",
             price: "7.99",
             imageName: "bruschetta",
             category: .starters),
    
    MenuItem(name: "Grilled Fish",
             description: "Barbequed catch of the day with red onion, crisp capers...",
             price: "20.00",
             imageName: "grilled_fish",
             category: .mains),
    
    MenuItem(name: "Pasta", description: "Penne with fried aubergines, tomato sauce, fresh chilli, garlic...",
             price: "18.99",
             imageName: "pasta",
             category: .mains),
    
    MenuItem(name: "Lemon Dessert",
             description: "Light and fluffy traditional homemade Italian Lemon cake...",
             price: "6.99",
             imageName: "lemon_dessert",
             category: .dessert),
    
    MenuItem(name: "Whiskey",
             description: "",
             price: "15.99",
             imageName: "whiskey",
             category: .drinks),
    
    MenuItem(name: "Lemonade",
             description: "",
             price: "7.99",
             imageName: "lemonade",
             category: .drinks),
    
]

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}

