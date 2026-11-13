INPUT=$(cat)
CMD=$(echo "$INPUT" | jq -r '.tool_input.command // ""')
FILE=$(echo "$INPUT" | jq -r '.tool_input.file_path // ""')
if echo "$CMD" | grep -qi "TheAlgorithms/Python"; then
  echo "Blocked: never push or open PRs against upstream TheAlgorithms/Python." >&2
  exit 2
fi
if [[ "$FILE" == */README.md || "$FILE" == */DIRECTORY.md ]]; then
  echo "Blocked: CONTRIBUTING.md says not to edit README.md or DIRECTORY.md." >&2
  exit 2
fi
exit 0