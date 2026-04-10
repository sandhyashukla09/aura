import os

index_path = r'c:\Users\LENOVO\Desktop\aura\index.html\index.html'
shop_path = r'c:\Users\LENOVO\Desktop\aura\shop.html'

with open(index_path, 'r', encoding='utf-8') as f:
    content = f.read()

# Extract the header part (up to the end of <nav>)
start_nav = content.find('<nav id="nav">')
end_nav = content.find('</nav>', start_nav) + 6

header_part = content[:end_nav]

# Ensure we remove the hero and everything else down to <footer>
start_footer = content.find('<footer>')
footer_part = content[start_footer:]

products = [
    {
        "img": "images/necklaces/necklace-1.jpg",
        "tag": "BRIDAL NECKLACE",
        "title": "Celestial Pearl Choker",
        "price": "₹1,299",
        "old_price": "₹1,999",
        "desc": "Exquisite kundan work with cascading ethereal pearls. Perfectly crafted to enhance your traditional look with a modern touch. Hypoallergenic and lightweight for all-day comfort.",
        "reviews": [
            {"author": "Riya Patel", "text": "Absolutely stunning piece! Looks exactly like the picture. Highly recommend for weddings."},
            {"author": "Ankit Sharma", "text": "Bought this for my wife and she loved it. The quality is premium and packaging is great."}
        ]
    },
    {
        "img": "images/necklaces/necklace-2.jpg",
        "tag": "PREMIUM Gold",
        "title": "Royal Gold Bridal Set",
        "price": "₹2,499",
        "old_price": "₹3,499",
        "desc": "Traditional temple jewellery with intricate craftsmanship. Bring out the goddess in you with this heavily embellished gold-finish statement piece.",
        "reviews": [
            {"author": "Simran K.", "text": "Wore it on my engagement. Everyone kept asking if it was real gold!"},
            {"author": "Meera Joshi", "text": "Heavy look but very light on the neck. Stunning finish."}
        ]
    },
    {
        "img": "images/necklaces/necklace-3.jpg",
        "tag": "MODERN SELECTION",
        "title": "Modern Rose Gold Elegance",
        "price": "₹899",
        "old_price": "₹1,299",
        "desc": "Sleek and contemporary design for the modern woman. A beautiful rose-gold plated necklace that elegantly transitions from day to night.",
        "reviews": [
            {"author": "Neha S.", "text": "Perfect for office wear and small parties. Very chic!"},
            {"author": "Aarti V.", "text": "I love the rose gold color. Doesn't fade at all."}
        ]
    },
    {
        "img": "images/necklaces/necklace-4.jpg",
        "tag": "LUXURY",
        "title": "Diamond Lustre Necklace",
        "price": "₹1,799",
        "old_price": "₹2,500",
        "desc": "Brilliant cubic zirconia set in a classic silhouette. The flawless precision cut of the stones gives an unbelievable shine comparable to real diamonds.",
        "reviews": [
            {"author": "Preeti M.", "text": "The stones literally sparkle in the dark! Beyond gorgeous."},
            {"author": "Divya R.", "text": "Looks super expensive. A must-buy for receptions."}
        ]
    },
    {
        "img": "images/earings/heavi,jhumka.jpg",
        "tag": "TRADITIONAL EARRINGS",
        "title": "Heavy Jhumka Drops",
        "price": "₹499",
        "old_price": "₹799",
        "desc": "Classic heavy jhumka design with intricate detailing. Perfect to pair with your festive wear. Made from high-quality alloy with long-lasting gold polish.",
        "reviews": [
            {"author": "Kavya T.", "text": "Beautiful jhumkas. Fast delivery too!"},
            {"author": "Pooja B.", "text": "A standard traditional piece. Love wearing it."}
        ]
    },
    {
        "img": "images/bangals/gold,bangals.png",
        "tag": "DAILY WEAR",
        "title": "Royal Gold Bangles Set",
        "price": "₹699",
        "old_price": "₹999",
        "desc": "A set of four premium gold-plated bangles. The timeless design makes them perfect for everyday elegance as well as festive occasions.",
        "reviews": [
            {"author": "Sneha", "text": "Fits perfectly. Has a nice weight to it like real gold."},
            {"author": "Aditi G.", "text": "I've been wearing it daily. The polish is completely intact."}
        ]
    },
    {
        "img": "images/ring/dimond,ring.png",
        "tag": "SIGNATURE RINGS",
        "title": "Eternal Diamond Ring",
        "price": "₹399",
        "old_price": "₹599",
        "desc": "Adjustable solitaire ring featuring a high-clarity cubic zirconia stone. Minimalist and beautiful, an ideal gift to express eternal love.",
        "reviews": [
            {"author": "Priyanka", "text": "Very delicate and beautiful. adjustable so it fits perfectly."},
            {"author": "Varun S.", "text": "Gifted this to my girlfriend. It's a gorgeous ring."}
        ]
    },
    {
        "img": "images/earings/long_earings.jpg",
        "tag": "STATEMENT EARRINGS",
        "title": "Cascade Long Earrings",
        "price": "₹549",
        "old_price": "₹899",
        "desc": "Elegant long cascading earrings in rose gold finish. Very flattering and provides a modern silhouette that elevates any outfit.",
        "reviews": [
            {"author": "Ritika", "text": "So elegant! Great for western outfits too."},
            {"author": "Mansi", "text": "Received it today. Looks better in person!"}
        ]
    },
    {
        "img": "images/earings/dimonds_earings.png",
        "tag": "ELEGANT",
        "title": "Crystal Drop Diamond Earrings",
        "price": "₹799",
        "old_price": "₹1,199",
        "desc": "Dazzle the crowd with these exquisite crystal drop earrings. Masterfully cut for maximum brilliance and set in tarnish-resistant silver plating.",
        "reviews": [
            {"author": "Aisha P.", "text": "Incredible shine. They catch the light beautifully."},
            {"author": "Nandini R.", "text": "Wore these to a gala. Received endless compliments."}
        ]
    },
    {
        "img": "images/earings/light,earing.png",
        "tag": "EVERYDAY WEAR",
        "title": "Lightweight Floral Earrings",
        "price": "₹299",
        "old_price": "₹499",
        "desc": "Delicate and exceptionally lightweight. These floral ear studs are perfect for women who love minimalistic jewelry for daily office wear.",
        "reviews": [
            {"author": "Bhavya", "text": "Super comfortable for wearing 9-to-5. Love them!"},
            {"author": "Tanvi", "text": "Very cute and the packaging was great."}
        ]
    },
    {
        "img": "images/earings/mini aring.png",
        "tag": "MINIMALIST",
        "title": "Mini A-Ring Studs",
        "price": "₹349",
        "old_price": "₹599",
        "desc": "A trendy geometric design for the modern aesthetic. Plated in high-gloss gold, they are versatile enough to pair with any attire.",
        "reviews": [
            {"author": "Shruti", "text": "My go-to earrings. Very modern and stylish."},
            {"author": "Zara", "text": "Good quality, doesn't irritate my sensitive ears."}
        ]
    },
    {
        "img": "images/earings/sheaded_earings.png",
        "tag": "ARTISANAL",
        "title": "Shaded Enamel Earrings",
        "price": "₹649",
        "old_price": "₹999",
        "desc": "Hand-painted enamel shading with gold accents. A unique artisanal piece that brings a subtle pop of color to a monochrome outfit.",
        "reviews": [
            {"author": "Anita", "text": "The color transition is mind-blowing. True artwork."},
            {"author": "Parvati", "text": "Matches perfectly with my silk saree!"}
        ]
    },
    {
        "img": "images/bangals/floral,bangl,set.webp",
        "tag": "FESTIVE",
        "title": "Floral Bangle Set",
        "price": "₹899",
        "old_price": "₹1,299",
        "desc": "A beautiful set of floral etched bangles perfect for festive seasons. Pair them with a heavy lehenga or a simple suit to instantly upgrade your look.",
        "reviews": [
            {"author": "Kriti", "text": "Amazing floral patterns. They don't look cheap at all."},
            {"author": "Gauri", "text": "Very happy with the purchase. The size was accurate."}
        ]
    },
    {
        "img": "images/neckless/bridal,gold set.png",
        "tag": "HERITAGE",
        "title": "Heritage Bridal Statement Set",
        "price": "₹3,499",
        "old_price": "₹5,000",
        "desc": "A majestic piece for your big day. The Heritage set features heavy layered detailing reflecting traditional royal aesthetics. Includes a matching pair of heavy earrings.",
        "reviews": [
            {"author": "Madhu", "text": "Looked like a queen on my wedding day. Must buy!"},
            {"author": "Sapna", "text": "The details are insane. Very well crafted."}
        ]
    },
    {
        "img": "images/neckless/rose,gold,set.jpg",
        "tag": "CONTEMPORARY",
        "title": "Rose Gold Evening Set",
        "price": "₹2,199",
        "old_price": "₹3,299",
        "desc": "Sophisticated rose gold finish combined with subtle rhinestone accents. This complete necklace and earring set is the perfect companion for evening gowns and cocktail dresses.",
        "reviews": [
            {"author": "Shikha", "text": "So elegant. Wore it to a cocktail party, it was perfect."},
            {"author": "Lata", "text": "The rose gold polish looks very high end."}
        ]
    }
]

# Build the shop content
shop_css = '''
<style>
  .shop-header {
    padding: 150px 72px 60px;
    text-align: center;
    background: var(--ivory);
  }
  .shop-header h1 {
    font-family: 'Playfair Display', serif;
    font-size: 50px;
    color: var(--ink);
    margin-bottom: 20px;
  }
  .shop-header p {
    font-size: 18px;
    color: var(--text);
    max-width: 600px;
    margin: 0 auto;
  }
  .shop-container {
    background: var(--ivory2);
    padding: 60px 72px 100px;
    display: flex;
    flex-direction: column;
    gap: 80px;
    align-items: center;
  }
  .product-full-card {
    display: flex;
    background: var(--white);
    border: 1px solid rgba(184,144,64,0.15);
    border-radius: 12px;
    overflow: hidden;
    width: 100%;
    max-width: 1100px;
    box-shadow: 0 15px 40px rgba(30,20,10,0.06);
    transition: transform 0.4s var(--ease), box-shadow 0.4s var(--ease);
  }
  .product-full-card:hover {
    transform: translateY(-8px);
    box-shadow: 0 25px 60px rgba(30,20,10,0.12);
    border-color: rgba(184,144,64,0.4);
  }
  .product-image-container {
    flex: 1;
    min-width: 450px;
    max-width: 500px;
    position: relative;
    background: var(--ivory3);
    overflow: hidden;
    padding: 20px;
    display: flex;
    align-items: center;
    justify-content: center;
  }
  .product-image-container img {
    width: 100%;
    height: 100%;
    max-height: 400px;
    object-fit: contain;
    transition: transform 0.6s var(--ease);
  }
  .product-full-card:hover .product-image-container img {
    transform: scale(1.05);
  }
  .product-details-container {
    flex: 1;
    padding: 50px 60px;
    display: flex;
    flex-direction: column;
    justify-content: center;
  }
  .product-tag {
    font-size: var(--fs-xs);
    letter-spacing: 3px;
    text-transform: uppercase;
    color: var(--gold);
    margin-bottom: 12px;
    font-weight: 600;
    display: inline-block;
  }
  .product-title {
    font-family: 'Playfair Display', serif;
    font-size: 36px;
    color: var(--ink);
    line-height: 1.2;
    margin-bottom: 15px;
  }
  .product-ratings {
    color: var(--gold);
    font-size: 16px;
    letter-spacing: 2px;
    margin-bottom: 25px;
    display: flex;
    align-items: center;
    gap: 10px;
  }
  .product-ratings span {
    color: var(--text2);
    font-size: 13px;
    font-family: 'Raleway', sans-serif;
    letter-spacing: 0;
  }
  .product-price {
    font-size: 28px;
    font-family: 'Playfair Display', serif;
    font-weight: 600;
    color: var(--ink);
    margin-bottom: 30px;
  }
  .product-price span {
    font-size: 18px;
    color: var(--text2);
    text-decoration: line-through;
    margin-left: 10px;
    font-family: 'Raleway', sans-serif;
    font-weight: 400;
  }
  .product-description {
    font-size: 15px;
    color: var(--text);
    line-height: 1.8;
    margin-bottom: 30px;
  }
  .product-reviews {
    background: var(--ivory);
    border-left: 2px solid var(--gold);
    padding: 20px 25px;
    margin-bottom: 40px;
  }
  .review-item {
    margin-bottom: 15px;
  }
  .review-item:last-child {
    margin-bottom: 0;
  }
  .review-author {
    font-weight: 600;
    font-size: 13px;
    color: var(--ink2);
    margin-bottom: 4px;
  }
  .review-text {
    font-style: italic;
    font-size: 13px;
    color: var(--text);
    line-height: 1.6;
  }
  .product-actions {
    display: flex;
    gap: 15px;
    margin-top: auto;
  }
  .btn-add-cart, .btn-buy-now {
    flex: 1;
    padding: 16px 20px;
    font-family: 'Raleway', sans-serif;
    font-size: 13px;
    font-weight: 600;
    letter-spacing: 2px;
    text-transform: uppercase;
    text-align: center;
    cursor: pointer;
    border-radius: 4px;
    transition: all 0.3s var(--ease);
    border: 1px solid var(--gold);
    text-decoration: none;
  }
  .btn-add-cart {
    background: transparent;
    color: var(--gold);
  }
  .btn-add-cart:hover {
    background: rgba(184,144,64,0.08);
    transform: translateY(-3px);
  }
  .btn-buy-now {
    background: var(--gold);
    color: var(--white);
  }
  .btn-buy-now:hover {
    background: var(--gold-l);
    box-shadow: 0 10px 20px rgba(184,144,64,0.3);
    transform: translateY(-3px);
  }
  @media (max-width: 960px) {
    .product-full-card {
      flex-direction: column;
    }
    .product-image-container {
      min-width: 100%;
      height: 400px;
    }
    .shop-container, .shop-header {
      padding-left: 28px;
      padding-right: 28px;
    }
  }
</style>
'''

shop_html = '''
<div class="shop-header">
  <h1>Our Complete Collection</h1>
  <p>Explore our carefully curated range of premium imitation jewellery. Full details for every piece below.</p>
</div>
<div class="shop-container">
'''

for idx, p in enumerate(products):
    revs_html = ''
    for r in p["reviews"]:
        revs_html += f'<div class="review-item"><div class="review-author">{r["author"]}</div><div class="review-text">"{r["text"]}"</div></div>'

    shop_html += f'''
  <div class="product-full-card" id="product-{idx+1}">
    <div class="product-image-container">
      <img src="{p["img"]}" alt="{p["title"]}" loading="lazy">
    </div>
    <div class="product-details-container">
      <span class="product-tag">{p["tag"]}</span>
      <h2 class="product-title">{p["title"]}</h2>
      <div class="product-ratings">★★★★★ <span>(Customer Reviews)</span></div>
      <div class="product-price">{p["price"]} <span>{p["old_price"]}</span></div>
      <p class="product-description">{p["desc"]}</p>
      
      <div class="product-reviews">
        {revs_html}
      </div>
      
      <div class="product-actions">
        <a class="btn-add-cart" onclick="alert('Added to Cart!')">Add to Cart</a>
        <a class="btn-buy-now" onclick="alert('Proceeding to Checkout...')">Buy Now</a>
      </div>
    </div>
  </div>
'''

shop_html += '</div>'

# Change title
final_header = header_part.replace('<title>Radiant Aura — Premium Imitation Jewellery | Stainless Steel Necklaces & Bridal Sets</title>', '<title>Shop All Products | Radiant Aura</title>')

# Inject CSS
final_header = final_header.replace('</head>', shop_css + '\n</head>')

final_html = final_header + '\n' + shop_html + '\n' + footer_part

with open(shop_path, 'w', encoding='utf-8') as f:
    f.write(final_html)

print("shop.html generated successfully!")
