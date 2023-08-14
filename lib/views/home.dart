import 'package:flutter/material.dart';
import 'package:resepkuy/model/resep.dart';
import 'package:resepkuy/views/widget/detail_resep.dart';
import 'widget/resep_card.dart';
import 'package:resepkuy/model/resep_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Resep> _reseps = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    getResep();
  }

  Future<void> getResep() async {
    _reseps = await ResepApi.getResep();
    setState(() {
      _isLoading = false;
    });
    print(_reseps);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.restaurant_menu),
              SizedBox(
                width: 10,
              ),
              Text("makanYuk")
            ],
          ),
        ),
        body: ListView.builder(
          itemCount: _reseps.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                child: ResepCard(
                    title: _reseps[index].name,
                    rating: _reseps[index].rating.toString(),
                    cookTime: _reseps[index].totalTime,
                    thumbnailurl: _reseps[index].images,
                    description: _reseps[index].description),
                onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailResep(
                            name: _reseps[index].name,
                            rating: _reseps[index].rating.toString(),
                            totalTime: _reseps[index].totalTime,
                            images: _reseps[index].images,
                            description: _reseps[index].description,
                          ),
                        ),
                      )
                    });
          },
        ));
  }
}
