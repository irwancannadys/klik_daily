import 'package:flutter/material.dart';
import 'package:klik_daily/colors/klik_color.dart';
import 'package:klik_daily/feature/profile/profile_view_model.dart';
import 'package:klik_daily/repository/repository.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class ProfileMain extends StatelessWidget {
  const ProfileMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Repository repo = Provider.of(context, listen: false);
    return ProfileMainView(repository: repo);
  }
}


class ProfileMainView extends StatefulWidget {
  const ProfileMainView({Key? key, required this.repository}) : super(key: key);

  final Repository repository;

  @override
  _ProfileMainViewState createState() => _ProfileMainViewState();
}

class _ProfileMainViewState extends State<ProfileMainView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
        viewModelBuilder: () => ProfileViewModel(repository: widget.repository),
        onModelReady: (ProfileViewModel viewModel) async{
          await viewModel.getUser();
        },
        builder: (ctx, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: klikGreen,
              title: Text("Profile"),
            ),
            body: SafeArea(
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 130.0,
                        color: klikGreyProfile,
                      ),
                      Positioned(
                        bottom: -50,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 11.5),
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    image: DecorationImage(
                                        image: NetworkImage(viewModel.image),
                                        fit: BoxFit.cover)),
                              ),
                              Text(viewModel.firstName)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        decoration: new BoxDecoration(
                            color: klikGreyProfile,
                            borderRadius: new BorderRadius.only(
                                topLeft: const Radius.circular(40.0),
                                topRight: const Radius.circular(40.0))),
                        width: double.infinity,
                        height: 330,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: klikWhite,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: klikGrey),
                              ),
                              padding: EdgeInsets.all(8),
                              width: double.infinity,
                              margin: EdgeInsets.only(top: 56, left: 41, right: 41),
                              child: Row(
                                children: [
                                  Container(
                                    child: Image.asset("assets/id-card.png"),
                                    margin: EdgeInsets.only(right: 16.0),
                                  ),
                                  Text(viewModel.username),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: klikWhite,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: klikGrey),
                              ),
                              padding: EdgeInsets.all(8),
                              width: double.infinity,
                              margin: EdgeInsets.only(top: 16, left: 41, right: 41),
                              child: Row(
                                children: [
                                  Container(
                                    child: Image.asset("assets/email.png"),
                                    margin: EdgeInsets.only(right: 16.0),
                                  ),
                                  Text(viewModel.email),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: klikWhite,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: klikGrey),
                              ),
                              padding: EdgeInsets.all(8),
                              width: double.infinity,
                              margin: EdgeInsets.only(top: 16, left: 41, right: 41),
                              child: Row(
                                children: [
                                  Container(
                                    child: Image.asset("assets/phone.png"),
                                    margin: EdgeInsets.only(right: 16.0),
                                  ),
                                  Text(viewModel.phone),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: klikWhite,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: klikGrey),
                              ),
                              padding: EdgeInsets.all(8),
                              width: double.infinity,
                              margin: EdgeInsets.only(top: 16, left: 41, right: 41),
                              child: Row(
                                children: [
                                  Container(
                                    child: Image.asset("assets/location.png"),
                                    margin: EdgeInsets.only(right: 16.0),
                                  ),
                                  Text(viewModel.location),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
    });
  }
}
