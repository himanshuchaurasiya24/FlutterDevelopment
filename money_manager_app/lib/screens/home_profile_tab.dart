import 'package:flutter/material.dart';
import 'package:money_manager_app/utils/constants.dart';

class HomeProfileTab extends StatelessWidget {
  const HomeProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        leading: const Icon(
          Icons.arrow_back,
        ),
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: defaultSpacing),
            child: Icon(
              Icons.settings,
            ),
          )
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: defaultSpacing,
            ),
            SingleChildScrollView(
              child: Expanded(
                flex: 1,
                child: Center(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(defaultRadius),
                        child: Image.asset(
                          'assets/images/avatar.jpeg',
                          width: 100,
                        ),
                      ),
                      Text(
                        'Himanshu Chaurasiya',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                      ),
                      Text(
                        'himanshuchaurasiya24@gmail.com',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: fontSubHeading),
                      ),
                      const Chip(
                          backgroundColor: primaryLight,
                          label: Text('Edit Profile')),
                    ],
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Expanded(
                flex: 2,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultSpacing),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'General',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                fontWeight: FontWeight.w700, fontSize: 20),
                      ),
                      const SizedBox(
                        height: defaultSpacing,
                      ),
                      const ProfileAccountInfoTile(
                          title: 'Bank Location',
                          subTitle: '47 Gulal Saray, Ghazipur\n233226',
                          imageUrl: 'assets/icons/location-1.png'),
                      const ProfileAccountInfoTile(
                          title: 'My Wallet',
                          subTitle: 'Manage Your Saved Wallet',
                          imageUrl: 'assets/icons/wallet.png'),
                      const SizedBox(
                        height: defaultSpacing,
                      ),
                      Text(
                        'Account',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                fontWeight: FontWeight.w700, fontSize: 20),
                      ),
                      const SizedBox(
                        height: defaultSpacing,
                      ),
                      const AccountItemTile(
                          title: 'My Account',
                          imageUrl: 'assets/icons/user-1.png'),
                      const AccountItemTile(
                          title: 'Notification',
                          imageUrl: 'assets/icons/bell.png'),
                      const AccountItemTile(
                          title: 'Privacy',
                          imageUrl: 'assets/icons/lock-on.png'),
                      const AccountItemTile(
                          title: 'About',
                          imageUrl: 'assets/icons/info-circle.png'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class ProfileAccountInfoTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final String imageUrl;
  const ProfileAccountInfoTile(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // horizontalTitleGap: 10,
      leading: Image.asset(imageUrl),
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: fontSubHeading),
      ),
      trailing: const Icon(
        Icons.keyboard_arrow_right_rounded,
        color: fontSubHeading,
      ),
    );
  }
}

class AccountItemTile extends StatelessWidget {
  final String title;
  final String imageUrl;

  const AccountItemTile({Key? key, required this.title, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 4),
      margin: const EdgeInsets.all(4),
      height: 37,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            imageUrl,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultSpacing),
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          const Expanded(
            flex: 1,
            child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: defaultSpacing),
                  child: Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: fontSubHeading,
                  ),
                )),
          )
        ],
      ),
    );
  }
}
