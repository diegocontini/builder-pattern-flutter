import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ProfileCardBuilder()
              .withName('John Doe')
              .withImageUrl('https://picsum.photos/200')
              .withBioDescription('Flutter Developer')
              .withBackgroundColor(Colors.blueAccent)
              .withForeGroundColor(Colors.white)
              .build(),
        ),
      ),
    );
  }
}

class ProfileCardBuilder {
  String name = '';
  String imageUrl = '';
  String bioDescription = '';
  Color backgroundColor = Colors.white;
  Color foreGroundColor = Colors.black;

  ProfileCardBuilder withName(String name) {
    this.name = name;
    return this;
  }

  ProfileCardBuilder withImageUrl(String imageUrl) {
    this.imageUrl = imageUrl;
    return this;
  }

  ProfileCardBuilder withBioDescription(String bioDescription) {
    this.bioDescription = bioDescription;
    return this;
  }

  ProfileCardBuilder withBackgroundColor(Color backgroundColor) {
    this.backgroundColor = backgroundColor;
    return this;
  }

  ProfileCardBuilder withForeGroundColor(Color foreGroundColor) {
    this.foreGroundColor = foreGroundColor;
    return this;
  }

  Card build() {
    return Card(
      color: backgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: imageUrl.isNotEmpty ? CircleAvatar(backgroundImage: NetworkImage(imageUrl)) : Icon(Icons.image_not_supported),
            title: Text(name, style: TextStyle(color: foreGroundColor)),
            subtitle: Text(bioDescription, style: TextStyle(color: foreGroundColor)),
          ),
        ],
      ),
    );
  }
}
