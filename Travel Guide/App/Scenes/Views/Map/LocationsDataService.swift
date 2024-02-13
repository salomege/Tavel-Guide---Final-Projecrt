//
//  LocationsDataService.swift
//  Travel Guide
//
//  Created by salome on 22.01.24.
//

import Foundation
import MapKit

class LocationsDataService {
    
    static let locations: [Location] = [
        
        Location(
            cityName: "Tbilisi",
            name: "Narikhala fortress",
            imageName: "Narikhala",
            description: "Narikala Fortress is an ancient landmark located in Tbilisi, Georgia. Situated on a hill overlooking the city, it has a rich history dating back to the 4th century. Originally constructed by the Persians, it underwent numerous renovations and expansions under various rulers, including the Arabs, Georgians, Mongols, and Ottomans." ,
            coordinates: CLLocationCoordinate2D(latitude: 41.6877973, longitude: 44.8089826997702)
            
        ),
        
        Location(
            cityName: "Tbilisi",
            name: "Sameba Cathedral",
            imageName: "Sameba",
            description: "The Holy Trinity Cathedral of Tbilisi, commonly known as Sameba Cathedral, is a prominent religious landmark in Tbilisi, Georgia. Completed in 2004, it is one of the largest Orthodox Christian churches in the world. ",
            coordinates: CLLocationCoordinate2D(latitude: 41.6975475, longitude: 44.81652234217589)
            
        ),
        Location(
            cityName: "Mtskheta",
            name: "Svetitskhoveli",
            imageName: "Svetitskhoveli",
            description: "Svetitskhoveli Cathedral, located in the historic town of Mtskheta, Georgia, is a significant religious and cultural landmark. Built in the 11th century, it stands on the site where, according to tradition, the robe of Jesus Christ was buried. The cathedral is renowned for its stunning architecture, featuring intricate frescoes, ornate carvings, and a distinctive cruciform design. It serves as a symbol of Georgian Orthodox Christianity's rich heritage and remains a place of pilgrimage and worship to this day.",
            coordinates: CLLocationCoordinate2D(latitude: 41.842010, longitude: 44.720892)
        ),
        Location(
            cityName: "Mtskheta",
            name: "Jvari monastery",
            imageName: "Jvari",
            description:"Jvari Monastery, situated atop a hill overlooking the ancient town of Mtskheta in Georgia, is a UNESCO World Heritage Site and a prominent symbol of Georgian Christianity. Built in the 6th century, it is renowned for its distinctive cruciform design and its significance in Georgian history and spirituality. The monastery offers breathtaking views of the surrounding landscape and serves as a pilgrimage site, attracting visitors from around the world who come to admire its architectural beauty and soak in its spiritual atmosphere.",
            coordinates: CLLocationCoordinate2D(latitude: 41.8383822, longitude: 44.73337759565949)
        ),
        Location(
            cityName: "Shida Kartli",
            name: "Uplistsikhe",
            imageName: "Uflistsikhe",
            description: "Uplistsikhe is an ancient cave town in eastern Georgia, near Gori. Carved into rock cliffs along the Mtkvari River, it dates back to the early Iron Age. Serving as a political and religious center, it features caves, tunnels, temples, dwellings, and a theater. Today, it's a fascinating archaeological site showcasing Georgia's rich history.",
            coordinates: CLLocationCoordinate2D(latitude: 41.9658125, longitude: 44.2101251)
        ),
        Location(
            cityName: "Kvemo Kartli",
            name: "Dashbashi canyon",
            imageName: "Dashbashi",
            description: "Dashbashi Canyon is a stunning natural wonder located in the Kvemo Kartli region of Georgia. Carved by the Khrami River over thousands of years, the canyon boasts striking rock formations, lush greenery, and cascading waterfalls. Visitors can explore its rugged terrain, hike along scenic trails, and marvel at the beauty of the surrounding landscape. Dashbashi Canyon is a popular destination for outdoor enthusiasts and nature lovers seeking adventure and tranquility amidst Georgia's breathtaking scenery.",
            coordinates: CLLocationCoordinate2D(latitude: 41.582062, longitude: 44.13702442808219)
        ),
        Location(
            cityName: "Kazbegi",
            name: "Gergeti",
            imageName: "Gergeti",
            description: "Gergeti is a picturesque village nestled in the foothills of the Caucasus Mountains near Stepantsminda, Georgia. It's renowned for its iconic Gergeti Trinity Church, perched dramatically on a hill overlooking the village and surrounded by breathtaking mountain vistas. Visitors can hike or drive up to the church to enjoy panoramic views of the surrounding landscape, including the towering Mount Kazbek. Gergeti offers a tranquil retreat for travelers seeking stunning natural beauty and cultural immersion in the heart of the Georgian countryside.",
            coordinates: CLLocationCoordinate2D(latitude: 42.662129, longitude: 44.620408)
        ),
        Location(
            cityName: "Tusheti",
            name: "Omalo",
            imageName: "Omalo",
            description: "Omalo is a remote and charming village located in the Tusheti region of northeastern Georgia. Situated amidst rugged mountains and lush valleys, Omalo is known for its traditional stone towers and picturesque setting. It serves as the administrative center of Tusheti and offers visitors a glimpse into the region's rich cultural heritage and stunning natural landscapes. Travelers can explore the village's narrow streets, visit historic churches, and embark on scenic hikes to nearby attractions such as the Keselo Fortress. Omalo provides a peaceful and authentic retreat for those seeking adventure and cultural immersion in Georgia's mountainous regions.",
            coordinates: CLLocationCoordinate2D(latitude: 42.3707666, longitude: 45.6334609)
        ),
        Location(
            cityName: "Kakheti",
            name: "Sighnaghi",
            imageName: "Sighnaghi",
            description: "Sighnaghi is a charming hilltop town located in the Kakheti region of eastern Georgia. Renowned for its well-preserved 18th-century architecture and romantic atmosphere, Sighnaghi offers stunning views of the Alazani Valley and the Caucasus Mountains. The town is surrounded by fortified walls with several towers and boasts narrow cobblestone streets lined with colorful houses adorned with wooden balconies. Visitors can explore its historic sites, including the Sighnaghi Museum, visit nearby wineries to sample local wines, and enjoy panoramic vistas from the town's elevated position. Sighnaghi is a popular destination for those seeking a tranquil retreat amidst Georgia's beautiful countryside.",
            coordinates: CLLocationCoordinate2D(latitude: 41.6184557, longitude: 45.9220959)
        ),
        Location(
            cityName: "Kakheti",
            name: "Tsinandali",
            imageName: "Tsinandali",
            description: "Tsinandali is a historic village in the Kakheti region of Georgia, renowned for its winemaking heritage. It's particularly famous for the Tsinandali Estate, once owned by the 19th-century Georgian nobleman, Alexander Chavchavadze. The estate features a beautiful mansion surrounded by lush gardens and vineyards, where visitors can explore the wine cellar, stroll through the park, and learn about the traditional Georgian winemaking process. Tsinandali is a must-visit destination for wine enthusiasts and history buffs alike, offering a glimpse into Georgia's rich cultural and viticultural heritage.",
            coordinates: CLLocationCoordinate2D(latitude: 41.8941397, longitude: 45.5725423)
        ),
        Location(
            cityName: "Khevsureti",
            name: "Shatili",
            imageName: "Shatili",
            description: "Shatili is an ancient fortified village situated in the rugged mountains of Khevsureti, Georgia. Its distinctive stone towers, built for defense against invaders, give it a unique and captivating appearance. The village's medieval architecture, with its interconnected towers and narrow alleys, offers a glimpse into Georgia's rich history and culture. Shatili is a popular destination for visitors seeking to explore its ancient heritage and breathtaking mountain scenery.",
            coordinates: CLLocationCoordinate2D(latitude: 42.6587069, longitude: 45.1574033)
        ),
        Location(
            cityName: "Borjomi",
            name: "Mineral waters park",
            imageName: "Borjomi-Park",
            description: "Mineral Waters Park is a renowned recreational area located in Borjomi, Georgia. Nestled amidst lush forests and scenic landscapes, the park is famous for its natural mineral springs, which have been celebrated for their therapeutic properties for centuries. Visitors can stroll along picturesque walking trails, relax in the shade of towering trees, and indulge in the healing waters from various springs scattered throughout the park. Additionally, Mineral Waters Park offers amenities such as picnic areas, playgrounds, and cafes, making it a popular destination for families, nature enthusiasts, and those seeking relaxation and rejuvenation.",
            coordinates: CLLocationCoordinate2D(latitude: 41.86682045, longitude: 43.419927161648644)
        ),
        Location(
            cityName: "Akhaltsikhe",
            name: "Rabath fortress",
            imageName: "Rabath",
            description: "Rabath Fortress is a historic landmark located in Akhaltsikhe, Georgia. This ancient fortress has a diverse architectural style, showcasing influences from different periods of Georgian, Ottoman, and Russian rule. Within its walls, visitors can explore a museum, mosques, churches, a synagogue, and various other structures that reflect the region's rich cultural heritage. Rabath Fortress offers a fascinating glimpse into Georgia's complex history and serves as a prominent tourist attraction in the region.",
            coordinates: CLLocationCoordinate2D(latitude: 41.643456, longitude: 42.9789394)
        ),
        Location(
            cityName: "Samtskhe-Javakheti",
            name: "Vardzia",
            imageName: "Vardzia",
            description: "Vardzia is a remarkable cave monastery complex situated in southern Georgia, near the town of Aspindza. Carved into the steep slopes of the Erusheti Mountain, Vardzia dates back to the 12th century and was originally constructed as a defensive structure. It later evolved into a sprawling cave town, featuring hundreds of chambers, tunnels, churches, and living quarters spread over several levels. Vardzia's unique architecture and stunning frescoes make it a UNESCO World Heritage Site and a popular tourist destination, offering visitors a glimpse into Georgia's rich history and cultural heritage.",
            coordinates: CLLocationCoordinate2D(latitude: 41.3809744, longitude: 43.2844705)
        ),
        
        Location(
            cityName: "Kutaisi",
            name: "Bagrati cathedral",
            imageName: "Bagrati",
            description: "The Bagrati Cathedral, also known as the Cathedral of the Dormition, is a medieval Georgian Orthodox cathedral located in Kutaisi, Georgia. Built in the 11th century during the reign of King Bagrat III, the cathedral is a masterpiece of medieval Georgian architecture, featuring a cross-in-square design and elaborate decorative elements. Despite suffering damage over the centuries, including during invasions and earthquakes, the Bagrati Cathedral remains a symbol of Georgia's Christian heritage and a significant cultural landmark. It was inscribed as a UNESCO World Heritage Site in 1994 and continues to attract visitors with its historical and architectural significance.",
            coordinates: CLLocationCoordinate2D(latitude: 42.270675, longitude: 42.706934)
        ),
        Location(
            cityName: "Tskaltubo",
            name: "Sataplia cave",
            imageName: "Sataplia",
            description: "Sataplia is a natural reserve and tourist attraction located near the city of Kutaisi in Georgia. It is renowned for its unique karst landscape, which includes caves, canyons, and lush greenery. The main highlight of Sataplia is the Sataplia Cave, which features stunning stalactites and stalagmites, as well as footprints of dinosaurs preserved in the cave floor. Visitors can also explore the surrounding forested area and enjoy panoramic views from the observation platforms. Sataplia offers a fascinating blend of natural beauty and prehistoric wonders, making it a popular destination for tourists and nature enthusiasts alike.",
            coordinates: CLLocationCoordinate2D(latitude: 42.3105657, longitude: 42.6747426)
        ),
        Location(
            cityName: "khoni",
            name: "Okatse canyon",
            imageName: "Okatse",
            description: "Okatse Canyon is a breathtaking natural wonder located in the Imereti region of Georgia. Carved by the powerful Okatse River, the canyon features towering cliffs, lush greenery, and stunning waterfalls cascading into the depths below. Visitors can explore the canyon via a well-maintained walkway that hugs the cliffsides, offering spectacular views of the surrounding landscape. The highlight of the canyon is the Okatse Waterfall, which plunges over 50 meters into a crystal-clear pool below. Okatse Canyon is a paradise for nature lovers and adventure seekers, providing opportunities for hiking, photography, and immersive experiences in Georgia's pristine wilderness.",
            coordinates: CLLocationCoordinate2D(latitude: 42.4518669, longitude: 42.54984323295537)
        ),
        Location(
            cityName: "Samegrelo",
            name: "Martvili canyon",
            imageName: "Martvili",
            description: "Martvili Canyon is a picturesque natural landmark situated in the Samegrelo region of Georgia. Carved by the Abasha River, the canyon is known for its stunning turquoise waters, lush greenery, and towering cliffs adorned with colorful vegetation. Visitors can explore the canyon by boat, floating along the tranquil river and admiring the scenic surroundings. Along the way, they can marvel at cascading waterfalls, natural rock formations, and hidden caves. Martvili Canyon offers a peaceful and enchanting escape into Georgia's pristine natural beauty, making it a popular destination for tourists and nature lovers alike.",
            coordinates: CLLocationCoordinate2D(latitude: 42.455565050000004, longitude: 42.378298696664736)
        ),
        Location(
            cityName: "Zugdidi",
            name: "Dadiani Palace",
            imageName: "Dadiani-palace",
            description: "The Dadiani Palace is an elegant historic residence located in Zugdidi, Georgia. Once the seat of the Dadiani noble family, it showcases a blend of architectural styles, including neoclassical and baroque elements. The palace is renowned for its rich cultural heritage and extensive collections, including artifacts, artworks, and archaeological finds. Visitors can explore the opulent interiors, which feature lavish furnishings, ornate decorations, and a fascinating array of exhibits. The Dadiani Palace offers a glimpse into Georgia's aristocratic past and serves as a significant cultural landmark in the region.",
            coordinates: CLLocationCoordinate2D(latitude: 42.5122582, longitude: 41.873875828332224)
        ),
        Location(
            cityName: "Guria",
            name: "Bakhmaro",
            imageName: "Bakhmaro",
            description: "Bakhmaro is a charming mountain resort located in the Guria region of Georgia. Situated at an altitude of approximately 1,900 meters above sea level, Bakhmaro offers stunning panoramic views of the surrounding mountains and lush forests. Known for its fresh, clean air and cool climate, it is a popular destination for visitors seeking relaxation and outdoor activities such as hiking, horseback riding, and birdwatching. Bakhmaro is also famous for its medicinal springs, believed to have healing properties. The area is dotted with guesthouses and cottages, providing accommodation options for tourists looking to experience the tranquility and natural beauty of Georgia's highlands.",
            coordinates: CLLocationCoordinate2D(latitude: 41.8512722, longitude: 42.32448)
        ),
        Location(
            cityName: "Batumi",
            name: "Old Batumi",
            imageName: "Batumi",
            description: "Old Batumi refers to the historic district of Batumi, a coastal city located on the Black Sea coast of Georgia. This area is characterized by its charming cobblestone streets, colorful buildings, and architectural landmarks dating back to the late 19th and early 20th centuries. Old Batumi is home to numerous historic buildings, including mosques, churches, and synagogues, reflecting the city's diverse cultural heritage.",
            coordinates: CLLocationCoordinate2D(latitude: 41.638348, longitude: 41.634052)
        ),
        Location(
            cityName: "Svaneti",
            name: "Mestia",
            imageName: "Mestia",
            description: "Mestia is a picturesque mountain town located in the Svaneti region of Georgia. Situated amidst the towering peaks of the Caucasus Mountains, Mestia is renowned for its stunning natural beauty, rich cultural heritage, and distinctive medieval tower-houses. These stone towers, built by the indigenous Svan people for defensive purposes, create a unique skyline that is characteristic of the region. Visitors to Mestia can explore its charming cobblestone streets, visit the Svaneti Museum of History and Ethnography, and enjoy outdoor activities such as hiking, horseback riding, and skiing in the nearby mountains. Mestia is also a gateway to the remote villages and pristine landscapes of Upper Svaneti, making it a popular destination for adventure seekers and nature enthusiasts in Georgia.",
            coordinates: CLLocationCoordinate2D(latitude: 43.032029, longitude: 42.692388)
        ),
    ]
    
}
