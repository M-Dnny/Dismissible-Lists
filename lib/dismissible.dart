import 'package:flutter/material.dart';

import 'user.dart';

class DismissibleWidget extends StatefulWidget {
  const DismissibleWidget({Key? key}) : super(key: key);

  @override
  _DismissibleWidgetState createState() => _DismissibleWidgetState();
}

class _DismissibleWidgetState extends State<DismissibleWidget> {
  final List<User> _users = [
    User(
      'Jakob Owens',
      '@jakobowens',
      'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8M3x8fGVufDB8fHx8&auto=format&fit=crop&w=1000&q=60',
    ),
    User(
      'Craig McKay',
      '@craigmcKay',
      'https://images.unsplash.com/photo-1465984111739-03a1ee4647a0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MjB8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=60',
    ),
    User(
      'Houcine Ncib',
      '@houcinencib',
      'https://images.unsplash.com/photo-1530268729831-4b0b9e170218?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MjR8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=60',
    ),
    User(
      'Kelly Sikkema',
      '@kellysikkema',
      'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8cGVyc29ufGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=60',
    ),
    User(
      'Ethan Hoover',
      '@ethanhoover',
      'https://images.unsplash.com/photo-1500048993953-d23a436266cf?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHBlcnNvbnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=60',
    ),
    User(
      'Mubariz Mehdizadeh',
      '@mubariz',
      'https://images.unsplash.com/photo-1502232067273-9baec0dfaf23?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mjh8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=60',
    ),
    User(
      'Daniel Lincoln',
      '@mrlincoln',
      'https://images.unsplash.com/photo-1555952517-2e8e729e0b44?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjF8fHBlcnNvbnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=60',
    ),
    User(
      'Eleven',
      '@eleven',
      'https://images.unsplash.com/photo-1593104547489-5cfb3839a3b5?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fHBlcnNvbnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=60',
    ),
    User(
      'Elezabeth',
      '@ele',
      'https://images.unsplash.com/photo-1569124589354-615739ae007b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzN8fHBlcnNvbnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=60',
    ),
    User(
      'Hannah',
      '@hannah',
      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzl8fHBlcnNvbnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=60',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Dismissble'),
          elevation: 0,
          backgroundColor: Colors.grey.shade400),
      body: Container(
        padding: const EdgeInsets.only(right: 20, left: 20),
        color: Colors.white,
        child: ListView.builder(
            itemCount: _users.length,
            itemBuilder: (context, index) {
              final user = _users[index];
              return Dismissible(
                key: Key(user.toString()),
                onDismissed: (direction) {
                  if (direction == DismissDirection.startToEnd) {
                    ScaffoldMessenger.of(context).showMaterialBanner(
                        MaterialBanner(
                            content: Text(user.name),
                            backgroundColor: Colors.lightBlue,
                            actions: [
                          TextButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentMaterialBanner();
                              },
                              child: const Text('Dismissed'))
                        ]));
                  } else {
                    ScaffoldMessenger.of(context).showMaterialBanner(
                        MaterialBanner(
                            content: Text(user.name),
                            backgroundColor: Colors.yellow,
                            actions: [
                          TextButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentMaterialBanner();
                              },
                              child: const Text('Dismissed'))
                        ]));
                  }
                },
                background: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10)),
                ),
                secondaryBackground: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade500,
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: userComponent(user: _users[index]),
              );
            }),
      ),
    );
  }
}

userComponent({required User user}) {
  return Card(
    margin: const EdgeInsets.only(bottom: 10, top: 10),
    color: Colors.grey.shade300,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 1,
    shadowColor: Colors.grey.shade200,
    child: Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    user.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.name,
                      style: const TextStyle(fontWeight: FontWeight.w500)),
                  const SizedBox(height: 5),
                  Text(
                    user.username,
                    style: TextStyle(color: Colors.grey[500], fontSize: 13),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    ),
  );
}
