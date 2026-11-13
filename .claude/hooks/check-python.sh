FILE=$(jq -r '.tool_input.file_path // ""')
[[ "$FILE" == *.py ]] || exit 0
ruff check "$FILE" >&2
if ! python3 -m doctest "$FILE" >&2; then
  echo "Doctests failed in $FILE - fix before continuing." >&2
  exit 2
fi
exit 0