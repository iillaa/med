import os
from PIL import Image, ImageDraw, ImageFont, ImageFilter

def create_og_banner():
    width = 1200
    height = 630
    
    # 1. Base dark background
    img = Image.new('RGBA', (width, height), (9, 13, 22, 255))
    draw = ImageDraw.Draw(img)
    
    # 2. Cyan Ambient Glow on top-left / center
    glow = Image.new('RGBA', (width, height), (0, 0, 0, 0))
    glow_draw = ImageDraw.Draw(glow)
    glow_draw.ellipse([80, -100, 700, 450], fill=(6, 182, 212, 45))
    glow_draw.ellipse([750, 200, 1300, 700], fill=(16, 185, 129, 30))
    glow = glow.filter(ImageFilter.GaussianBlur(120))
    img.paste(glow, (0, 0), glow)
    
    # Re-obtain draw after paste
    draw = ImageDraw.Draw(img)
    
    # 3. Outer border / card glow
    draw.rounded_rectangle([20, 20, width - 20, height - 20], radius=24, outline=(51, 65, 85, 180), width=2)
    
    # 4. Load Logo if exists
    logo_path = 'public/drcat_logo.png'
    if os.path.exists(logo_path):
        try:
            logo = Image.open(logo_path).convert('RGBA')
            logo_size = 130
            logo = logo.resize((logo_size, logo_size), Image.Resampling.LANCZOS)
            
            # Rounded mask for logo
            mask = Image.new('L', (logo_size, logo_size), 0)
            mask_draw = ImageDraw.Draw(mask)
            mask_draw.rounded_rectangle([0, 0, logo_size, logo_size], radius=28, fill=255)
            
            # Logo shadow/glow
            logo_x, logo_y = 90, 80
            draw.rounded_rectangle([logo_x - 4, logo_y - 4, logo_x + logo_size + 4, logo_y + logo_size + 4], 
                                   radius=32, fill=(6, 182, 212, 60), outline=(6, 182, 212, 180), width=2)
            
            img.paste(logo, (logo_x, logo_y), mask)
        except Exception as e:
            print("Logo load note:", e)

    # 5. Fonts fallback handling
    font_bold_large = None
    font_bold_mid = None
    font_regular = None
    font_badge = None
    
    font_paths = [
        "/data/data/com.termux/files/usr/share/fonts/TTF/DejaVuSans-Bold.ttf",
        "/data/data/com.termux/files/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf",
        "/system/fonts/Roboto-Bold.ttf",
        "/system/fonts/DroidSans-Bold.ttf"
    ]
    font_regular_paths = [
        "/data/data/com.termux/files/usr/share/fonts/TTF/DejaVuSans.ttf",
        "/data/data/com.termux/files/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf",
        "/system/fonts/Roboto-Regular.ttf",
        "/system/fonts/DroidSans.ttf"
    ]
    
    for p in font_paths:
        if os.path.exists(p):
            font_bold_large = ImageFont.truetype(p, 54)
            font_bold_mid = ImageFont.truetype(p, 28)
            font_badge = ImageFont.truetype(p, 18)
            break
            
    for p in font_regular_paths:
        if os.path.exists(p):
            font_regular = ImageFont.truetype(p, 22)
            break
            
    if not font_bold_large:
        font_bold_large = ImageFont.load_default()
        font_bold_mid = font_bold_large
        font_regular = font_bold_large
        font_badge = font_bold_large

    # 6. Typography
    text_x = 250
    draw.text((text_x, 90), "Dr.CAT", fill=(248, 250, 252), font=font_bold_large)
    
    # Badge: GUIDE MÉDICAL
    draw.rounded_rectangle([text_x + 220, 102, text_x + 390, 138], radius=8, fill=(6, 182, 212, 40), outline=(6, 182, 212, 200), width=1)
    draw.text((text_x + 234, 110), "GUIDE CLINIQUE", fill=(6, 182, 212), font=font_badge)
    
    # Subtitle
    draw.text((text_x, 160), "Rappel Clinique & Conduites à Tenir", fill=(6, 182, 212), font=font_bold_mid)
    
    # Description
    desc_y = 250
    draw.text((90, desc_y), "Fiches réflexes d'urgence, protocoles thérapeutiques validés,", fill=(226, 232, 240), font=font_bold_mid)
    draw.text((90, desc_y + 42), "ordonnances types par DCI et calculateurs pour praticiens.", fill=(148, 163, 184), font=font_regular)
    
    # 7. Feature Badges (Pills)
    badges = [
        ("🩺 78+ Fiches d'Urgence", (6, 182, 212)),
        ("💊 Ordonnances & DCI", (16, 185, 129)),
        ("⚡ 100% Hors-Ligne", (245, 158, 11)),
        ("📱 PWA & Android APK", (168, 85, 247))
    ]
    
    pill_x = 90
    pill_y = 380
    for label, col in badges:
        pill_width = 236
        pill_height = 54
        draw.rounded_rectangle([pill_x, pill_y, pill_x + pill_width, pill_y + pill_height], 
                               radius=14, fill=(15, 23, 42, 220), outline=(col[0], col[1], col[2], 180), width=2)
        draw.text((pill_x + 16, pill_y + 16), label, fill=(248, 250, 252), font=font_badge)
        pill_x += pill_width + 18
        
    # 8. Footer Info
    draw.line([90, 495, width - 90, 495], fill=(51, 65, 85, 120), width=1)
    draw.text((90, 525), "Dr. Kibeche Ali Dia Eddine  •  Médecine Générale & Urgences", fill=(148, 163, 184), font=font_badge)
    draw.text((width - 340, 525), "🌐 drcat.qd.je  •  PWA & APK", fill=(6, 182, 212), font=font_badge)

    # Save to public/og-banner.png
    os.makedirs('public', exist_ok=True)
    img_rgb = img.convert('RGB')
    img_rgb.save('public/og-banner.png', 'PNG', quality=95, optimize=True)
    print("✅ Created public/og-banner.png (1200x630)")

if __name__ == '__main__':
    create_og_banner()
