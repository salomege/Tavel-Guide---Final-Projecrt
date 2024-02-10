//
//  FoodAdvisor.swift
//  Travel Guide
//
//  Created by salome on 23.01.24.
//

class Dish {
    let photo: String
    let region: String
    let name: String
    let ingredients: String
    let aboutInfo: String
    
    init(photo: String, region: String, name: String, ingredients: String, aboutInfo: String) {
        self.photo = photo
        self.region = region
        self.name = name
        self.ingredients = ingredients
        self.aboutInfo = aboutInfo
    }
    
    static let dummyData = [
        Dish(
            photo: "Khachapuri",
            region: "Imereti",
            name: "Khachapuri",
            ingredients: "cheese, flour",
            aboutInfo: "Imeruli Khachapuri is a traditional Georgian dish consisting of a round bread filled with a mixture of cheese, typically sulguni, and other ingredients. It is baked until the bread is golden and the cheese is melted, resulting in a delicious and savory pastry."
        ),
        Dish(
            photo: "Mtsvadi",
            region: "Kakheti",
            name: "Mtsvadi",
            ingredients: "Pork / beef",
            aboutInfo: "Mtsvadi is a popular Georgian dish featuring skewers of marinated and grilled meat, commonly made with pork or beef. The meat is seasoned with spices and herbs, then cooked over an open flame, imparting a smoky flavor to the tender and flavorful kebabs."
        ),
        Dish(
            photo: "Lobiani",
            region: "Racha",
            name: "Lobiani",
            ingredients: "bean, flour",
            aboutInfo: "Lobiani is a Georgian dish that consists of a savory pastry filled with mashed beans, typically seasoned with spices like coriander and cumin. The dough is folded around the filling and baked, resulting in a delicious bean-filled bread."
        ),
        Dish(
            photo: "Acharuli",
            region: "Achara",
            name: "Acharuli Khachapuri",
            ingredients: "cheese, flour, egg",
            aboutInfo: "Acharuli Khachapuri is a traditional Georgian dish. It is a type of khachapuri, a savory pastry filled with cheese. What sets Acharuli Khachapuri apart is its boat-like shape, featuring an open center filled with molten cheese, a raw egg, and a generous amount of butter. The combination creates a rich and indulgent flavor, making it a popular and satisfying choice for those craving a unique and delicious Georgian culinary experience."
        ),
        Dish(
            photo: "Elarji",
            region: "Samegrelo",
            name: "Elarji",
            ingredients: "Coarse cornmeal, Cornflour, Sulguni cheese",
            aboutInfo: "Elarji is a traditional Georgian dish made from coarse cornmeal and sulguni cheese. The cornmeal and cheese are cooked together to form a sticky, dense mass, which is then shaped into a ball or a cake. This dish has a unique, hearty texture and a rich, cheesy flavor. Elarji is a popular dish in the Samegrelo region of Georgia, showcasing the country's diverse and delicious culinary traditions."
        ),
        Dish(
            photo: "guruli",
            region: "Guria",
            name: "Gurian Pie",
            ingredients: "cheese, flour, egg",
            aboutInfo: "Gurian Pie, also known as Guruli Khachapuri. This savory pie typically features a flaky and golden crust filled with a mixture of cheese, eggs, and other ingredients like greens or herbs. The combination of these ingredients results in a delightful and flavorful pastry, showcasing the rich culinary heritage of Georgia. Gurian Pie is often enjoyed as a delicious snack or part of a meal, offering a satisfying blend of textures and tastes."
        ),
        Dish(
            photo: "Khinkali",
            region: "Pshavi",
            name: "Khinkali",
            ingredients: "Beef, pork, onions, herbs, spices, flour",
            aboutInfo: "Khinkali are hand-folded dumplings that are a cornerstone of Georgian cuisine. They are traditionally filled with a mixture of ground meat, onions, herbs, and spices, and then boiled or steamed. The dough is thin and pleated, and the filling is juicy and flavorful. Khinkali are typically eaten by hand, and it is considered polite to leave the top knot of dough uneaten. "
        ),
        Dish(
            photo: "Khinkali",
            region: "Khevsureti",
            name: "Khinkali",
            ingredients: "Beef, pork, onions, herbs, spices, flour",
            aboutInfo: "Khinkali are hand-folded dumplings that are a cornerstone of Georgian cuisine. They are traditionally filled with a mixture of ground meat, onions, herbs, and spices, and then boiled or steamed. The dough is thin and pleated, and the filling is juicy and flavorful. Khinkali are typically eaten by hand, and it is considered polite to leave the top knot of dough uneaten. "
        ),
        Dish(
            photo: "Khinkali",
            region: "Tusheti",
            name: "Khinkali",
            ingredients: "Beef, pork, onions, herbs, spices, flour",
            aboutInfo: "Khinkali are hand-folded dumplings that are a cornerstone of Georgian cuisine. They are traditionally filled with a mixture of ground meat, onions, herbs, and spices, and then boiled or steamed. The dough is thin and pleated, and the filling is juicy and flavorful. Khinkali are typically eaten by hand, and it is considered polite to leave the top knot of dough uneaten. "
        ),
        Dish(
            photo: "Kubdari",
            region: "Svaneti",
            name: "Kubdari",
            ingredients: "Beef / pork, onions, spices, flour",
            aboutInfo: "Kubdari is a type of filled bread or savory pastry, typically made with a yeasted dough and stuffed with a mixture of minced meat, onions, and various spices such as coriander and chili pepper. The filling is often prepared with pork or beef, and the spices give Kubdari its distinctive and flavorful taste. The dough is usually folded over the filling, creating a pocket or round shape, and then baked until golden brown."
        ),
        Dish(
            photo: "TuTmaji",
            region: "Samtskhe-Javakheti",
            name: "Tutmaji",
            ingredients: "Lavashi, Matsoni (Georgian yogurt), erbo (Clarified butter)",
            aboutInfo: "Tutmaji is a traditional dish of Meskhetian cuisine made from simple ingredients. The dough thinned like lavash, is cut into thin strips, boiled in water mixed with matsoni, and finally poured into erbo (Clarified butter).  Finally, a soup-like dish is made in which dough balls swim gently. One of the outstanding dishes of Javakheti cuisine is still popular today and you will definitely be able to taste it in local restaurants."
        ),
        
        
        ]
}


struct Info {
    let photo: String
    let name: String
    let ingredients: String
    let aboutInfo: String
}
