import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../widgets/auth_screen/alert_dialog.dart';
import 'bottom_bar_screen.dart';

class UploadProductScreen extends StatefulWidget {
  static const routeName = '/UploadProductForm';

  @override
  _UploadProductScreenState createState() => _UploadProductScreenState();
}

class _UploadProductScreenState extends State<UploadProductScreen> {
  final _formKey = GlobalKey<FormState>();
  Uuid uuid = const Uuid();
  var _productTitle = '';
  var _productPrice = '';
  var _productCategory = '';
  var _productBrand = '';
  var _productDescription = '';
  var _productQuantity = '';
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  String? _categoryValue;
  String? _brandValue;
  bool _isLoading = false;
  File _pickedImage = File("assets/images/user.png");
  String? imgUrl;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  showAlertDialog(BuildContext context, String title, String body) {
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(body),
          actions: [
            FlatButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _trySubmit() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();
      print(_productTitle);
      print(_productPrice);
      print(_productCategory);
      print(_productBrand);
      print(_productDescription);
      print(_productQuantity);
      // Use those values to send our auth request ...
    }
    if (isValid) {
      _formKey.currentState!.save();
      try {
        if (_pickedImage == File("assets/images/user.png")) {
          ErrorDialogMethod().showDialogMethod(
            "Please Pick an Image",
            context,
          );
        } else {
          setState(() {
            _isLoading = true;
          });
          final ref = FirebaseStorage.instance
              .ref()
              .child('productsImage')
              .child('$_productTitle.jpg');
          await ref.putFile(_pickedImage);
          imgUrl = await ref.getDownloadURL();

          final user = _auth.currentUser;
          final _uid = user!.uid;

          final productID = uuid.v4();
          FirebaseFirestore.instance.collection('products').doc(productID).set({
            'productID': productID,
            'productTitle': _productTitle,
            'productPrice': _productPrice,
            'productCategory': _productCategory,
            'productBrand': _productBrand,
            'productDescription': _productDescription,
            'productQuantity': _productQuantity,
            'imgUrl': imgUrl,
            'userID': _uid,
            'createdAt': Timestamp.now(),
          }).then(
            (value) =>
                Navigator.popAndPushNamed(context, BottomBarScreen.routeName),
          );
        }
      } catch (error) {
        ErrorDialogMethod().showDialogMethod(
          error.toString(),
          context,
        );
        print("error occucered => $error");
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _pickImageCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(
      source: ImageSource.camera,
      imageQuality: 40,
    );
    final pickedImageFile = File(pickedImage!.path);
    setState(() {
      _pickedImage = pickedImageFile;
    });
    // widget.imagePickFn(pickedImageFile);
  }

  void _pickImageGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    final pickedImageFile = pickedImage == File("assets/images/user.png")
        ? File("assets/images/user.png")
        : File(pickedImage!.path);

    setState(() {
      _pickedImage = pickedImageFile;
    });
    // widget.imagePickFn(pickedImageFile);
  }

  void _removeImage() {
    setState(() {
      _pickedImage = File("assets/images/user.png");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        height: kBottomNavigationBarHeight * 0.8,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
        ),
        child: Material(
          color: Theme.of(context).backgroundColor,
          child: InkWell(
            onTap: _trySubmit,
            splashColor: Colors.grey,
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(right: 2),
                        child: Text(
                          'Upload',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      GradientIcon(
                        Icons.upload,
                        20,
                        LinearGradient(
                          colors: <Color>[
                            Colors.green,
                            Colors.yellow,
                            Colors.deepOrange,
                            Colors.orange,
                            Colors.yellow.shade800
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Card(
                margin: const EdgeInsets.all(15),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 9),
                                child: TextFormField(
                                  key: const ValueKey('Title'),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter a Title';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: const InputDecoration(
                                    labelText: 'Product Title',
                                  ),
                                  onSaved: (value) {
                                    _productTitle = value!;
                                  },
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: TextFormField(
                                key: const ValueKey('Price \$'),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Price is missed';
                                  }
                                  return null;
                                },
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                    RegExp(
                                      r'[0-9]',
                                    ),
                                  ),
                                ],
                                decoration: const InputDecoration(
                                  labelText: 'Price \$',
                                  //  prefixIcon: Icon(Icons.mail),
                                  // suffixIcon: Text(
                                  //   '\n \n \$',
                                  //   textAlign: TextAlign.start,
                                  // ),
                                ),
                                //obscureText: true,
                                onSaved: (value) {
                                  _productPrice = value!;
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        /* Image picker here ***********************************/
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              //  flex: 2,
                              child: _pickedImage ==
                                      File("assets/images/user.png")
                                  ? Container(
                                      margin: const EdgeInsets.all(10),
                                      height: 200,
                                      width: 200,
                                      decoration: BoxDecoration(
                                        border: Border.all(width: 1),
                                        borderRadius: BorderRadius.circular(4),
                                        color:
                                            Theme.of(context).backgroundColor,
                                      ),
                                    )
                                  : Container(
                                      margin: const EdgeInsets.all(10),
                                      height: 200,
                                      width: 200,
                                      child: Container(
                                        height: 200,
                                        // width: 200,
                                        decoration: BoxDecoration(
                                          // borderRadius: BorderRadius.only(
                                          //   topLeft: const Radius.circular(40.0),
                                          // ),
                                          color:
                                              Theme.of(context).backgroundColor,
                                        ),
                                        child: Image.file(
                                          _pickedImage,
                                          fit: BoxFit.contain,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FittedBox(
                                  child: FlatButton.icon(
                                    textColor: Colors.white,
                                    onPressed: _pickImageCamera,
                                    icon: const Icon(
                                      Icons.camera,
                                      color: Colors.purpleAccent,
                                    ),
                                    label: Text(
                                      'Camera',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context)
                                            .textSelectionColor,
                                      ),
                                    ),
                                  ),
                                ),
                                FittedBox(
                                  child: FlatButton.icon(
                                    textColor: Colors.white,
                                    onPressed: _pickImageGallery,
                                    icon: const Icon(
                                      Icons.image,
                                      color: Colors.purpleAccent,
                                    ),
                                    label: Text(
                                      'Gallery',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context)
                                            .textSelectionColor,
                                      ),
                                    ),
                                  ),
                                ),
                                FittedBox(
                                  child: FlatButton.icon(
                                    textColor: Colors.white,
                                    onPressed: _removeImage,
                                    icon: const Icon(
                                      Icons.remove_circle_rounded,
                                      color: Colors.red,
                                    ),
                                    label: const Text(
                                      'Remove',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        //    SizedBox(height: 5),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              // flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 9),
                                child: Container(
                                  child: TextFormField(
                                    controller: _categoryController,

                                    key: const ValueKey('Category'),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter a Category';
                                      }
                                      return null;
                                    },
                                    //keyboardType: TextInputType.emailAddress,
                                    decoration: const InputDecoration(
                                      labelText: 'Add a new Category',
                                    ),
                                    onSaved: (value) {
                                      _productCategory = value!;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            DropdownButton<String>(
                              items: const [
                                DropdownMenuItem<String>(
                                  value: 'Phones',
                                  child: Text('Phones'),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'Clothes',
                                  child: Text('Clothes'),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'Beauty',
                                  child: Text('Beauty & health'),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'Shoes',
                                  child: Text('Shoes'),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'Funiture',
                                  child: Text('Funiture'),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'Watches',
                                  child: Text('Watches'),
                                ),
                              ],
                              onChanged: (String? value) {
                                setState(() {
                                  _categoryValue = value;
                                  _categoryController.text = value!;
                                  //_controller.text= _productCategory;
                                  print(_productCategory);
                                });
                              },
                              hint: const Text('Select a Category'),
                              value: _categoryValue,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 9),
                                child: Container(
                                  child: TextFormField(
                                    controller: _brandController,

                                    key: const ValueKey('Brand'),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Brand is missed';
                                      }
                                      return null;
                                    },
                                    //keyboardType: TextInputType.emailAddress,
                                    decoration: const InputDecoration(
                                      labelText: 'Brand',
                                    ),
                                    onSaved: (value) {
                                      _productBrand = value!;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            DropdownButton<String>(
                              items: const [
                                DropdownMenuItem<String>(
                                  value: 'Brandless',
                                  child: Text('Brandless'),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'Addidas',
                                  child: Text('Addidas'),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'Apple',
                                  child: Text('Apple'),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'Dell',
                                  child: Text('Dell'),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'H&M',
                                  child: Text('H&M'),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'Nike',
                                  child: Text('Nike'),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'Samsung',
                                  child: Text('Samsung'),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'Huawei',
                                  child: Text('Huawei'),
                                ),
                              ],
                              onChanged: (String? value) {
                                setState(() {
                                  _brandValue = value;
                                  _brandController.text = value!;
                                  print(_productBrand);
                                });
                              },
                              hint: const Text('Select a Brand'),
                              value: _brandValue,
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          key: const ValueKey('Description'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'product description is required';
                            }
                            return null;
                          },
                          //controller: this._controller,
                          maxLines: 10,
                          textCapitalization: TextCapitalization.sentences,
                          decoration: const InputDecoration(
                            //  counterText: charLength.toString(),
                            labelText: 'Description',
                            hintText: 'Product description',
                            border: OutlineInputBorder(),
                          ),
                          onSaved: (value) {
                            _productDescription = value!;
                          },
                          onChanged: (text) {
                            // setState(() => charLength -= text.length);
                          },
                        ),
                        //    SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              //flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 9),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  key: const ValueKey('Quantity'),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Quantity is missed';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    labelText: 'Quantity',
                                  ),
                                  onSaved: (value) {
                                    _productQuantity = value!;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}

class GradientIcon extends StatelessWidget {
  const GradientIcon(
    this.icon,
    this.size,
    this.gradient,
  );

  final IconData icon;
  final double size;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: SizedBox(
        width: size * 1.2,
        height: size * 1.2,
        child: Icon(
          icon,
          size: size,
          color: Colors.white,
        ),
      ),
      shaderCallback: (Rect bounds) {
        final Rect rect = Rect.fromLTRB(0, 0, size, size);
        return gradient.createShader(rect);
      },
    );
  }
}
