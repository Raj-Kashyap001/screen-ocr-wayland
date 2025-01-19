#!/bin/bash
set -e  # Exit immediately if a command exits with a non-zero status

# Temporary files and folder
screenshot_dir="/tmp"
text_output_file="${screenshot_dir}/output.txt"

# Function to send notifications
notify() {
    local message="$1"
    local title="$2"

    case "$XDG_CURRENT_DESKTOP" in
        "GNOME")
            # GNOME uses gdbus for notifications
            gdbus call --session --dest org.gnome.Shell \
                --object-path /org/gnome/Shell/Extensions/Notification \
                --method org.gnome.Shell.Extensions.Notification.ShowNotification \
                "$title" "$message" "" "" "" ""
            ;;
        "KDE")
            # KDE uses `notify-send`
            notify-send "$title" "$message"
            ;;
        *)
            # Default to `dunst` for other environments
            dunstify -u normal -t 3000 "$title" "$message"
            ;;
    esac
}

# Open grim to capture a screenshot (use slurp to select the region)
screenshot_file="${screenshot_dir}/screenshot.png"
grim -g "$(slurp)" "$screenshot_file"

# Check if the screenshot file exists
if [ ! -f "$screenshot_file" ]; then
    # Exit silently if no file is found
    exit 0
fi

# Run OCR on the screenshot
tesseract "$screenshot_file" "${text_output_file%.txt}" -l eng

# Check if Tesseract produced any output
if [ ! -s "$text_output_file" ]; then
    notify "Error: OCR failed or produced no output." "OCR Error"
    rm "$screenshot_file"  # Clean up screenshot file
    exit 1
fi

# Copy the OCR output to the clipboard (use wl-clipboard for Wayland)
wl-copy < "$text_output_file"

# Clean up temporary files
rm "$screenshot_file" "$text_output_file"

# Notify the user of success
notify "Text from screenshot has been successfully copied to clipboard." "OCR Success"

