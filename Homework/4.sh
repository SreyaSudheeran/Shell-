#!/bin/bash

TODO_FILE="todo.txt"

# Ensure the TODO file exists
touch "$TODO_FILE"

# Function to display usage instructions
usage() {
    echo "Usage: $0 {add|remove|list|sort|prepend|append|dedup} [item]"
    exit 1
}

# Function to list TODO items
list_todos() {
    echo "📌 TODO List:"
    cat -n "$TODO_FILE"
}

# Function to add a new TODO item
add_todo() {
    echo "$1" >> "$TODO_FILE"
    echo "✅ Added: $1"
}

# Function to remove a TODO item by line number
remove_todo() {
    sed -i "${1}d" "$TODO_FILE"
    echo "❌ Removed item #$1"
}

# Function to sort TODO items alphabetically
sort_todos() {
    sort -o "$TODO_FILE" "$TODO_FILE"
    echo "🔤 Sorted TODO list!"
}

# Function to prepend a TODO item
prepend_todo() {
    echo "$1" | cat - "$TODO_FILE" > temp && mv temp "$TODO_FILE"
    echo "⬆️ Prepended: $1"
}

# Function to append a TODO item
append_todo() {
    echo "$1" >> "$TODO_FILE"
    echo "➡️ Appended: $1"
}

# Function to remove duplicate items
dedup_todos() {
    awk '!seen[$0]++' "$TODO_FILE" > temp && mv temp "$TODO_FILE"
    echo "♻️ Removed duplicate items!"
}

# Check for correct usage
if [[ $# -lt 1 ]]; then
    usage
fi

# Handle user commands
case "$1" in
    add) shift && add_todo "$@" ;;
    remove) shift && remove_todo "$1" ;;
    list) list_todos ;;
    sort) sort_todos ;;
    prepend) shift && prepend_todo "$@" ;;
    append) shift && append_todo "$@" ;;
    dedup) dedup_todos ;;
    *) usage ;;
esac
