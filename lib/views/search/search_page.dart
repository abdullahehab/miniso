import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:miniso/helpers/theme.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  stt.SpeechToText _speech = stt.SpeechToText();
  String _recognizedText = "";
  bool _isListening = false;
  XFile? selectedImg;

  @override
  void initState() {
    super.initState();
    _initSpeechState();
  }

  void _initSpeechState() async {
    bool available = await _speech.initialize();
    if (mounted) return;
    setState(() {
      _isListening = available;
    });
  }

  void _startListening() async {
    await _speech.listen(
      onResult: (result) {
        _recognizedText = result.recognizedWords;
        setState(() {});
      },
    );
    _isListening = true;
    setState(() {});
    showBottomSheet();
  }

  void _stopListening() async {
    await _speech.stop();
    setState(() {});

    if (!mounted) return;
    Navigator.pop(context);
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _recognizedText = result.recognizedWords;
    });
  }

  Future<void> showBottomSheet() async {
    await showModalBottomSheet(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) {
        return SizedBox(
          height: 200,
          width: double.infinity,
          child: Lottie.asset(
            'assets/animation/recording.json',
            height: 300,
            width: 300,
          ),
        );
      },
    );
  }

  Future openCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    selectedImg = image;
    setState(() {});

    if (!mounted) return;
    Navigator.pop(context);
  }

  Future openGallery() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    selectedImg = picked;
    setState(() {});

    if (!mounted) return;
    Navigator.pop(context);
  }

  Future<void> pickFromSheet() async {
    await showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('Choose an option'),
        actions: <Widget>[
          CupertinoActionSheetAction(
            onPressed: openGallery,
            child: const Text('Gallery'),
          ),
          CupertinoActionSheetAction(
            onPressed: openCamera,
            child: const Text('Camera'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(),
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Accessories, bags, etc',
            hintStyle: const TextStyle(color: Colors.black),
            border: InputBorder.none,
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed:
                      _speech.isNotListening ? _startListening : _stopListening,
                  icon:
                      Icon(_speech.isNotListening ? Icons.mic_off : Icons.mic),
                ),
                const SizedBox(
                  width: 5,
                ),
                IconButton(
                    onPressed: pickFromSheet,
                    icon: const Icon(Icons.camera_alt_outlined)),
                const SizedBox(
                  width: 5,
                ),
                const Icon(Icons.search),
                SizedBox(
                  width: 5,
                ),
              ],
            ),
          ),
          onChanged: (value) {
            // Perform search functionality here
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(_recognizedText),
            ],
          ),
        ),
      ),
    );
  }
}
