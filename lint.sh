#!/bin/bash

# Skrypt do uruchamiania narzędzi do kontroli jakości kodu (ruff, mypy).
#
# Użycie:
#   ./lint.sh                   # Sprawdza cały projekt.
#   ./lint.sh ścieżka/do/pliku  # Sprawdza konkretny plik lub folder.
#
# set -e: Natychmiast przerywa działanie skryptu, jeśli któreś z poleceń zakończy się błędem.
# Jest to kluczowe dla procesów CI/CD.
set -e

# --- Konfiguracja ---
# Domyślna ścieżka, jeśli nie podano argumentu. Znak "." oznacza bieżący katalog (cały projekt).
DEFAULT_PATH="."
# Użyj pierwszego argumentu ($1) jako ścieżki, a jeśli go nie ma, użyj wartości domyślnej.
TARGET_PATH="${1:-$DEFAULT_PATH}"

# --- Uruchamianie narzędzi ---
echo "▶️  Uruchamianie ruff format na: $TARGET_PATH"
ruff format "$TARGET_PATH"

echo "▶️  Uruchamianie ruff check na: $TARGET_PATH"
ruff check "$TARGET_PATH"

echo "▶️  Uruchamianie mypy na: $TARGET_PATH"
mypy "$TARGET_PATH"

# Jeśli wszystkie polecenia powyżej zakończą się sukcesem (dzięki `set -e`),
# skrypt dotrze do tego miejsca.
echo ""
echo "✅ Wszystkie testy jakości przeszły pomyślnie!"