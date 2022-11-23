import 'package:bookstore/src/constant/colors.dart';
import 'package:bookstore/src/presentation/shared/appbar_helper.dart';
import 'package:bookstore/src/presentation/shared/sliver_appbar_helper.dart';
import 'package:bookstore/src/presentation/shared/spacing.dart';
import 'package:bookstore/src/util/text_helper.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      drawer: const Text('hi'),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBarHelper(
      scaffoldKey: GlobalKey(),
      onLanguageChanged: () {},
      useShadow: false,
      height: 110.0,
      backgroundColor: CustomColor.background,
      widget: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            right: 10.0,
            top: 2.0,
          ),
          child: Row(
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu),
                iconSize: 35.0,
                color: CustomColor.primary,
                padding: const EdgeInsets.all(30.0),
                constraints: const BoxConstraints(
                  minHeight: .0,
                  minWidth: .0,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    const Icon(
                      Icons.supervised_user_circle,
                      size: 40.0,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_cart_checkout),
                      iconSize: 35.0,
                      color: CustomColor.primary,
                      padding: const EdgeInsets.all(20.0),
                      constraints: const BoxConstraints(
                        minHeight: .0,
                        minWidth: .0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        NestedScrollView(
          physics: const NeverScrollableScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
            SliverPersistentHeader(
              delegate: SliverAppBarDelegate(
                height: 102.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Welcome back, Bunny!',
                        style: CustomTextStyles.textBase.regular.copyWith(
                          color: CustomColor.body,
                        ),
                      ),
                      const Spacing.vertical(2.0),
                      Text(
                        'What do you want to\nread today?',
                        style: CustomTextStyles.textXl.regular.copyWith(
                          color: CustomColor.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                toolbarHeight: 83.0,
                backgroundColor: CustomColor.background,
                flexibleSpace: _buildSearchBar(),
              ),
            ),
          ],
          body: Builder(
            builder: (context) {
              return CustomScrollView(
                key: const PageStorageKey<String>('HomeViewCustomScrollView'),
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                slivers: <Widget>[
                  SliverOverlapInjector(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                  ),
                  SliverToBoxAdapter(
                    child: _buildMainContent(),
                  ),
                  const SliverPadding(
                    padding: EdgeInsets.only(
                      top: 102.0,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        Positioned(
          bottom: .0,
          left: .0,
          right: .0,
          child: _buildBottomNavBar(),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
        ),
        child: Center(
          child: TextFormField(
            textAlignVertical: TextAlignVertical.center,
            style: CustomTextStyles.textBase.medium.copyWith(
              color: CustomColor.primary,
            ),
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              isDense: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 13.0,
                vertical: 16.0,
              ),
              hintText: 'Search',
              hintStyle: CustomTextStyles.textBase.light.copyWith(
                color: CustomColor.accent,
              ),
              prefixIcon: const Icon(
                Icons.search,
                size: 24.0,
                color: CustomColor.accent,
              ),
              filled: true,
              fillColor: CustomColor.accent.withOpacity(.15),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMainContent() {
    return Column(
      children: <Widget>[
        _buildGenreSection(),
        _buildGenreSection(),
      ],
    );
  }

  Widget _buildGenreSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildGenreSectionTabs(),
        const Spacing.vertical(35.0),
        _buildGenreSectionCards(),
      ],
    );
  }

  Widget _buildGenreSectionTabs() {
    return TabBar(
      controller: _tabController,
      tabs: const <Widget>[
        Text('hi'),
        Text('hihi'),
        Text('hihiihihi'),
      ],
    );
  }

  Widget _buildGenreSectionCards() {
    return SizedBox(
      height: 310.0,
      child: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
        ),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _buildBookCard(Colors.yellow),
          _buildBookCard(Colors.yellow),
          _buildBookCard(Colors.blue),
          _buildBookCard(Colors.red),
          _buildBookCard(Colors.yellow),
          _buildBookCard(Colors.blue),
          _buildBookCard(Colors.red),
          _buildBookCard(Colors.yellow),
          _buildBookCard(Colors.blue),
        ],
      ),
    );
  }

  Widget _buildBookCard(Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: const Color(0xFF06070D).withOpacity(.05),
                  blurRadius: 14.0,
                  offset: const Offset(
                    .0,
                    7.0,
                  ),
                ),
              ],
              color: color,
            ),
            height: 250.0,
            width: 160.0,
          ),
          const Spacing.vertical(15.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Catcher in the eye',
                  style: CustomTextStyles.textBase.semiBold.copyWith(
                    color: CustomColor.primary,
                  ),
                ),
                const Spacing.vertical(1.0),
                Text(
                  'JK Rowling',
                  style: CustomTextStyles.textXs.regular.copyWith(
                    color: CustomColor.body,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      height: 102.0,
      decoration: const BoxDecoration(
        color: CustomColor.neutral,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(80.0),
          bottom: Radius.circular(40.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.home),
            color: CustomColor.secondary,
            iconSize: 25.0,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu_book_rounded),
            color: CustomColor.body,
            iconSize: 25.0,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.bookmark_border_outlined),
            color: CustomColor.body,
            iconSize: 25.0,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
            color: CustomColor.body,
            iconSize: 25.0,
          ),
        ],
      ),
    );
  }
}
