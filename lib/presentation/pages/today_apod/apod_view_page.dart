import 'package:astronomy_picture/container_injection.dart';
import 'package:astronomy_picture/core/date_convert.dart';
import 'package:astronomy_picture/core/success.dart';
import 'package:astronomy_picture/custom_colors.dart';
import 'package:astronomy_picture/domain/entities/apod.dart';
import 'package:astronomy_picture/presentation/bloc/bookmark/bookmark_apod_bloc.dart';
import 'package:astronomy_picture/presentation/pages/core/see_full_image.dart';
import 'package:astronomy_picture/presentation/widgets/today_apod/apod_video.dart';
import 'package:astronomy_picture/presentation/widgets/today_apod/apod_view_button.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:share_plus/share_plus.dart';

class ApodViewPage extends StatefulWidget {
  final Apod apod;
  const ApodViewPage({super.key, required this.apod});

  @override
  State<ApodViewPage> createState() => _ApodViewPageState();
}

class _ApodViewPageState extends State<ApodViewPage> {
  late Apod apod;
  late BookmarkApodBloc _bookmarkApodBloc;
  IconData iconSave = Icons.bookmark_border;

  bool isImage = true;

  @override
  void initState() {
    apod = widget.apod;
    _bookmarkApodBloc = getIt<BookmarkApodBloc>();
    _bookmarkApodBloc.input.add(
        IsSaveBookmarkApodEvent(date: DateConvert.dateToString(apod.date)));
    checkMediaType();
    super.initState();
  }

  void checkMediaType() {
    if (apod.mediaType == "video") {
      isImage = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: CustomColors.white.withOpacity(0.0),
        elevation: 0,
        actions: [
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
              color: CustomColors.white,
            ),
            color: CustomColors.black,
            itemBuilder: (context) => buildMenuButtons(),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [CustomColors.spaceBlue, CustomColors.black])),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Hero(
                      tag: 'apod-${apod.date.toString()}',
                      child: ClipRRect(child: buildMediaType())),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30.0, 350.0, 30.0, 0.0),
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.centerLeft,
                              colors: [
                                CustomColors.blue,
                                CustomColors.vermilion,
                                CustomColors.vermilion
                              ]),
                          borderRadius: BorderRadius.circular(30.0),
                          border: Border.all(
                              color: CustomColors.white.withOpacity(.3)),
                          boxShadow: [
                            BoxShadow(
                                color: CustomColors.blue.withOpacity(.7),
                                blurRadius: 10.0,
                                spreadRadius: 1.0,
                                offset: const Offset(0, 0))
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            apod.title ?? "",
                            style: TextStyle(
                                fontSize: 22.0,
                                color: CustomColors.white,
                                fontWeight: FontWeight.w900),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            apod.explanation ?? "",
                            style: TextStyle(
                              color: CustomColors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "by ${apod.copyright ?? "Nasa"}",
                            style: TextStyle(
                              color: CustomColors.white,
                            ),
                          ),
                          Text(
                            "Date: ${DateConvert.dateToString(apod.date)} (YYYY-MM-DD)",
                            style: TextStyle(
                              color: CustomColors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  ApodViewButtom(
                      icon: Icons.open_in_browser,
                      title: "Show Media",
                      description:
                          "If media are not able on app, tap here to see on browser",
                      onTap: () {}),
                  const SizedBox(
                    width: 15,
                  ),
                  StreamBuilder(
                      stream: _bookmarkApodBloc.stream,
                      builder: (context, snapshot) {
                        final state = snapshot.data;

                        if (state is LocalAccessSuccessBookmarkApodState) {
                          if (state.msg == ApodSaved().msg) {
                            if (iconSave.codePoint !=
                                Icons.bookmark.codePoint) {
                              showSnackBar(state.msg);
                              iconSave = Icons.bookmark;
                            }
                          } else {
                            if (iconSave != Icons.bookmark_border) {
                              showSnackBar(state.msg);
                              iconSave = Icons.bookmark_border;
                            }
                          }
                        }

                        if (state is IsSaveBookmarkApodState) {
                          if (state.wasSave) {
                            iconSave = Icons.bookmark;
                          }
                        }

                        return ApodViewButtom(
                            icon: iconSave,
                            title: "Save",
                            description:
                                "Save this content for quick access in future",
                            onTap: () {
                              if (iconSave.codePoint ==
                                  Icons.bookmark_border.codePoint) {
                                _bookmarkApodBloc.input
                                    .add(SaveBookmarkApodEvent(apod: apod));
                              } else {
                                _bookmarkApodBloc.input.add(
                                    RemoveSaveBookmarkApodEvent(
                                        date: DateConvert.dateToString(
                                            apod.date)));
                              }
                            });
                      })
                ]),
              ),
              const SizedBox(
                height: 20.0,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMediaType() {
    if (isImage) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) =>
                      SeeFullImage(url: apod.hdurl ?? apod.url ?? "")));
        },
        child: Container(
          height: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(apod.url ?? ""), fit: BoxFit.fitHeight),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0)),
              border: Border.all(color: CustomColors.white.withOpacity(.5))),
        ),
      );
    } else {
      return Container(
        height: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(apod.thumbnailUrl ??
                    "https://spaceplace.nasa.gov/gallery-space/en/NGC2336-galaxy.en.jpg"),
                fit: BoxFit.fitHeight),
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0)),
            border: Border.all(color: CustomColors.white.withOpacity(.5))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ApodVideo(url: apod.url ?? "")],
        ),
      );
    }
  }

  List<PopupMenuItem> buildMenuButtons() {
    List<PopupMenuItem> list = [];

    if (isImage) {
      list.add(PopupMenuItem(
          onTap: saveOnGallery,
          child: Text(
            "Save Image on Gallery",
            style: TextStyle(color: CustomColors.white),
          )));
    }

    list.addAll([
      PopupMenuItem(
          textStyle: TextStyle(color: CustomColors.white),
          onTap: shareOnlyLink,
          child: Text(
            "Share media only",
            style: TextStyle(color: CustomColors.white),
          )),
      PopupMenuItem(
          textStyle: TextStyle(color: CustomColors.white),
          onTap: sharedAllContent,
          child: Text(
            "Share All Content",
            style: TextStyle(color: CustomColors.white),
          ))
    ]);

    return list;
  }

  void saveOnGallery() {
    if (isImage) {
      GallerySaver.saveImage(apod.hdurl ?? apod.url ?? "").then((value) {
        if (value == true) {
          setState(() {
            showSnackBar("Image save on Gallery");
          });
        }
      });
    }
  }

  void shareOnlyLink() {
    Share.share(apod.hdurl ?? apod.url ?? "");
  }

  void sharedAllContent() {
    String link = apod.hdurl ?? apod.url ?? "";
    Share.share(
        "${apod.title}\n\n${apod.explanation}\n\nlink: $link\n\nby: ${apod.copyright}");
  }

  void showSnackBar(String msg) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
    });
  }
}
