import 'package:flutter/material.dart';
import 'package:lets_discuss/logic/ThemeColor.dart';

class SettingsView extends StatefulWidget {
  final void Function(String colorName) themeColorCallback;
  final void Function(int val) themeModeCallback;
  final MaterialColor defaultThemeColor;
  final ThemeMode defaultThemeMode;

  const SettingsView({Key? key, required this.themeColorCallback,required this.themeModeCallback, required this.defaultThemeColor, required this.defaultThemeMode})
      : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  int themeMode = 0;

  int getDefaultThemeModeIndex() {
    if (widget.defaultThemeMode == ThemeMode.system) {
      return 0;
    } else if (widget.defaultThemeMode == ThemeMode.light) {
      return 1;
    } else if (widget.defaultThemeMode == ThemeMode.dark) {
      return 2;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    themeMode = getDefaultThemeModeIndex();
    Map<String, MaterialColor> accentThemes = ThemeColor.accentThemes;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
              const Padding(
                  padding: EdgeInsets.only(
                      top: 20.0
                  )),
              const Text('Light/Dark mode',
                style: TextStyle(
                  fontSize: 20.0
                ),
              ),
              const Divider(),
          const Padding(
              padding: EdgeInsets.only(
                  top: 20.0
              )),
          Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Text('System Default'),
                      Radio(
                        groupValue: themeMode,
                        value: 0,
                        onChanged: (val) {
                          themeMode = 0;
                          widget.themeModeCallback(0);
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text('Light'),
                      Radio(
                        groupValue: themeMode,
                        value: 1,
                        onChanged: (val) {
                          themeMode = 1;
                          widget.themeModeCallback(1);
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text('Dark'),
                      Radio(
                        groupValue: themeMode,
                        value: 2,
                        onChanged: (val) {
                          themeMode = 2;
                          widget.themeModeCallback(2);
                        },
                      ),
                    ],
                  )
                ],
              ),
              const Divider(),
          const Text('Theme Colors',
            style: TextStyle(
                fontSize: 20.0
            ),
          ),
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: accentThemes.length,
            itemBuilder: (BuildContext context, int index) {
              MaterialColor item = accentThemes.values.elementAt(index);
              String itemKey = accentThemes.keys.elementAt(index);
              return ListTile(
                title: Text(itemKey),
                selected: widget.defaultThemeColor.value == item.value,
                leading: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: item,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(50.0)
                    )
                  )
                ),
                onTap: () => {
                  widget.themeColorCallback(itemKey)
                },
              );
            },

          )
        ],
          ),
    );
  }
}
