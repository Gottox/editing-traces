#!/bin/sh -e

BASE=$(dirname "$0" | xargs realpath)

for d in sequential concurrent; do
	cd "$BASE/${d}_traces"

	cat > meson.build << EOF
sections_gz += { '$d': files(
$(find . -name '*.json.gz' | sed "s/^.\//  '/; s/$/',/")
)}
EOF
done
