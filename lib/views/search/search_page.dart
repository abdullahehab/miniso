import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
        setState(() {
          _recognizedText = result.recognizedWords;
        });
      },
    );
    setState(() {
      _isListening = true;
    });
  }

  void _stopListening() async {
    await _speech.stop();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _recognizedText = result.recognizedWords;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(onPressed: _startListening, icon: Icon(_isListening ? Icons.mic:Icons.mic_none)),
                      SizedBox(
                        width: 5,
                      ),
                      IconButton(
                          onPressed: pickImage,
                          icon: Icon(Icons.camera_alt_outlined)),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.search),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  labelText: 'Search',
                  hintText: 'Accessories, bags, etc',
                  helperText: 'supporting text',
                  filled: true,
                  fillColor: Colors.transparent,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.searchBorder,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        12,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
  }
}
