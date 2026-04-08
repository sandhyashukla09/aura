const fs = require('fs');
const path = require('path');

const products = [
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
];

const templatePath = path.join(__dirname, 'products', 'product.html');
const outputDir = path.join(__dirname, 'products');

if (!fs.existsSync(outputDir)) {
    fs.mkdirSync(outputDir);
}

const templateContent = fs.readFileSync(templatePath, 'utf8');

products.forEach(p => {
    const filename = `${p.id}.html`;
    const filePath = path.join(outputDir, filename);
    
    // Replace logic to hardcode ID
    let content = templateContent.replace(
        "const id = params.get('id');", 
        `const id = '${p.id}';`
    );
    
    // Relative path correction if needed (since it's in the same /products folder)
    // Actually, product.html and bridal-multi-set.html are in the same folder,
    // so ../ remains the same.
    
    fs.writeFileSync(filePath, content);
    console.log(`Generated: ${filename}`);
});

console.log('Successfully generated all product pages.');
