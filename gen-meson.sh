#!/bin/sh -e

BASE=$(dirname "$0" | xargs realpath)

for d in sequential_traces concurrent_traces; do
	cd "$BASE/$d"

	cat > meson.build << EOF
${d}_gz = files(
$(find . -name '*.json.gz' | sed "s/^/  '/; s/$/',/")
)
EOF
done
