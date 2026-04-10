$indexPath = "c:\Users\LENOVO\Desktop\aura\index.html\index.html"
$shopPath  = "c:\Users\LENOVO\Desktop\aura\shop.html"

$content = [System.IO.File]::ReadAllText($indexPath)

$startNav = $content.IndexOf('<nav id="nav">')
$endNav = $content.IndexOf('</nav>', $startNav) + 6
$headerPart = $content.Substring(0, $endNav)

$startFooter = $content.IndexOf('<footer>')
$footerPart = $content.Substring($startFooter)

$headerPart = $headerPart -replace '<title>.*?</title>', '<title>Shop All Products | Radiant Aura</title>'

$css = @'
<style>
  .shop-header { padding: 150px 72px 60px; text-align: center; background: var(--ivory); }
  .shop-header h1 { font-family: 'Playfair Display', serif; font-size: 50px; color: var(--ink); margin-bottom: 20px; }
  .shop-header p { font-size: 18px; color: var(--text); max-width: 600px; margin: 0 auto; }
  .shop-container { background: var(--ivory2); padding: 60px 72px 100px; display: flex; flex-direction: column; gap: 80px; align-items: center; }
  .product-full-card { display: flex; background: var(--white); border: 1px solid rgba(184,144,64,0.15); border-radius: 12px; overflow: hidden; width: 100%; max-width: 1100px; box-shadow: 0 15px 40px rgba(30,20,10,0.06); transition: transform 0.4s var(--ease), box-shadow 0.4s var(--ease); }
  .product-full-card:hover { transform: translateY(-8px); box-shadow: 0 25px 60px rgba(30,20,10,0.12); border-color: rgba(184,144,64,0.4); }
  .product-image-container { flex: 1; min-width: 450px; max-width: 500px; position: relative; background: var(--ivory3); overflow: hidden; padding: 20px; display: flex; align-items: center; justify-content: center; }
  .product-image-container img { width: 100%; height: 100%; max-height: 400px; object-fit: contain; transition: transform 0.6s var(--ease); }
  .product-full-card:hover .product-image-container img { transform: scale(1.05); }
  .product-details-container { flex: 1; padding: 50px 60px; display: flex; flex-direction: column; justify-content: center; }
  .product-tag { font-size: var(--fs-xs); letter-spacing: 3px; text-transform: uppercase; color: var(--gold); margin-bottom: 12px; font-weight: 600; display: inline-block; }
  .product-title { font-family: 'Playfair Display', serif; font-size: 36px; color: var(--ink); line-height: 1.2; margin-bottom: 15px; }
  .product-ratings { color: var(--gold); font-size: 16px; letter-spacing: 2px; margin-bottom: 25px; display: flex; align-items: center; gap: 10px; }
  .product-ratings span { color: var(--text2); font-size: 13px; font-family: 'Raleway', sans-serif; letter-spacing: 0; }
  .product-price { font-size: 28px; font-family: 'Playfair Display', serif; font-weight: 600; color: var(--ink); margin-bottom: 30px; }
  .product-price span { font-size: 18px; color: var(--text2); text-decoration: line-through; margin-left: 10px; font-family: 'Raleway', sans-serif; font-weight: 400; }
  .product-description { font-size: 15px; color: var(--text); line-height: 1.8; margin-bottom: 30px; }
  .product-reviews { background: var(--ivory); border-left: 2px solid var(--gold); padding: 20px 25px; margin-bottom: 40px; }
  .review-item { margin-bottom: 15px; }
  .review-item:last-child { margin-bottom: 0; }
  .review-author { font-weight: 600; font-size: 13px; color: var(--ink2); margin-bottom: 4px; }
  .review-text { font-style: italic; font-size: 13px; color: var(--text); line-height: 1.6; }
  .product-actions { display: flex; gap: 15px; margin-top: auto; }
  .btn-add-cart, .btn-buy-now { flex: 1; padding: 16px 20px; font-family: 'Raleway', sans-serif; font-size: 13px; font-weight: 600; letter-spacing: 2px; text-transform: uppercase; text-align: center; cursor: pointer; border-radius: 4px; transition: all 0.3s var(--ease); border: 1px solid var(--gold); text-decoration: none; }
  .btn-add-cart { background: transparent; color: var(--gold); }
  .btn-add-cart:hover { background: rgba(184,144,64,0.08); transform: translateY(-3px); }
  .btn-buy-now { background: var(--gold); color: var(--white); }
  .btn-buy-now:hover { background: var(--gold-l); box-shadow: 0 10px 20px rgba(184,144,64,0.3); transform: translateY(-3px); }
  @media (max-width: 960px) {
    .product-full-card { flex-direction: column; }
    .product-image-container { min-width: 100%; height: 400px; }
    .shop-container, .shop-header { padding-left: 28px; padding-right: 28px; }
  }
</style>
'@

$headerPart = $headerPart.Replace('</head>', $css + "`n</head>")

$html = @'
<div class="shop-header">
  <h1>Our Complete Collection</h1>
  <p>Explore our carefully curated range of premium imitation jewellery. Full details for every piece below.</p>
</div>
<div class="shop-container">

  <!-- Product 1 -->
  <div class="product-full-card" id="product-1">
    <div class="product-image-container">
      <img src="images/necklaces/necklace-1.jpg" alt="Celestial Pearl Choker" loading="lazy">
    </div>
    <div class="product-details-container">
      <span class="product-tag">BRIDAL NECKLACE</span>
      <h2 class="product-title">Celestial Pearl Choker</h2>
      <div class="product-ratings">★★★★★ <span>(Customer Reviews)</span></div>
      <div class="product-price">₹1,299 <span>₹1,999</span></div>
      <p class="product-description">Exquisite kundan work with cascading ethereal pearls. Perfectly crafted to enhance your traditional look with a modern touch. Hypoallergenic and lightweight for all-day comfort.</p>
      <div class="product-reviews">
        <div class="review-item"><div class="review-author">Riya Patel</div><div class="review-text">"Absolutely stunning piece! Looks exactly like the picture. Highly recommend for weddings."</div></div>
        <div class="review-item"><div class="review-author">Ankit Sharma</div><div class="review-text">"Bought this for my wife and she loved it. The quality is premium and packaging is great."</div></div>
      </div>
      <div class="product-actions">
        <a class="btn-add-cart" onclick="alert('Added to Cart!')">Add to Cart</a>
        <a class="btn-buy-now" href="shop.html">Buy Now</a>
      </div>
    </div>
  </div>

  <!-- Product 2 -->
  <div class="product-full-card" id="product-2">
    <div class="product-image-container">
      <img src="images/necklaces/necklace-2.jpg" alt="Royal Gold Bridal Set" loading="lazy">
    </div>
    <div class="product-details-container">
      <span class="product-tag">PREMIUM Gold</span>
      <h2 class="product-title">Royal Gold Bridal Set</h2>
      <div class="product-ratings">★★★★★ <span>(Customer Reviews)</span></div>
      <div class="product-price">₹2,499 <span>₹3,499</span></div>
      <p class="product-description">Traditional temple jewellery with intricate craftsmanship. Bring out the goddess in you with this heavily embellished gold-finish statement piece.</p>
      <div class="product-reviews">
        <div class="review-item"><div class="review-author">Simran K.</div><div class="review-text">"Wore it on my engagement. Everyone kept asking if it was real gold!"</div></div>
        <div class="review-item"><div class="review-author">Meera Joshi</div><div class="review-text">"Heavy look but very light on the neck. Stunning finish."</div></div>
      </div>
      <div class="product-actions">
        <a class="btn-add-cart" onclick="alert('Added to Cart!')">Add to Cart</a>
        <a class="btn-buy-now" href="shop.html">Buy Now</a>
      </div>
    </div>
  </div>

  <!-- Product 3 -->
  <div class="product-full-card" id="product-3">
    <div class="product-image-container">
      <img src="images/necklaces/necklace-3.jpg" alt="Modern Rose Gold Elegance" loading="lazy">
    </div>
    <div class="product-details-container">
      <span class="product-tag">MODERN SELECTION</span>
      <h2 class="product-title">Modern Rose Gold Elegance</h2>
      <div class="product-ratings">★★★★★ <span>(Customer Reviews)</span></div>
      <div class="product-price">₹899 <span>₹1,299</span></div>
      <p class="product-description">Sleek and contemporary design for the modern woman. A beautiful rose-gold plated necklace that elegantly transitions from day to night.</p>
      <div class="product-reviews">
        <div class="review-item"><div class="review-author">Neha S.</div><div class="review-text">"Perfect for office wear and small parties. Very chic!"</div></div>
        <div class="review-item"><div class="review-author">Aarti V.</div><div class="review-text">"I love the rose gold color. Doesn't fade at all."</div></div>
      </div>
      <div class="product-actions">
        <a class="btn-add-cart" onclick="alert('Added to Cart!')">Add to Cart</a>
        <a class="btn-buy-now" href="shop.html">Buy Now</a>
      </div>
    </div>
  </div>

  <!-- Product 4 -->
  <div class="product-full-card" id="product-4">
    <div class="product-image-container">
      <img src="images/necklaces/necklace-4.jpg" alt="Diamond Lustre Necklace" loading="lazy">
    </div>
    <div class="product-details-container">
      <span class="product-tag">LUXURY</span>
      <h2 class="product-title">Diamond Lustre Necklace</h2>
      <div class="product-ratings">★★★★★ <span>(Customer Reviews)</span></div>
      <div class="product-price">₹1,799 <span>₹2,500</span></div>
      <p class="product-description">Brilliant cubic zirconia set in a classic silhouette. The flawless precision cut of the stones gives an unbelievable shine comparable to real diamonds.</p>
      <div class="product-reviews">
        <div class="review-item"><div class="review-author">Preeti M.</div><div class="review-text">"The stones literally sparkle in the dark! Beyond gorgeous."</div></div>
        <div class="review-item"><div class="review-author">Divya R.</div><div class="review-text">"Looks super expensive. A must-buy for receptions."</div></div>
      </div>
      <div class="product-actions">
        <a class="btn-add-cart" onclick="alert('Added to Cart!')">Add to Cart</a>
        <a class="btn-buy-now" href="shop.html">Buy Now</a>
      </div>
    </div>
  </div>

  <!-- Product 5 -->
  <div class="product-full-card" id="product-5">
    <div class="product-image-container">
      <img src="images/earings/heavi,jhumka.jpg" alt="Heavy Jhumka Drops" loading="lazy">
    </div>
    <div class="product-details-container">
      <span class="product-tag">TRADITIONAL EARRINGS</span>
      <h2 class="product-title">Heavy Jhumka Drops</h2>
      <div class="product-ratings">★★★★★ <span>(Customer Reviews)</span></div>
      <div class="product-price">₹499 <span>₹799</span></div>
      <p class="product-description">Classic heavy jhumka design with intricate detailing. Perfect to pair with your festive wear. Made from high-quality alloy with long-lasting gold polish.</p>
      <div class="product-reviews">
        <div class="review-item"><div class="review-author">Kavya T.</div><div class="review-text">"Beautiful jhumkas. Fast delivery too!"</div></div>
        <div class="review-item"><div class="review-author">Pooja B.</div><div class="review-text">"A standard traditional piece. Love wearing it."</div></div>
      </div>
      <div class="product-actions">
        <a class="btn-add-cart" onclick="alert('Added to Cart!')">Add to Cart</a>
        <a class="btn-buy-now" href="shop.html">Buy Now</a>
      </div>
    </div>
  </div>

  <!-- Product 6 -->
  <div class="product-full-card" id="product-6">
    <div class="product-image-container">
      <img src="images/bangals/gold,bangals.png" alt="Royal Gold Bangles Set" loading="lazy">
    </div>
    <div class="product-details-container">
      <span class="product-tag">DAILY WEAR</span>
      <h2 class="product-title">Royal Gold Bangles Set</h2>
      <div class="product-ratings">★★★★★ <span>(Customer Reviews)</span></div>
      <div class="product-price">₹699 <span>₹999</span></div>
      <p class="product-description">A set of four premium gold-plated bangles. The timeless design makes them perfect for everyday elegance as well as festive occasions.</p>
      <div class="product-reviews">
        <div class="review-item"><div class="review-author">Sneha</div><div class="review-text">"Fits perfectly. Has a nice weight to it like real gold."</div></div>
        <div class="review-item"><div class="review-author">Aditi G.</div><div class="review-text">"I've been wearing it daily. The polish is completely intact."</div></div>
      </div>
      <div class="product-actions">
        <a class="btn-add-cart" onclick="alert('Added to Cart!')">Add to Cart</a>
        <a class="btn-buy-now" href="shop.html">Buy Now</a>
      </div>
    </div>
  </div>

  <!-- Product 7 -->
  <div class="product-full-card" id="product-7">
    <div class="product-image-container">
      <img src="images/ring/dimond,ring.png" alt="Eternal Diamond Ring" loading="lazy">
    </div>
    <div class="product-details-container">
      <span class="product-tag">SIGNATURE RINGS</span>
      <h2 class="product-title">Eternal Diamond Ring</h2>
      <div class="product-ratings">★★★★★ <span>(Customer Reviews)</span></div>
      <div class="product-price">₹399 <span>₹599</span></div>
      <p class="product-description">Adjustable solitaire ring featuring a high-clarity cubic zirconia stone. Minimalist and beautiful, an ideal gift to express eternal love.</p>
      <div class="product-reviews">
        <div class="review-item"><div class="review-author">Priyanka</div><div class="review-text">"Very delicate and beautiful. adjustable so it fits perfectly."</div></div>
        <div class="review-item"><div class="review-author">Varun S.</div><div class="review-text">"Gifted this to my girlfriend. It's a gorgeous ring."</div></div>
      </div>
      <div class="product-actions">
        <a class="btn-add-cart" onclick="alert('Added to Cart!')">Add to Cart</a>
        <a class="btn-buy-now" href="shop.html">Buy Now</a>
      </div>
    </div>
  </div>

  <!-- Product 8 -->
  <div class="product-full-card" id="product-8">
    <div class="product-image-container">
      <img src="images/earings/long_earings.jpg" alt="Cascade Long Earrings" loading="lazy">
    </div>
    <div class="product-details-container">
      <span class="product-tag">STATEMENT EARRINGS</span>
      <h2 class="product-title">Cascade Long Earrings</h2>
      <div class="product-ratings">★★★★★ <span>(Customer Reviews)</span></div>
      <div class="product-price">₹549 <span>₹899</span></div>
      <p class="product-description">Elegant long cascading earrings in rose gold finish. Very flattering and provides a modern silhouette that elevates any outfit.</p>
      <div class="product-reviews">
        <div class="review-item"><div class="review-author">Ritika</div><div class="review-text">"So elegant! Great for western outfits too."</div></div>
        <div class="review-item"><div class="review-author">Mansi</div><div class="review-text">"Received it today. Looks better in person!"</div></div>
      </div>
      <div class="product-actions">
        <a class="btn-add-cart" onclick="alert('Added to Cart!')">Add to Cart</a>
        <a class="btn-buy-now" href="shop.html">Buy Now</a>
      </div>
    </div>
  </div>

  <!-- Product 9 -->
  <div class="product-full-card" id="product-9">
    <div class="product-image-container">
      <img src="images/earings/dimonds_earings.png" alt="Crystal Drop Diamond Earrings" loading="lazy">
    </div>
    <div class="product-details-container">
      <span class="product-tag">ELEGANT</span>
      <h2 class="product-title">Crystal Drop Diamond Earrings</h2>
      <div class="product-ratings">★★★★★ <span>(Customer Reviews)</span></div>
      <div class="product-price">₹799 <span>₹1,199</span></div>
      <p class="product-description">Dazzle the crowd with these exquisite crystal drop earrings. Masterfully cut for maximum brilliance and set in tarnish-resistant silver plating.</p>
      <div class="product-reviews">
        <div class="review-item"><div class="review-author">Aisha P.</div><div class="review-text">"Incredible shine. They catch the light beautifully."</div></div>
        <div class="review-item"><div class="review-author">Nandini R.</div><div class="review-text">"Wore these to a gala. Received endless compliments."</div></div>
      </div>
      <div class="product-actions">
        <a class="btn-add-cart" onclick="alert('Added to Cart!')">Add to Cart</a>
        <a class="btn-buy-now" href="shop.html">Buy Now</a>
      </div>
    </div>
  </div>

  <!-- Product 10 -->
  <div class="product-full-card" id="product-10">
    <div class="product-image-container">
      <img src="images/earings/light,earing.png" alt="Lightweight Floral Earrings" loading="lazy">
    </div>
    <div class="product-details-container">
      <span class="product-tag">EVERYDAY WEAR</span>
      <h2 class="product-title">Lightweight Floral Earrings</h2>
      <div class="product-ratings">★★★★★ <span>(Customer Reviews)</span></div>
      <div class="product-price">₹299 <span>₹499</span></div>
      <p class="product-description">Delicate and exceptionally lightweight. These floral ear studs are perfect for women who love minimalistic jewelry for daily office wear.</p>
      <div class="product-reviews">
        <div class="review-item"><div class="review-author">Bhavya</div><div class="review-text">"Super comfortable for wearing 9-to-5. Love them!"</div></div>
        <div class="review-item"><div class="review-author">Tanvi</div><div class="review-text">"Very cute and the packaging was great."</div></div>
      </div>
      <div class="product-actions">
        <a class="btn-add-cart" onclick="alert('Added to Cart!')">Add to Cart</a>
        <a class="btn-buy-now" href="shop.html">Buy Now</a>
      </div>
    </div>
  </div>

  <!-- Product 11 -->
  <div class="product-full-card" id="product-11">
    <div class="product-image-container">
      <img src="images/earings/mini aring.png" alt="Mini A-Ring Studs" loading="lazy">
    </div>
    <div class="product-details-container">
      <span class="product-tag">MINIMALIST</span>
      <h2 class="product-title">Mini A-Ring Studs</h2>
      <div class="product-ratings">★★★★★ <span>(Customer Reviews)</span></div>
      <div class="product-price">₹349 <span>₹599</span></div>
      <p class="product-description">A trendy geometric design for the modern aesthetic. Plated in high-gloss gold, they are versatile enough to pair with any attire.</p>
      <div class="product-reviews">
        <div class="review-item"><div class="review-author">Shruti</div><div class="review-text">"My go-to earrings. Very modern and stylish."</div></div>
        <div class="review-item"><div class="review-author">Zara</div><div class="review-text">"Good quality, doesn't irritate my sensitive ears."</div></div>
      </div>
      <div class="product-actions">
        <a class="btn-add-cart" onclick="alert('Added to Cart!')">Add to Cart</a>
        <a class="btn-buy-now" href="shop.html">Buy Now</a>
      </div>
    </div>
  </div>

  <!-- Product 12 -->
  <div class="product-full-card" id="product-12">
    <div class="product-image-container">
      <img src="images/earings/sheaded_earings.png" alt="Shaded Enamel Earrings" loading="lazy">
    </div>
    <div class="product-details-container">
      <span class="product-tag">ARTISANAL</span>
      <h2 class="product-title">Shaded Enamel Earrings</h2>
      <div class="product-ratings">★★★★★ <span>(Customer Reviews)</span></div>
      <div class="product-price">₹649 <span>₹999</span></div>
      <p class="product-description">Hand-painted enamel shading with gold accents. A unique artisanal piece that brings a subtle pop of color to a monochrome outfit.</p>
      <div class="product-reviews">
        <div class="review-item"><div class="review-author">Anita</div><div class="review-text">"The color transition is mind-blowing. True artwork."</div></div>
        <div class="review-item"><div class="review-author">Parvati</div><div class="review-text">"Matches perfectly with my silk saree!"</div></div>
      </div>
      <div class="product-actions">
        <a class="btn-add-cart" onclick="alert('Added to Cart!')">Add to Cart</a>
        <a class="btn-buy-now" href="shop.html">Buy Now</a>
      </div>
    </div>
  </div>

  <!-- Product 13 -->
  <div class="product-full-card" id="product-13">
    <div class="product-image-container">
      <img src="images/bangals/floral,bangl,set.webp" alt="Floral Bangle Set" loading="lazy">
    </div>
    <div class="product-details-container">
      <span class="product-tag">FESTIVE</span>
      <h2 class="product-title">Floral Bangle Set</h2>
      <div class="product-ratings">★★★★★ <span>(Customer Reviews)</span></div>
      <div class="product-price">₹899 <span>₹1,299</span></div>
      <p class="product-description">A beautiful set of floral etched bangles perfect for festive seasons. Pair them with a heavy lehenga or a simple suit to instantly upgrade your look.</p>
      <div class="product-reviews">
        <div class="review-item"><div class="review-author">Kriti</div><div class="review-text">"Amazing floral patterns. They don't look cheap at all."</div></div>
        <div class="review-item"><div class="review-author">Gauri</div><div class="review-text">"Very happy with the purchase. The size was accurate."</div></div>
      </div>
      <div class="product-actions">
        <a class="btn-add-cart" onclick="alert('Added to Cart!')">Add to Cart</a>
        <a class="btn-buy-now" href="shop.html">Buy Now</a>
      </div>
    </div>
  </div>

  <!-- Product 14 -->
  <div class="product-full-card" id="product-14">
    <div class="product-image-container">
      <img src="images/neckless/bridal,gold set.png" alt="Heritage Bridal Statement Set" loading="lazy">
    </div>
    <div class="product-details-container">
      <span class="product-tag">HERITAGE</span>
      <h2 class="product-title">Heritage Bridal Statement Set</h2>
      <div class="product-ratings">★★★★★ <span>(Customer Reviews)</span></div>
      <div class="product-price">₹3,499 <span>₹5,000</span></div>
      <p class="product-description">A majestic piece for your big day. The Heritage set features heavy layered detailing reflecting traditional royal aesthetics. Includes a matching pair of heavy earrings.</p>
      <div class="product-reviews">
        <div class="review-item"><div class="review-author">Madhu</div><div class="review-text">"Looked like a queen on my wedding day. Must buy!"</div></div>
        <div class="review-item"><div class="review-author">Sapna</div><div class="review-text">"The details are insane. Very well crafted."</div></div>
      </div>
      <div class="product-actions">
        <a class="btn-add-cart" onclick="alert('Added to Cart!')">Add to Cart</a>
        <a class="btn-buy-now" href="shop.html">Buy Now</a>
      </div>
    </div>
  </div>

  <!-- Product 15 -->
  <div class="product-full-card" id="product-15">
    <div class="product-image-container">
      <img src="images/neckless/rose,gold,set.jpg" alt="Rose Gold Evening Set" loading="lazy">
    </div>
    <div class="product-details-container">
      <span class="product-tag">CONTEMPORARY</span>
      <h2 class="product-title">Rose Gold Evening Set</h2>
      <div class="product-ratings">★★★★★ <span>(Customer Reviews)</span></div>
      <div class="product-price">₹2,199 <span>₹3,299</span></div>
      <p class="product-description">Sophisticated rose gold finish combined with subtle rhinestone accents. This complete necklace and earring set is the perfect companion for evening gowns and cocktail dresses.</p>
      <div class="product-reviews">
        <div class="review-item"><div class="review-author">Shikha</div><div class="review-text">"So elegant. Wore it to a cocktail party, it was perfect."</div></div>
        <div class="review-item"><div class="review-author">Lata</div><div class="review-text">"The rose gold polish looks very high end."</div></div>
      </div>
      <div class="product-actions">
        <a class="btn-add-cart" onclick="alert('Added to Cart!')">Add to Cart</a>
        <a class="btn-buy-now" href="shop.html">Buy Now</a>
      </div>
    </div>
  </div>

</div>
'@

$final = $headerPart + "`n" + $html + "`n" + $footerPart
[System.IO.File]::WriteAllText($shopPath, $final, [System.Text.Encoding]::UTF8)
Write-Output "Successfully generated shop.html!"
