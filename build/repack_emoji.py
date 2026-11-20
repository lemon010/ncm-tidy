from pathlib import Path
import struct
import sys
import zipfile

root = Path(__file__).resolve().parent.parent
original_path = root / '安装包/网易云9.5.81内置模块.apk'
base_path = root / '安装包/输出/work/pkg_v2.apk'
module_path = Path(sys.argv[1])
output_path = Path(sys.argv[2])
module_name = 'assets/lspatch/modules/com.ncm.tidy.apk'

with zipfile.ZipFile(original_path) as original, zipfile.ZipFile(base_path) as base:
    base_names = base.namelist()
    entries = [(name, base.read(name), base.getinfo(name).compress_type)
               for name in base_names if name != module_name]
entries.append((module_name, module_path.read_bytes(), zipfile.ZIP_DEFLATED))
entries.sort(key=lambda item: item[0])

with zipfile.ZipFile(output_path, 'w', allowZip64=True) as result:
    for name, data, compression in entries:
        info = zipfile.ZipInfo(name, date_time=(2020, 1, 1, 0, 0, 0))
        info.compress_type = compression
        info.flag_bits |= 0x800
        info.external_attr = 0o100644 << 16
        alignment = 4 if name == 'resources.arsc' else (
            4096 if name == 'assets/lspatch/origin.apk' or
            (name.startswith('assets/lspatch/so/') and name.endswith('.so')) else 1)
        if alignment > 1:
            # Valid private extra field keeps each critical entry aligned.
            base_offset = result.fp.tell() + 30 + len(name.encode('utf-8'))
            pad = (-base_offset) % alignment
            if pad < 4:
                pad += alignment
            info.extra = struct.pack('<HH', 0xd935, pad - 4) + bytes(pad - 4)
        result.writestr(info, data, compress_type=compression, compresslevel=6)

with zipfile.ZipFile(output_path) as result:
    assert result.testzip() is None
    for name, alignment in [('resources.arsc', 4), ('assets/lspatch/origin.apk', 4096)]:
        info = result.getinfo(name)
        result.fp.seek(info.header_offset + 26)
        name_len, extra_len = struct.unpack('<HH', result.fp.read(4))
        offset = info.header_offset + 30 + name_len + extra_len
        assert offset % alignment == 0, (name, offset, alignment)
    so = [n for n in result.namelist()
          if n.startswith('assets/lspatch/so/') and n.endswith('.so')]
    for name in so:
        info = result.getinfo(name)
        result.fp.seek(info.header_offset + 26)
        name_len, extra_len = struct.unpack('<HH', result.fp.read(4))
        offset = info.header_offset + 30 + name_len + extra_len
        assert offset % 4096 == 0, (name, offset)
print('entries', len(entries), 'output', output_path)
