import 'package:final_project/services/api_repository.dart';
import 'package:final_project/view/detail.dart';
import 'package:final_project/view/images.dart';
import 'package:final_project/view/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_project/bloc/api_bloc.dart';
import 'package:final_project/model/api_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ApiBloc>(
          create: (BuildContext context) =>
              ApiBloc(ApiRepository())..add(LoadApiEvent()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Motopedia'),
          backgroundColor: Colors.green,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: blocBody(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.green,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  Widget blocBody() {
    return BlocBuilder<ApiBloc, ApiState>(
      builder: (context, state) {
        if (state is ApiLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ApiLoadedState) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.8,
            ),
            itemCount: state.motorcycle.length,
            itemBuilder: (context, index) {
              ApiModel motorbike = state.motorcycle[index];
              String imageUrl = MotorcycleImages.images[index % MotorcycleImages.images.length];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(motorbike: motorbike, imageUrl: imageUrl,),
                    ),
                  );
                },
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(
                        imageUrl,
                        width: 150,
                        height: 150,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 10),
                      Text(
                        '${motorbike.make} ${motorbike.model}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else if (state is ApiErrorState) {
          return Center(
            child: Text('Error: ${state.error}'),
          );
        } else {
          return Center(
            child: Text('Unknown state'),
          );
        }
      },
    );
  }

  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.pushReplacement( 
        context,
        MaterialPageRoute(
          builder: (context) => ProfilePage(),
        ),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }
}
