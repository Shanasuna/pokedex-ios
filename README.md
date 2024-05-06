# Pokedex iOS

Pokedex iOS application about show a pokemons from [https://pokeapi.co/](https://pokeapi.co/) 

**Features**

- You can see a list of various pokemons with their name and image
- You can search a pokemon from their name
- You can see each pokemon detail eg. image, name, types, etc.

**Instructions**

- Clone the project
- Open Terminal at project folder path “pokedex-ios”
- Run “pod install” (make sure your machine already install cocoapods)
- Open “Pokedex.xcworkspace” on Xcode
- Run

**Time spent on this project**

- Approximately ~10 hours

**iOS Libraries**

- **Alamofire:** For networking tasks
- **R.swift: For** easily access resources and ensure no runtime missing resources
- **IQKeyboardManagerSwift:** For handle keyboard display and dismiss
- **ProgressHUD:** For handle loading view
- **SnapKit:** For handle view constraint programatically
- **Kingfisher:** For load image to display in UIImageView
- **Swinject:** For dependencies injection

**App Limitation**

- Since there is no directly search api, I use local filter to search bunch of pokemons data that fetch all at once.
- There is no paging in the app cause of the above reason
- URL of pokemon image in the main page use work around to hard code URL with pokemon id. Because there is no image property on pokemon list api ([https://pokeapi.co/api/v2/pokemon](https://pokeapi.co/api/v2/pokemon)).
    - The only way to get pokemon image url from API is to get pokemon info from unnamed api url they sent in above api
    - So, I use link url of unnamed api they gave me to extract pokemon id and use them to restructure image url for best performance
