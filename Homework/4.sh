#!/bin/bash

TODO_FILE="todo.txt"

touch "$TODO_FILE"

usage() {
    echo "Usage: $0 {add|remove|list|sort|prepend|append|dedup} [item]"
    exit 1
}

list_todos() {
    echo "TODO List:"
    cat -n "$TODO_FILE"
}


add_todo() {
    echo "$1" >> "$TODO_FILE"
    echo "Added: $1"
}

remove_todo() {
    sed -i "${1}d" "$TODO_FILE"
    echo "Removed item #$1"
}

# Function to sort TODO items alphabetically
sort_todos() {
    sort -o "$TODO_FILE" "$TODO_FILE"
    echo "Sorted TODO list!"
}


prepend_todo() {
    echo "$1" | cat - "$TODO_FILE" > temp && mv temp "$TODO_FILE"
    echo "Prepended: $1"
}

# Function to append a TODO item
append_todo() {
    echo "$1" >> "$TODO_FILE"
    echo "Appended: $1"
}

dedup_todos() {
    awk '!seen[$0]++' "$TODO_FILE" > temp && mv temp "$TODO_FILE"
    echo "Removed duplicate items!"
}

if [[ $# -lt 1 ]]; then
    usage
fi

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
