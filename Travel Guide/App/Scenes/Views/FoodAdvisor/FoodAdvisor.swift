//
//  FoodAdvisor.swift
//  Travel Guide
//
//  Created by salome on 23.01.24.
//

class Dish {
    let region: String
    let name: String
    let ingredients: String
    let aboutInfo: String
    
    init(region: String, name: String, ingredients: String, aboutInfo: String) {
        self.region = region
        self.name = name
        self.ingredients = ingredients
        self.aboutInfo = aboutInfo
    }
    
    static let dummyData = [
        Dish(
            region: "Imereti",
            name: "Khachapuri",
            ingredients: "cheese, flour",
            aboutInfo: "Imeruli Khachapuri is a traditional Georgian dish consisting of a round bread filled with a mixture of cheese, typically sulguni, and other ingredients. It is baked until the bread is golden and the cheese is melted, resulting in a delicious and savory pastry."
        ),
        Dish(
            region: "Kakheti",
            name: "Mtsvadi",
            ingredients: "Pork",
            aboutInfo: "Mtsvadi is a popular Georgian dish featuring skewers of marinated and grilled meat, commonly made with pork or beef. The meat is seasoned with spices and herbs, then cooked over an open flame, imparting a smoky flavor to the tender and flavorful kebabs."
        ),
        Dish(
            region: "Racha",
            name: "Lobiani",
            ingredients: "bean, flour",
            aboutInfo: "Lobiani is a Georgian dish that consists of a savory pastry filled with mashed beans, typically seasoned with spices like coriander and cumin. The dough is folded around the filling and baked, resulting in a delicious bean-filled bread.."
        ),
        
        ]
}


struct Info {
    let name: String
    let ingredients: String
    let aboutInfo: String
}
