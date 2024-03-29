# rpenya-eshop-challenge
eShop iOS app built for a challenge

## Project specs:
- Xcode 14.1
- Deployment target: iOS 16.2
- 100% Swift & SwiftUI
- iOS SDKs: Combine
- No third party dependencies

## Architecture
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

## Architecture scheme:
![rpenya-eshop-challenge](https://user-images.githubusercontent.com/28446011/224689432-744d7c3e-8f95-4598-bcab-406a0e38e077.png)

![CleanArchitecture+MVVM](https://user-images.githubusercontent.com/28446011/224698151-d5e3e50c-c808-4e06-bf3d-f4b735d1cb77.png)

## Data source
For this challenge, they provided me an endpoint with [products](https://gist.githubusercontent.com/palcalde/6c19259bd32dd6aafa327fa557859c2f/raw/ba51779474a150ee4367cda4f4ffacdcca479887/Products.json), but also they required a list of promotions for diferent products, so I created an endpoint for [promotions](https://gist.githubusercontent.com/raulpenya/bd43e4cabd6afbb95ca965eb684fce4a/raw/e5ff063e927943af3485666caa60ce87673cff78/Promotions.json).
This endpoint returns a json with this structure:
<img width="506" alt="Screen Shot 2023-03-13 at 12 31 57" src="https://user-images.githubusercontent.com/28446011/224690085-44286cd3-3692-4762-adb9-1eacf0cefc1a.png">

## Layout
![Untitled](https://user-images.githubusercontent.com/28446011/224695078-c2d1bfc0-34b3-49bd-a11f-5407bb960582.png)

## Testing coverage
<img width="938" alt="Screen Shot 2023-03-13 at 12 17 28" src="https://user-images.githubusercontent.com/28446011/224689566-c8c9874a-26c3-471c-b40f-54df1f6515b4.png">
This project contains unit tests, UI test and snapshots using fastlane (https://docs.fastlane.tools/actions/snapshot/).

## Next steps:
- Add product detail.
- Persist orders & display orders history.
- Repeat order functionality. 

## More info:
https://docs.google.com/presentation/d/1YiPGbN94w1YN-J6NCCAIdLbH-QBjHNgIRP-odniStUc/edit?usp=sharing
