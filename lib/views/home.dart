import 'dart:io';

// import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:ffmpeg_helper/ffmpeg_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tu/tu.dart';

class Ctrl extends GetxController {
  final videoFile = Rx(
      "/home/tonni/Downloads/The Simpsons S01-S30 (1989-) + Shorts (1987-1989) + Movie (2007)/The Simpsons S03 (360p re-dvdrip)/The Simpsons S03E02 Mr. Lisa Goes to Washington.mp4");
  final otherVideos = Rx<List<String>>([]);
}

// Future<Uint8List?> generateThumbnailInMemory(String videoPath) async {
//   final tempDir = await getTemporaryDirectory();
//   final outputPath = '${tempDir.path}/thumbnail.jpg';

//   final command = '-i "$videoPath" -ss 00:00:01 -vframes 1 "$outputPath"';
//   await FFmpegKit.execute(command);

//   if (File(outputPath).existsSync()) {
//     final bytes = await File(outputPath).readAsBytes();
//     return bytes;
//   }

//   return null;
// }

String getFilename(String fullpath) {
  return fullpath.split('/').last;
}

Future<File?> genThumb(String vidPath) async {
  try {
    clog("GETTING FILE...");
    final tempDir = await getTemporaryDirectory();
    final outputPath = "${tempDir.path}/${getFilename(vidPath)}.thumb.jpg";
    final s = await FFMpegHelper.instance.getThumbnailFileAsync(
        videoPath: vidPath,
        fromDuration: const Duration(seconds: 22),
        outputPath: outputPath);
    clog("Thumbnail created");
    return File(outputPath);
  } catch (err) {
    errorHandler(e: err);
    return null;
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ctrl = Get.put(Ctrl());
  // Initialize video player
  late final player = Player();
  late final playerCtrl = VideoController(player);
  @override
  void initState() {
    super.initState();
    // Load initial video
    getVideo();
  }

  Future getVideo() async {
    final videoPath = ctrl.videoFile.value;
    // check if file exists
    if (!File(ctrl.videoFile.value).existsSync()) {
      showToast("File does not exist", isErr: true).show(context);
      return clog("File does not exist");
    }

    final dir = Directory(videoPath.replaceAll(getFilename(videoPath), ""));
    clog(dir);
    final otherVideos = dir
        .listSync()
        .where((element) => getFilename(element.path).isVideoFileName)
        .map((e) => e.path)
        .toList();
    await player.open(Media(videoPath));
    player.play();
    ctrl.otherVideos.value = otherVideos;
  }

  @override
  Widget build(BuildContext context) {
    clog('HOME PAGE');
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          child: TuFlex(
            col: true,
            children: [
              // Player
              Container(
                color: Colors.black,
                width: double.infinity,
                height: 400,
                child: Video(
                  controller: playerCtrl,
                ),
                // child: Image.file(File(filename)),
              ),

              mY(10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () => TuFormField(
                    hint: "Enter file path...",
                    hasBorder: true,
                    value: ctrl.videoFile.value,
                    onChanged: (v) {
                      ctrl.videoFile.value = v;
                    },
                    suffix: TuButton(
                      text: "Get video",
                      onPressed: getVideo,
                    ),
                  ),
                ),
              ),
              Text(
                "More videos",
                style: styles.title(),
              ),
              mY(10),
              TuScrollview(
                scrollDirection: Axis.horizontal,
                child: Obx(
                  () => TuFlex(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    gap: 10,
                    children: ctrl.otherVideos.value
                        .map((data) => VideoThumb(vidPath: data))
                        .toList(),
                  ),
                ),
              )
            ],
          )),
    ));
  }
}

class VideoThumb extends StatefulWidget {
  final String vidPath;
  const VideoThumb({super.key, required this.vidPath});

  @override
  State<VideoThumb> createState() => _VideoThumbState();
}

class _VideoThumbState extends State<VideoThumb> {
  File? videoBytes;

  @override
  void initState() {
    super.initState();
    genThumb(widget.vidPath).then((value) {
      clog("VIDEO_BYTES");
      if (value?.existsSync() == true) {
        setState(() {
          videoBytes = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      constraints: BoxConstraints(minHeight: 150),
      color: videoBytes == null ? Colors.black38 : null,
      child: videoBytes != null
          ? TuFlex(
              col: true,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(videoBytes!)),
                Text(
                  getFilename(widget.vidPath),
                  softWrap: true,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: styles.subtitle,
                )
              ],
            )
          : const SizedBox(
              width: 60, height: 60, child: CircularProgressIndicator()),
    );
  }
}
