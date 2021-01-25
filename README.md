# DubizzleSampleListing

# Installation:

  1. clone the app
  2. run pod install in the project directory
  3. build, run or test



# Architecture

The app consists of Three Modules that are done in POP development as much as possible:

  1. ListingIOS main target
  2. listingIOSTests
  3. ListingIOSUITests


# Main Target

The main App target consists of 5 parts:

# 1. Network Layer:
  
  1. Network Client: It facilitates everything related to networks and it can work dynamically and efficiently with Large scale projects to do everything related to requests (get, post, put, etc...), it can construct URLS whether they are encoded or not, it can add parameters and queries as well. As an addition, it has some helper classes to ease the Model parsing using Encodable and Decodable. It can also Upload and Download files.
  2. Network Manager: It does everything related to the App requests, it gets the data and parses the models through the request performable protocol.
  
# 2. Navigation:
  
  1. It uses protocols to navigate seemlessly in any style needed and various more methods can be added to the BaseNavigatable protocol to present and push in various ways and animations
  2. A class that can build any screen and pass the necessary parameters to the destination view controllers seemlessly and error free.
  
# 3. Model:

  It is simply the model that carries the data coming from the server. conforms to Codable

# 4. View Model:

  It has a contractor that passes the Base View model protocol in addition to the custom actions and methods that are beneficial to this specific App
  The view model itself does all the logical operations and fetches the data from the web service while also firing custom actions (tuples) that indicate events which is benefecial also in Unit testing

# 5. View controllers:

  It gathers all the information and displays it to the user through the various controls
