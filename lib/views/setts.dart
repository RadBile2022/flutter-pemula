
import 'package:flutter/material.dart';

import '../controllers/CMController.dart';
import '../controllers/OMController.dart';
import '../controllers/PMController.dart';
import '../controllers/Shop.dart';
import '../tab_bar.dart';



class SettingsFileBased extends StatefulWidget {
  final TabBars parent;
  const SettingsFileBased({Key? key, required this.parent}) : super(key: key);

  @override
  _SettingsFileBasedState createState() => _SettingsFileBasedState();
}

class _SettingsFileBasedState extends State<SettingsFileBased> {
  final TextEditingController colorController = TextEditingController();
  Label? selectedOperation;

  @override
  void dispose() {
    colorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuItem<Label>> fileEntries =
    Label.values.map((label) {
      return DropdownMenuItem<Label>(
        value: label,
        child: Text(label.label),
      );
    }).toList();

    return  Scaffold(
      appBar: AppBar(
        title: Text('Settings File Based'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DropdownButton<Label>(
                    value: selectedOperation,
                    onChanged: (Label? label) {
                      setState(() {
                        selectedOperation = label;
                        performOperation(label);
                      });
                    },
                    items: fileEntries,
                    hint: const Text('- Choose Settings -'),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ),
            if (selectedOperation != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('You have successed doing operation \'${selectedOperation!.label.toUpperCase()}\''),
                ],
              )
            else
              const Text('Please select an operation.'),
          ],
        ),
      ),
    );
  }

  void performOperation(Label? label) {
    switch (label) {
      case Label.empty:
        setState(() {
          widget.parent.shop = Shop('GFT Store');
          widget.parent.pmController = PMController(widget.parent.shop!.pm);
          widget.parent.omController = OMController(widget.parent.shop!.om);
          widget.parent.cmController = CMController(widget.parent.shop!.cm);
        });
        break;
      case Label.save:

        break;
      case Label.backup:
      // Lakukan operasi untuk opsi "backup"
        break;
      case Label.restore:
      // Lakukan operasi untuk opsi "restore"
        break;
      default:
      // Jika tidak ada opsi yang dipilih, tidak ada operasi yang dilakukan.
        break;
    }
  }

}

enum Label {
  empty,
  save,
  backup,
  restore,
}

extension LabelExtension on Label {
  String get label {
    switch (this) {
      case Label.empty:
        return 'Empty File Based';
      case Label.save:
        return 'Save File Based';
      case Label.backup:
        return 'Backup File Based';
      case Label.restore:
        return 'Restore File Based';
    }
  }
}