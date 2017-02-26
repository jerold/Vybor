# Vybor

Collaborative choice making app built with Angular 2 Dart, Bulma, and Firebase.

[Click here to use the app!](https://jerold.github.io/Vybor/)

# How does one use this thing

Sign in is done with google authentication.
The app drops your last name (replaces with just an initial) for privace.
Once signed in you can create a new groups, or contribute your ideas to one that already exists.
Pressing pick will select a non-disabled option from the group.
You can delete groups or options you have made using the "Manage your content" button in th upper right part of the app.

If you have feature requests you can [open an issue](https://github.com/jerold/Vybor/issues) here on Github.

Contributions are welcome!

# Running the app locally

Note: You will need to drop in Firebase details in the firebase_client.dart file before this will work.

```bash
pub get
pub serve
```
