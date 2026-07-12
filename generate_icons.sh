#!/usr/bin/env bash
# Script to generate Android launcher icons using ImageMagick
# It reads public/drcat_logo.png and outputs proper legacy and adaptive icon resource layers.

set -e

LOGO="public/drcat_logo.png"

if [ ! -f "$LOGO" ]; then
  echo "Error: Logo file not found at $LOGO"
  exit 1
fi

# Legay launcher sizes: Size (px), Folder suffix
legacy_sizes=(
  "48 mdpi"
  "72 hdpi"
  "96 xhdpi"
  "144 xxhdpi"
  "192 xxxhdpi"
)

# Adaptive foreground sizes: Canvas (px), LogoScale (px, 66% safe zone), Folder suffix
adaptive_sizes=(
  "108 72 mdpi"
  "162 108 hdpi"
  "216 144 xhdpi"
  "324 216 xxhdpi"
  "432 288 xxxhdpi"
)

echo "🎨 Generating Legacy Launcher Icons (Square & Round)..."
for entry in "${legacy_sizes[@]}"; do
  read -r size suffix <<< "$entry"
  DIR="android/app/src/main/res/mipmap-${suffix}"
  mkdir -p "$DIR"
  
  # Generate standard legacy icon (Square)
  magick convert "$LOGO" -resize "${size}x${size}" "${DIR}/ic_launcher.png"
  # Generate round legacy icon (Cropped into a perfect circle with transparent corners)
  magick convert "$LOGO" -resize 512x512 -alpha on -background none \( +clone -channel A -evaluate set 0 +channel -fill white -draw "circle 256,256 256,0" \) -compose DstIn -composite -compose Over -resize "${size}x${size}" "${DIR}/ic_launcher_round.png"
  echo "  ✓ mipmap-${suffix}: ${size}x${size}"
done

echo "📱 Generating Adaptive Foreground Icons (Padded & Rounded for Safe Zone)..."
for entry in "${adaptive_sizes[@]}"; do
  read -r canvas scale suffix <<< "$entry"
  DIR="android/app/src/main/res/mipmap-${suffix}"
  mkdir -p "$DIR"
  
  # Generate adaptive icon foreground (Padded to 66% safe zone, letting system shape mask handle the boundary)
  # We key out the white background with 5% fuzz to ensure the foreground is transparent around the logo.
  magick convert "$LOGO" -fuzz 5% -transparent "white" -resize "${scale}x${scale}" -background none -gravity center -extent "${canvas}x${canvas}" "${DIR}/ic_launcher_foreground.png"
  echo "  ✓ mipmap-${suffix} (foreground): ${canvas}x${canvas} (scaled to ${scale}x${scale})"
done

echo "🎉 Launcher icons generated successfully!"
