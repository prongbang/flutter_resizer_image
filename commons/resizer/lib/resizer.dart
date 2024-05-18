library resizer;

import 'package:resizer/src/rust/frb_generated.dart';

export 'src/rust/api/resizer.dart';
export 'src/rust/frb_generated.dart';

Future<void> init() => RustLib.init();
