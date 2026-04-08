import os

# Updated product data for the script matching the JS file
products = [
  {"id": "bridal-multi-set", "name": "Heritage Bridal Multi-Set"},
  {"id": "bridal-statement-set", "name": "Royal Bridal Statement Set"},
  {"id": "bridal-gold-set", "name": "Maharani Gold Choker Set"},
  {"id": "celestial-choker", "name": "Celestial Starry Choker"},
  {"id": "collection-jewellery", "name": "Aura Signature Collection Set"},
  {"id": "diamond-set-necklace", "name": "Eternal Diamond Illusion Set"},
  {"id": "ethnic-set", "name": "Temple Heritage Ethnic Set"},
  {"id": "festive-necklace", "name": "Diwali Sparkle Festive Necklace"},
  {"id": "multicolor-set", "name": "Navaratna Inspired Multicolor Set"},
  {"id": "rose-gold-set", "name": "Modern Rose Gold Minimalist Set"},
  {"id": "diamond-earrings", "name": "Princess Cut Diamond Studs"},
  {"id": "heavy-jhumka", "name": "Royal Heritage Heavy Jhumkas"},
  {"id": "light-earrings", "name": "Daily Glow Lightweight Drops"},
  {"id": "long-earrings", "name": "Cascade Long Dangler Earrings"},
  {"id": "mini-aring", "name": "Classic Mini Hoop Arings"},
  {"id": "mini-round-earrings", "name": "Petite Round Crystal Studs"},
  {"id": "shaded-earrings", "name": "Enchanted Ombre Shaded Jhumkas"},
  {"id": "floral-bangle-set", "name": "Spring Bloom Floral Bangle Set"},
  {"id": "gold-bangles", "name": "Royal 24K Gold Bangle Set"},
  {"id": "diamond-ring", "name": "Forever One Solitaire Ring"},
  {"id": "gold-nose-ring", "name": "Traditional Gold Nath"}
]

template_path = "products/product.html"
output_dir = "products"

with open(template_path, "r", encoding="utf-8") as f:
    template_content = f.read()

for p in products:
    filename = f"{p['id']}.html"
    file_path = os.path.join(output_dir, filename)
    
    # Inject the specific ID into the script of the generated page or use the same template
    # Since the template already reads from URL params, we can either:
    # 1. Keep them the same (but they are separate files)
    # 2. Hardcode the ID in each file for better SEO/No-JS support.
    
    # Let's hardcode the ID in the script call
    modified_content = template_content.replace(
        "const id = params.get('id');", 
        f"const id = '{p['id']}';"
    ).replace(
        '<a href="../index.html/index.html" class="nl">',
        '<a href="../index.html/index.html" class="nl">'
    )
    
    with open(file_path, "w", encoding="utf-8") as f:
        f.write(modified_content)
    print(f"Generated: {file_path}")

print("Successfully generated all product pages.")
