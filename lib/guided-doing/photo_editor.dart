import 'dart:io';
import 'package:image_editor_pro/image_editor_pro.dart';
import 'package:firexcode/firexcode.dart';
// import 'package:image_picker/image_picker.dart';

class PhotoEditor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage().xMaterialApp();
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File _image;
  // final picker = ImagePicker();

  Future<void> getimageditor() =>
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ImageEditorPro(
          appBarColor: Colors.blue,
          bottomBarColor: Colors.blue,
        );
      })).then((geteditimage) {
        if (geteditimage != null) {
          setState(() {
            _image = geteditimage;
          });
        }
      }).catchError((er) {
        print(er);
      });

  // Future getImage() async {
  //   final pickedFile = await picker.getImage(source: ImageSource.camera);

  //   setState(() {
  //     if (pickedFile != null) {
  //       _image = File(pickedFile.path);
  //     } else {
  //       print('No image selected.');
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return condition(
            condtion: _image == null,
            isTue: 'Open Editor'.text().xRaisedButton(
              onPressed: () {
                getimageditor();
              },
            ).toCenter(),
            isFalse:
                _image == null ? Container() : Image.file(_image).toCenter())
        .xScaffold(
      appBar: 'Image Editor Pro example'.xTextColorWhite().xAppBar(),
      floatingActionButton: Icons.add.xIcons().xFloationActiobButton(
            // onTap: getImage,
            color: Colors.red,
          ),
    );
  }
}

Widget condition({bool condtion, Widget isTue, Widget isFalse}) {
  return condtion ? isTue : isFalse;
}
