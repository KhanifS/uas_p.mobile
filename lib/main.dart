import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [
            Row(
              children: <Widget>[
                Text(
                  '12:34',
                style : TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                ),
                SizedBox(width: 250.0),
                Icon(Icons.signal_cellular_alt_rounded),
                SizedBox(width: 2.0),
                Icon(Icons.wifi),
                SizedBox(width: 2.0),
                Transform.rotate(
                  angle: 1.5708,
                  child: Icon(Icons.battery_full_outlined),
                ),
                SizedBox(width: 16.0),
              ],
            ),
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: buildUserInfoRow(),
            ),
            SliverToBoxAdapter(
              child: buildNotificationBox(),
            ),
            SliverToBoxAdapter(
              child: buildPopularRecipes(),
            ),
            SliverToBoxAdapter(
              child: buildPopularCreators(),
            ),
          ],
        ),
        bottomNavigationBar: buildBottomNavigationBar(),
      ),
    );
  }
  Widget buildUserInfoRow() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Hello, Khanif Pratama Surbakti',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'What do you want to cook today?',
                style: TextStyle(
                  fontSize: 16.8,
                ),
              ),
            ],
          ),
          Spacer(),
          Icon(Icons.account_circle_sharp, size: 36.0),
        ],
      ),
    );
  }

  Widget buildNotificationBox() {
    return Container(
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(
                'Recipes recommendation',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 50.0),
              Image(
                image: AssetImage('images/gamcon.png'),
                height: 55.0,
                width: 55.0,
                fit: BoxFit.cover,
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Text(
            'Get your personalized recipes\nrecommendation in 4 steps',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Perform action for the first button
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.orangeAccent,
                ),
                child: Text('Get Started'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Perform action for the second button
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                child: Text('Skip'),
              ),
            ],
          ),
        ],
      ),
    );
  }

Widget buildPopularRecipes() {
  return Expanded(
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular Recipes',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'See All',
                style: TextStyle(
                  color: Colors.orange,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.0),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              RecipeCard(
                imagePath: 'images/recipe1.jpg',
                title: 'Spaghetti Bolognese',
                description: 'Pasta',
                timeIcon: Icons.access_time,
                timeText: '30-45 minutes',
                difficultIcon: Icons.star,
                difficultText: 'Medium',
                accountIcon: Icons.account_circle,
                accountText: 'Miriam Belina',
              ),
              SizedBox(width: 16.0),
              RecipeCard(
                imagePath: 'images/recipe2.jpg',
                title: 'Classic Beef Steak',
                description: 'Meat',
                timeIcon: Icons.access_time,
                timeText: '30-45 minutes',
                difficultIcon: Icons.star,
                difficultText: 'Easy',
                accountIcon: Icons.account_circle,
                accountText: 'James Nikidava',
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
}


  Widget buildBottomNavigationBar() {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: const Color.fromARGB(255, 250, 248, 248),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(220, 225, 159, 77),
              borderRadius: BorderRadius.circular(12.0),
            ),
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.home, color: Colors.black),
                SizedBox(width: 8.0),
                Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.search),
          Icon(Icons.add),
          Icon(Icons.book_outlined),
        ],
      ),
    );
  }
  
class RecipeCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final IconData timeIcon;
  final String timeText;
  final IconData difficultIcon;
  final String difficultText;
  final IconData accountIcon;
  final String accountText;

  RecipeCard({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.timeIcon,
    required this.timeText,
    required this.difficultIcon,
    required this.difficultText,
    required this.accountIcon,
    required this.accountText
  });

@override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.only(right: 16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            height: 100.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10.0),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(description),
          SizedBox(height: 8.0),
          Row(
            children: [
              Icon(timeIcon),
              SizedBox(width: 4.0),
              Text(timeText),
            ],
          ),
          Row(
            children: [
              Icon(difficultIcon),
              SizedBox(width: 4.0),
              Text(difficultText),
            ],
          ),
          Row(
            children: [
              Icon(accountIcon),
              SizedBox(width: 4.0),
              Text(accountText),
            ],
          ),
        ],
      ),
    );
  }
}

Widget buildPopularCreators() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular Creators',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'See All',
                style: TextStyle(
                  color: Colors.orange,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.0),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              PopularCreatorCard(
                ImagePath: 'images/user1.jpg',
                userName: 'Miriam Belina',
                bookIcon: Icons.book,
                bookText: '10 Recipes',
                loveIcon: Icons.favorite,
                loveText: '500 Likes',
              ),
              SizedBox(width: 16.0),
              PopularCreatorCard(
                ImagePath: 'images/user2.jpg',
                userName: 'James Nikidava',
                bookIcon: Icons.book,
                bookText: '15 Recipes',
                loveIcon: Icons.favorite,
                loveText: '800 Likes',
              ),
              // Add more PopularCreatorCard widgets as needed
            ],
          ),
        ),
      ],
    );
  }
class PopularCreatorCard extends StatelessWidget {
  final String ImagePath;
  final String userName;
  final IconData bookIcon;
  final String bookText;
  final IconData loveIcon;
  final String loveText;

  PopularCreatorCard({
    required this.ImagePath,
    required this.userName,
    required this.bookIcon,
    required this.bookText,
    required this.loveIcon,
    required this.loveText,
  });

@override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.only(right: 16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            child: Image.asset(
              ImagePath,
              height: 100.0,
              width: 100.0,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            userName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Row(
            children: [
              Icon(bookIcon),
              SizedBox(width: 4.0),
              Text(bookText),
            ],
          ),
          SizedBox(height: 8.0),
          Row(
            children: [
              Icon(loveIcon),
              SizedBox(width: 4.0),
              Text(loveText),
            ],
          ),
        ],
      ),
    );
  }
}