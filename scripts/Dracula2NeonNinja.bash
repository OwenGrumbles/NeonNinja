#!/usr/bin/env bash
# Dracula2NeonNinja.bash
# Usage: ./Dracula2NeonNinja.bash <input_dracula_file> <output_neonninja_file>

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <input_dracula_file> <output_neonninja_file>"
    exit 1
fi

INPUT="$1"
OUTPUT="$2"

# Dracula HEX codes (standard 16-color palette)
declare -A DRACULA_HEX=(
    ["#200926"]="BACKGROUND"
    ["#6272A4"]="CURRENT_LINE"
    ["#44475A"]="SELECTION"
    ["#F8F8F2"]="FOREGROUND"
    ["#6272A4"]="COMMENT"
    ["#FF5555"]="RED"
    ["#FFB86C"]="ORANGE"
    ["#F1FA8C"]="YELLOW"
    ["#50FA7B"]="GREEN"
    ["#8BE9FD"]="CYAN"
    ["#BD93F9"]="PURPLE"
    ["#FF79C6"]="PINK"
)

# NeonNinja HEX mapping (drop-in replacement)
declare -A NEONNINJA_HEX=(
    ["#282A36"]="#370000"   # Background → Shadow Cloak
    ["#6272A4"]="#120926"   # Current Line / Comment → Silent Step / Hidden Scroll
    ["#44475A"]="#120926"   # Selection → Shuriken Strike
    ["#F8F8F2"]="#F3FFFC"   # Foreground → Moonlight
    ["#FF5555"]="#F70000"   # Red → Fire Katana
    ["#FFB86C"]="#F7E300"   # Orange → Golden Shuriken
    ["#F1FA8C"]="#FFFF0D"   # Yellow → Neon Smoke
    ["#50FA7B"]="#37CC00"   # Green → Green Leaf
    ["#8BE9FD"]="#00FFFF"   # Cyan → Blue Shadow / Cyan
    ["#BD93F9"]="#FF1073"   # Purple → Cerise Fang
    ["#FF79C6"]="#FF00FF"   # Pink → Pink Smoke
)

# Read input file line by line and replace HEX codes
cp "$INPUT" "$OUTPUT"

for DRACULA in "${!NEONNINJA_HEX[@]}"; do
    NEON="${NEONNINJA_HEX[$DRACULA]}"
    # Use sed to replace HEX codes, ignoring case
    sed -i "s/$DRACULA/$NEON/Ig" "$OUTPUT"
done

echo "Conversion complete: $OUTPUT"
