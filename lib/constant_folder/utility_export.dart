// declare a name for this library to reference from parts
// this is not necessary if we do not need to reference elsewhere
// NOTE: generally, a Dart file is a Library

library appstyle;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';

export 'utility_export.dart';

// export adds contents of another Library to this Library's namespace
// here we are adding all content (accessible from outside the library) from
// the material library
// NOTE: this is intended for related libraries
// this arbitrary usage is simply for demonstration purposes
export 'package:flutter/material.dart';

// for finer control, we can use the 'show' directive
// try this to see the effects of selected export
// export 'package:flutter/material.dart' show StatefulWidget, State;

part 'colors.dart';

part 'style.dart';


//constant_folder\utility_export.dart  F:\Flutter/AzanApp/azan/constant_folder/utility_export.dart
