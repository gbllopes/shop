import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/controller/controller_products_store.dart';
import 'package:shop/models/product.dart';

class ProductFormScreen extends StatefulWidget {
  const ProductFormScreen({Key? key}) : super(key: key);

  @override
  _ProductFormScreenState createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageURLFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _form = GlobalKey<FormState>();
  final _formData = Map<String, Object>();

  @override
  void dispose() {
    super.dispose();
    //Liberar qualquer tipo de uso de memória indevido
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageURLFocusNode.removeListener(_updateImage);
    _imageURLFocusNode.dispose();
  }

  @override
  void initState() {
    _imageUrlController.addListener(_updateImage);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (ModalRoute.of(context)?.settings.arguments != null) {
      if (_formData.isEmpty) {
        final product = ModalRoute.of(context)?.settings.arguments as Product;
        _formData['id'] = product.id;
        _formData['title'] = product.title;
        _formData['description'] = product.description;
        _formData['price'] = product.price;
        _formData['imageUrl'] = product.imageUrl;

        _imageUrlController.text = _formData['imageUrl'].toString();
      }
    }
  }

  void _updateImage() {
    if (isValidImageUrl(_imageUrlController.text)) {
      setState(() {});
    }
  }

  void _saveForm(ControllerProductsStore controller) {
    var _isValid = _form.currentState!.validate();

    if (!_isValid) {
      return;
    }

    _form.currentState!.save();
    Product product = Product(
        id: _formData['id'] == null
            ? 'p${controller.items.length + 1}'
            : _formData['id'].toString(),
        title: _formData['title'].toString(),
        description: _formData['description'].toString(),
        price: double.parse(_formData['price'].toString()),
        imageUrl: _formData['imageUrl'].toString());

    if (_formData['id'] == null) {
      controller.addProduct(product);
    } else {
      controller.updateProduct(product);
    }
    Navigator.of(context).pop();
  }

  bool isValidImageUrl(String url) {
    bool startWithHttp = url.toLowerCase().startsWith('http://');
    bool startWithHttps = url.toLowerCase().startsWith('https://');
    bool endsWithPng = url.toLowerCase().endsWith('.png');
    bool endsWithJpeg = url.toLowerCase().endsWith('.jpeg');
    bool endsWithJpg = url.toLowerCase().endsWith('.jpg');

    return (startWithHttps || startWithHttp) &&
        (endsWithPng || endsWithJpg || endsWithJpeg);
  }

  String convertValues(String value) {
    if (value == 'null') {
      return '';
    } else {
      return value;
    }
  }

  @override
  Widget build(BuildContext context) {
    final ControllerProductsStore productController =
        Provider.of<ControllerProductsStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de produto'),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
              onPressed: () {
                _saveForm(productController);
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                initialValue: convertValues(_formData['title'].toString()),
                decoration: InputDecoration(labelText: 'Título'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
                onSaved: (value) => _formData['title'] = value!,
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Informe um título válido!';
                  }

                  if (value.trim().length > 50) {
                    return 'Informe um título válido!';
                  }
                },
              ),
              TextFormField(
                initialValue: convertValues(_formData['price'].toString()),
                decoration: InputDecoration(labelText: 'Preço (R\$)'),
                textInputAction: TextInputAction.next,
                focusNode: _priceFocusNode,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
                onSaved: (value) => _formData['price'] = value!,
                validator: (value) {
                  bool isEmpty = value!.trim().isEmpty;
                  var newPrice = double.tryParse(value);
                  bool isInvalid = newPrice == null || newPrice <= 0;
                  if (isEmpty || isInvalid) {
                    return 'Informe um preço válido!';
                  }
                },
              ),
              TextFormField(
                initialValue:
                    convertValues(_formData['description'].toString()),
                decoration: InputDecoration(labelText: 'Descrição'),
                focusNode: _descriptionFocusNode,
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                onSaved: (value) => _formData['description'] = value!,
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Informe um título válido!';
                  }

                  if (value.trim().length > 50) {
                    return 'Informe um título válido!';
                  }
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'URL da Imagem'),
                      keyboardType: TextInputType.url,
                      focusNode: _imageURLFocusNode,
                      textInputAction: TextInputAction.done,
                      controller: _imageUrlController,
                      onSaved: (value) => _formData['imageUrl'] = value!,
                      onFieldSubmitted: (_) {
                        _saveForm(productController);
                      },
                      validator: (value) {
                        if (value!.trim().isEmpty || !isValidImageUrl(value)) {
                          return 'Informe uma URL válida!';
                        }
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 8),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1)),
                    alignment: Alignment.center,
                    child: _imageUrlController.text.isEmpty
                        ? Text('Informe a URL')
                        : Image.network(_imageUrlController.text),
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
