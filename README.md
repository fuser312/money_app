# money_app

A Technical Test

Hi, in this project as per requirements, I have created the following app : 

https://user-images.githubusercontent.com/6002066/130191628-9033c5a7-fbb3-46c4-87df-df94c705c067.mp4

# Few points

* ## packages used:
  * I used getX for route and state management.
  * I used intl for formatting DateTime.

* ## Structure of the code, features and problem-solving:

 * The project follows MVC pattern with UI logic being separate from business logic.
 * I am assuming we will get an initial list of transaction and balance amount from the server, so it has been provided in app only.
 * I faced an issue where I had to dynamically change the styling of text after "." in my TextField, so I had to create my own custom `TextEditingController` to solve that.
 * I have added a snackbar provide by GetX for when user doesn't enters anything either in the "amount" or "to who" screen.
 * I have used animations provided by GetX only when changing screens and rippling effect when tapping buttons on the onScreen keypad.

* ## Issues:

 * The pay and top up icons are not exactly same as in the design as I couldn't found anything like that in the material icons. I could had combined icons.svg to create my own custom one but decided against it because I thought to use only what is provided by Material and time concerns.

 * The designs may not align exactly as provided but thats because I am working with pdf and not any designing softwares like figma, zepellin XD etc.

* ## Extra features that can be added:

 * The app can store locally all the changes that has been made to the transaction list either using `SharedPreference` or `Hive`

