# rpenya-eshop-challenge
eShop iOS app built for a challenge

This project is built under SOLID principles, clean architecture, modular architecture and MVVM in the presentation layer. It uses SwiftUI for presentation and Combine framework to communicate between the different layers.

The layers that compose this project are:
- Presentation Layer:
    - It uses MVVM for presentation layer.
    - Also it uses dependency injection to inject dependencies to the view and the view model (for example: use cases, custom objects, etc.)
    - The presentation layer has its own view entities different than domain entities.
- Domain layer:
    - Business logic layer.
    - Each use case is a reusable and independent component that executes an specific business logic.
    - Domain layer does not know anything about other layers, just fetches data from a repository defined as a protocol and returns the result.
    - Domain layer has its own domain entities different than view o data entities. 
- Data layer:
    - It uses the repository pattern. The repository pattern adds an abstraction layer over the the data sources from which the use cases get the data. With repository pattern, you can query your model objects from different data sources (Core Data, Realm, web server, etc.) with a only single-entry point.
    - Business logic shouldn’t know where the data comes from.
    - Data layer has its own data entities different than domain entities. 

I've also created a module called "Tracker". 
- Tracker module:
    - This module is only accessible from the data layer and it's who calculates the final position of the drone.
    - The Tracker module is another source of data for the app (as it could be an API or other external libraries). I've taken this decision to decouple and totally isolate this logic from the rest of the app, because this way you can modify its code and logic without impact to the rest of the app and also share this logic with other future apps.

## Architecture scheme:
![rpenya-eshop-challenge](https://user-images.githubusercontent.com/28446011/224689432-744d7c3e-8f95-4598-bcab-406a0e38e077.png)

## Data source
For this challenge they provided me an endpoint with [products](https://gist.githubusercontent.com/palcalde/6c19259bd32dd6aafa327fa557859c2f/raw/ba51779474a150ee4367cda4f4ffacdcca479887/Products.json), but also they required a list of promotions for diferent products, so I created an endpoint for [promotions](https://gist.githubusercontent.com/raulpenya/bd43e4cabd6afbb95ca965eb684fce4a/raw/e5ff063e927943af3485666caa60ce87673cff78/Promotions.json).
This endpoint returns a json with this structure:


## Testing coverage:
<img width="938" alt="Screen Shot 2023-03-13 at 12 17 28" src="https://user-images.githubusercontent.com/28446011/224689566-c8c9874a-26c3-471c-b40f-54df1f6515b4.png">



