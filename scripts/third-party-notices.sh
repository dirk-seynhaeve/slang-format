#!/usr/bin/env bash
# Writes THIRD-PARTY-NOTICES.txt for a release build of slang-format.
# Usage: scripts/third-party-notices.sh <build-dir> <out-file>
set -euo pipefail
build="$1"; out="$2"
section() { printf '\n==============================================================================\n%s\n%s\n==============================================================================\n\n' "$1" "$2" >> "$out"; }
: > "$out"
printf 'slang-format includes the following third-party software.\n' >> "$out"
section "slang" "https://github.com/MikePopoloski/slang (MIT)"; cat external/slang/LICENSE >> "$out"
section "Boost (regex, unordered, concurrent headers bundled with slang)" "https://www.boost.org (BSL-1.0)"; cat external/slang/LICENSES/BSL-1.0.txt >> "$out"
section "expected-lite (bundled with slang)" "https://github.com/martinmoene/expected-lite (BSL-1.0, text above)"
section "reflect-cpp" "https://github.com/getml/reflect-cpp (MIT)"; cat external/reflect-cpp/LICENSE >> "$out"
section "yyjson (bundled with reflect-cpp)" "https://github.com/ibireme/yyjson (MIT)"
sed -n '1,/\*\//p' external/reflect-cpp/include/rfl/thirdparty/yyjson.h >> "$out"
section "compile-time regular expressions (bundled with reflect-cpp)" "https://github.com/hanickadot/compile-time-regular-expressions (Apache-2.0 WITH LLVM-exception)"
sed -n '1,/^\*\//p' external/reflect-cpp/include/rfl/thirdparty/ctre.hpp >> "$out"
section "enchantum (bundled with reflect-cpp)" "https://github.com/ZXShady/enchantum (MIT)"
section "BS::thread_pool" "https://github.com/bshoshany/thread-pool (MIT)"
grep -m1 '@copyright' external/BS_thread_pool.hpp | sed 's/^ \* //' >> "$out"
for dep in fmt mimalloc tomlplusplus boost_regex; do
  lic=$(ls "$build"/_deps/${dep}-src/LICENSE* 2>/dev/null | head -1 || true)
  if [[ -n "$lic" ]]; then section "$dep" "(fetched at build time)"; cat "$lic" >> "$out"; fi
done
