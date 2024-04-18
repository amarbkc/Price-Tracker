
import 'package:flutter/material.dart';

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white70,
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container firebaseUIButton(BuildContext context, String title, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );
}

Container item(BuildContext context, String base64, String itemTopic,double iPrice, double cPrice,double tPrice){
  return Container(
    child: Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Row(
          children: <Widget>[
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                  image: AssetImage(
                      'assets/Screenshot@.png'
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Text(
                    itemTopic,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,

                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Column(
                          children: [
                            Text(
                              "Initial Price",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              "\$" + iPrice.toString(),
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Text(
                              "Current Price",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              "\$" + cPrice.toString(),
                              style: TextStyle(
                                color: iPrice > cPrice ? Colors.green : Colors.red,
                              ),
                            )
                          ],

                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Text(
                              "Your Price",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              "\$" + tPrice.toString(),
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            )
                          ],


                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),

      ),
    ),
  );

}

Future<void> showAddNewProductPrompt(BuildContext context) async {
  final urlController = TextEditingController();
  final priceController = TextEditingController();

  String? _errorMessage;

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(
            child: Text(
              'Add New Product',
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
        )
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 0.9),
        content: Column(
          mainAxisSize: MainAxisSize.min, // Avoid excessive content overflow
          children: [
            if (_errorMessage != null)
              Text(
                _errorMessage!,
                style: TextStyle(color: Colors.red),
              ),
            TextField(
              controller: urlController,
              cursorColor: Colors.black,
              keyboardType: TextInputType.url,
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  labelText: 'Enter Product URL',
                  labelStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            TextField(
              controller: priceController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                   ),
                labelText: 'Your Desired Price',
                labelStyle: TextStyle(
                  color: Colors.black,
                )
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
                'Cancel',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          TextButton(
            onPressed: () {

            },
            child: Text(
                'Save',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      );
    },
  );
}