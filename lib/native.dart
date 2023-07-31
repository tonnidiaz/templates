import 'dart:ffi';
import 'dart:io' as io;

import 'package:frust/utils/bridge_generated.dart';

const _base = 'rust';

// On MacOS, the dynamic library is not bundled with the binary,
// but rather directly **linked** against the binary.
final path = io.Platform.isWindows ? '$_base.dll' : 'lib$_base.so';

final dylib = (io.Platform.isIOS
    ? DynamicLibrary.process()
    : io.Platform.isMacOS
    ? DynamicLibrary.executable()
    : DynamicLibrary.open(path));

final api = RustImpl(dylib);