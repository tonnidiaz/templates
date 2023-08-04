import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frust/widgets/sidebar.dart';
import 'package:provider/provider.dart';
import 'mobile.dart';
import 'desktop.dart';
import 'stores/app.dart';
import 'utils/constants.dart';
import 'utils/functions.dart';
import 'widgets/bottom_sheet.dart';
import 'widgets/bottombar.dart';
import 'widgets/common.dart';
import 'widgets/titlebars.dart';

void main() {
  if (!isMobile) {
    setupWindowManager();
  }
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => AppStore())],
    child: isMobile ? const MobileApp() : const DesktopApp(),
  ));
}

class PageWrapper extends StatefulWidget {
  Widget? titleBar;
  Widget child;
  double? padding = 0;
  Function()? onRefresh;
  PageWrapper(
      {Key? key,
      required this.child,
      this.titleBar,
      this.padding,
      this.onRefresh})
      : super(key: key);

  @override
  State<PageWrapper> createState() => _PageWrapperState();
}

class _PageWrapperState extends State<PageWrapper> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  Widget build(BuildContext context) {
    final AppStore _appStore = context.watch();
    final route = ModalRoute.of(context)?.settings.name;
    String title = _appStore.title;
    if (route != null) {
      if (route == "/meta") {
        title = "Audio metadata Editor";
      } else if (route == "/convert") {
        title = "Audio converter";
      } else if (route == "/about") {
        title = "About";
      } else if (route == "/extras") {
        title = "More tools";
      }
    }

    return WillPopScope(
      onWillPop: () async {
        return _appStore.backEnabled;
      },
      child: Scaffold(
          appBar:
              isMobile ? MobileTitleBar(_appStore) : DesktopTitleBar(_appStore),
          drawer: Drawer(
            child: Column(children: [NavItem(text: "Item 1")]),
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              clog("Refreshing...");
              if (widget.onRefresh != null) {
                await widget.onRefresh!();
              }
            },
            child: Row(
              children: [
                isMobile ? Container() : const TSidebar(),
                SizedBox(
                  width: isMobile
                      ? double.infinity
                      : screenSize(context).width - sidebarW,
                  child: SingleChildScrollView(
                      physics: widget.onRefresh != null
                          ? const AlwaysScrollableScrollPhysics()
                          : null,
                      child: Padding(
                        padding: EdgeInsets.all(widget.padding ?? 0),
                        child: widget.child,
                      )),
                ),
              ],
            ),
          ),
          bottomNavigationBar: isMobile ? const TBottomBar() : null),
    );
  }
}
