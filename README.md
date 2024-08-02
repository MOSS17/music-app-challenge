# Music App
This is an iOS project written in Swift using the SwiftUI framework. This project uses endpoints from the Spotify API and includes the following features:
- A scrollable list of 11 set artists displaying their name, profile picture and up to 3 of their genres
- Navigation to a details screen where you can see the previous information, the artists followers on Spotify, 5 of their albums and a list of related artists.
- Related artists are also a scrollable list and tapping on one will direct you to their details.

## How to run
The project is setup with `iOS 15.0` as a target, so `Xcode 13.0` or newer is necessary to run this project. 
Clone or download the repo and search for the `Secrets.swift` file inside the `Utils` folder. There you'll find the following code:
``` swift
let SPOTIFY_API_CLIENT_ID = "SPOTIFY_API_CLIENT_ID"
let SPOTIFY_API_SECRET_KEY = "SPOTIFY_API_SECRET_KEY"
let SPOTIFY_API_AUTH_KEY = "Basic \((SPOTIFY_API_CLIENT_ID + ":" + SPOTIFY_API_SECRET_KEY).data(using: .utf8)!.base64EncodedString())"
```
Replace `"SPOTIFY_API_CLIENT_ID"` with your client id from Spotify for Developers and `"SPOTIFY_API_SECRET_KEY"` with your secret key.

**After adding these keys, the project should be able to run on an iPhone Simulator or physical device.**

### If you don't already have access to the Spotify API:
If you don't have these you'll have to create an app on Spotify for Developers. It's free for development mode, only a spotify account is needed. This are the steps:
- Once you login with your Spotify account you can go to your [dashboard](https://developer.spotify.com/dashboard) click on the Create app button and fill the form.
- Click on the app you created and go to Settings.
- You should be able to see your Client id and Client secret.
- Add these to the project.

## Architecture and patterns
### MVVM
The MVVM architecture was chosen as a way of keeping the project organized improving its maintanability and scalability. 
Separating concerns keeps the code cleaner and help in making the code easier to test.

### Dependency injection
Dependency injection allows the service layer to be injected onto the ViewModel which improves testability a lot while also leading to cleaner code at the cost of a bit more complexity.

## UI showcase
This app was inspired mainly on Spotify and other designs found on Dribbble and Behance.
### Home screen
<img src="https://github.com/user-attachments/assets/757722f0-ace5-46d9-97d3-614c1976310a" alt="Description" width="300">

### Details screen
<img src="https://github.com/user-attachments/assets/67c3a34d-e3f8-4b91-90eb-0fe291d534c7" alt="Description" width="300">

### Related artists
<img src="https://github.com/user-attachments/assets/a0c7c5bb-0bcc-4c5d-8bae-9c1a67a05670" alt="Description" width="300">

### Background changes with dominant color
<img src="https://github.com/user-attachments/assets/2b0cf4ea-3be2-4e59-ada3-c09f41a0be4f" alt="Description" width="300">
<img src="https://github.com/user-attachments/assets/f79cb378-5f0e-407f-99ee-6372f452fea0" alt="Description" width="300">
