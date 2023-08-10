import '../../packages_export.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> tabs = [
    'All',
    'War',
    'Government',
    'Politics',
    'Education',
    'Health',
    'Environment',
    'Economy',
    'Business',
    'Fashion',
    'Entertainment',
    'Sport'
  ];

  String selectedTab = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenHelper.screenWidth(context) * 0.04,
              vertical: ScreenHelper.screenHeight(context) * 0.02),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: tabs.asMap().entries.map(
                    (tab) {
                      if (selectedTab == tab.value.toString()) {
                        return Container(
                          height: ScreenHelper.screenHeight(context) * 0.05,
                          width: ScreenHelper.screenWidth(context) * 0.30,
                          margin: EdgeInsets.symmetric(
                              horizontal:
                                  ScreenHelper.screenWidth(context) * 0.01),
                          padding: EdgeInsets.all(
                              ScreenHelper.screenWidth(context) * 0.01),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(
                                ScreenHelper.screenHeight(context) * 0.025),
                          ),
                          child: Text(
                            tab.value.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.selectedTabTextColor),
                          ),
                        );
                      } else {
                        return GestureDetector(
                          onTap: () => setState(() {
                            selectedTab = tab.value.toString();
                          }),
                          child: Container(
                            height: ScreenHelper.screenHeight(context) * 0.05,
                            width: ScreenHelper.screenWidth(context) * 0.30,
                            margin: EdgeInsets.symmetric(
                                horizontal:
                                    ScreenHelper.screenWidth(context) * 0.01),
                            padding: EdgeInsets.all(
                                ScreenHelper.screenWidth(context) * 0.01),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.secondaryColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(
                                  ScreenHelper.screenHeight(context) * 0.025),
                            ),
                            child: Text(
                              tab.value.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.selectedTabTextColor),
                            ),
                          ),
                        );
                      }
                    },
                  ).toList(),
                ),
              ),
              SizedBox(height: ScreenHelper.screenHeight(context) * 0.02),
              Flexible(
                child: FutureBuilder<List<News>>(
                  future: NewsController().fetchData(selectedTab),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    } else if (!snapshot.hasData) {
                      return const Center(
                        child: Text('No data available'),
                      );
                    } else {
                      // Data fetched successfully
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final item = snapshot.data![index];
                          return Card(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical:
                                      ScreenHelper.screenHeight(context) * 0.01,
                                  horizontal:
                                      ScreenHelper.screenWidth(context) * 0.02),
                              child: Column(
                                children: [
                                  Image.network(item.urlToImage ??
                                      'https://static.vecteezy.com/system/resources/thumbnails/004/141/669/small/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg'),
                                  ListTile(
                                    title: Text(
                                      item.title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.w600),
                                    ),
                                    subtitle: Text(item.description,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
