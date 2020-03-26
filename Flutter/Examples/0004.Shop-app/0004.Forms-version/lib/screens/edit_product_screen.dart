import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';
import '../providers/products.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit-product';

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  // we should call dispose on the focus nodes to
  // free up the memory
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _form = GlobalKey<FormState>();

  var _isInit = true;
  var _initValues = {
    'title': '',
    'description': '',
    'price': '',
    'imageUrl': '',
  };

  var _editedProduct = new Product(
    id: null,
    title: '',
    description: 'null',
    price: 0,
    imageUrl: 'null',
  );

  @override
  void dispose() {
    super.dispose();

    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlFocusNode.dispose();
    _imageUrlFocusNode.removeListener(_updateImageUrl);

    _imageUrlController.dispose();
  }

  @override
  void initState() {
    super.initState();

    _imageUrlFocusNode.addListener(_updateImageUrl);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // The following condition is because, we use the
    // same Form widget for editing and adding.
    if (_isInit) {
      final productId = ModalRoute.of(context).settings.arguments as String;
      if (productId != null) {
        _editedProduct = Provider.of<Products>(
          context,
          listen: false,
        ).findById(productId);
        _initValues = {
          'title': _editedProduct.title,
          'description': _editedProduct.description,
          'price': _editedProduct.price.toString(),

          // We are going to use this as init value for image
          // URL. But we have also bound a controller to that.
          // We cannot do both. So, we set the initial value
          // of the controller
          // 'imageUrl': _editedProduct.imageUrl,
        };
        _imageUrlController.text = _editedProduct.imageUrl;
      }
    }
    _isInit = false;
  }

  void _updateImageUrl() {
    if (_imageUrlFocusNode.hasFocus == false) {
      // We trigger the build method here, because we know
      // that the state was updated but build was not triggered.
      setState(() {});
    }
  }

  void _onSubmitForm() {
    final isValid = _form.currentState.validate();
    if (isValid == false) {
      return;
    }
    _form.currentState.save();

    if (_editedProduct.id != null) {
      // Editing a product
      Provider.of<Products>(context, listen: false)
          .updateProduct(_editedProduct.id, _editedProduct);
    } else {
      // Adding a product
      Provider.of<Products>(context, listen: false).addProduct(_editedProduct);
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _onSubmitForm,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _form,

          // it will trigger validate on each text-field-input
          // on every key-stroke if set to true. Default is
          // false. So, no need to explicitly set it to false.
          autovalidate: false,

          // Stop us from exiting the page when user is typing
          // onWillPop: () {},

          // When working with Forms, you typically have multiple
          // input fields above each other - that's why you might
          // want to ensure that the list of inputs is scrollable.
          // Especially, since the soft keyboard will also take up
          // some space on the screen.
          // For very long forms (i.e. many input fields) OR in
          // landscape mode (i.e. less vertical space on the screen),
          // you might encounter a strange behavior: User input
          // might get lost if an input fields scrolls out of view.
          // That happens because ListView widget
          // dynamically removes and re-adds
          // widgets as they scroll out of and back into view.
          // For short lists/ portrait-only apps, where only minimal
          // scrolling might be needed, a ListView should be fine,
          // since items won't scroll that far out of view
          // (ListView has a certain threshold until which it will
          // keep items in memory).
          // But for longer lists or apps that should work in
          // landscape mode as well - or maybe just to be safe -
          // you might want to use a Column (combined with
          // SingleChildScrollView) instead. Since SingleChildScrollView
          // doesn't clear widgets that scroll out of view, you are
          // not in danger of losing user input in that case.
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                initialValue: _initValues['title'],

                // controls what the bottom-right key on the
                // keyboard will look like.
                // e.g., check-mark, done, next, etc.
                textInputAction: TextInputAction.next,

                // onSubmit from keyboard, change focus
                // to 'Price' input
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
                onSaved: (value) {
                  _editedProduct = Product(
                    id: _editedProduct.id,
                    isFavourite: _editedProduct.isFavourite,
                    title: value,
                    description: _editedProduct.description,
                    price: _editedProduct.price,
                    imageUrl: _editedProduct.imageUrl,
                  );
                },
                validator: (value) {
                  // return 'some string' will treat it as
                  // error message
                  // return 'Some string';

                  // return 'null' means input is correct
                  // return null;

                  if (value.isEmpty) {
                    return 'Title can\'t be empty';
                  }

                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Price'),
                initialValue: _initValues['price'],
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                textInputAction: TextInputAction.next,
                focusNode: _priceFocusNode,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
                onSaved: (value) {
                  _editedProduct = Product(
                    id: _editedProduct.id,
                    isFavourite: _editedProduct.isFavourite,
                    title: _editedProduct.title,
                    description: _editedProduct.description,
                    price: double.parse(value),
                    imageUrl: _editedProduct.imageUrl,
                  );
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a price.';
                  }

                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number.';
                  }

                  if (double.parse(value) <= 0) {
                    return 'Please enter a number greater than 0';
                  }

                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                initialValue: _initValues['description'],

                // how many lines to be displayed. adding
                // more will make it scrollable
                maxLines: 3,

                // This will add a 'enter' as bottom-right key on
                // the keyboard where if the user pushes, a new line
                // will be entered in the description
                keyboardType: TextInputType.multiline,
                focusNode: _descriptionFocusNode,
                onSaved: (value) {
                  _editedProduct = Product(
                    id: _editedProduct.id,
                    isFavourite: _editedProduct.isFavourite,
                    title: _editedProduct.title,
                    description: value,
                    price: _editedProduct.price,
                    imageUrl: _editedProduct.imageUrl,
                  );
                },

                validator: (value) {
                  if (value.isEmpty) {
                    return 'Description can\'t be empty.';
                  }

                  if (value.length < 10) {
                    return 'Should be at least 10 characters.';
                  }

                  return null;
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 8, right: 10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                    ),
                    child: _imageUrlController.text.isEmpty
                        ? Text('Enter valid Url')
                        : FittedBox(
                            child: Image.network(_imageUrlController.text),
                            fit: BoxFit.cover,
                          ),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Image URL'),
                      keyboardType: TextInputType.url,
                      controller: _imageUrlController,

                      // When user un-selects this, we update
                      // the preview. Because textInputController
                      // doesn't trigger the build method for changes
                      // in the field. Also, losing focus won't
                      // trigger the build.
                      focusNode: _imageUrlFocusNode,

                      // It will submit the form
                      textInputAction: TextInputAction.done,

                      onSaved: (value) {
                        _editedProduct = Product(
                          id: _editedProduct.id,
                          isFavourite: _editedProduct.isFavourite,
                          title: _editedProduct.title,
                          description: _editedProduct.description,
                          price: _editedProduct.price,
                          imageUrl: value,
                        );
                      },

                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter an image URL.';
                        }

                        if (value.startsWith('http://') == false &&
                            value.startsWith('https://') == false) {
                          return 'Please enter a valid URL.';
                        }

                        if (value.endsWith('png') == false &&
                            value.endsWith('jpg') == false &&
                            value.endsWith('jpeg') == false) {
                          return 'Please enter a valid image URL.';
                        }

                        return null;
                      },

                      onFieldSubmitted: (_) {
                        _onSubmitForm();
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
