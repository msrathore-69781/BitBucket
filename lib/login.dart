import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q1/features/Repo/Repos.dart';
import 'package:q1/features/Repo/bloc/repos_bloc.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController ct = TextEditingController();
final ReposBloc rp=ReposBloc();
    return BlocConsumer<ReposBloc, ReposState>(
      bloc: rp,
      listener: (context, state) {
        // TODO: implement listener
      },
      buildWhen: (previous, current) {
if(current is NavigateToRepoPage){
  return true;
}
else 
return false;
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("GitHub Repository App"),
            backgroundColor: Colors.blueGrey,
          ),
          body: Center(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                  Card(
                    child:
                        FittedBox(child: Text("Enter Your Git Hub Usser Name")),
                  ),
                  TextField(
                    controller: ct,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "enter here...."),
                  ),
                  Center(
                      child: ElevatedButton(
                        style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black)),
                          onPressed: () {
                            String enteredUsnm = ct.text;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Repos(s: enteredUsnm),
                                ));
rp.add(getRepos());
                                
                          },
                          child: Text("Proceed")))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
