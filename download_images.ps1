$images = @{
    "images/hero.jpg" = "https://loremflickr.com/1200/800/luxury,jewelry/all"
    "images/collection-signature.jpg" = "https://loremflickr.com/800/1000/bridal,jewelry,necklace/all"
    "images/collection-choker.jpg" = "https://loremflickr.com/800/1000/choker,necklace,gold/all"
    "images/collection-earrings.jpg" = "https://loremflickr.com/800/1000/gold,earrings,jewelry/all"
    "images/collection-bangles.jpg" = "https://loremflickr.com/800/1000/gold,bangles,jewelry/all"
    "images/collection-ring.jpg" = "https://loremflickr.com/800/1000/diamond,ring,jewelry/all"
    "images/gallery-bridal.jpg" = "https://loremflickr.com/800/1200/bridal,necklace,gold/all"
    "images/gallery-jhumka.jpg" = "https://loremflickr.com/800/800/traditional,earrings,jewelry/all"
    "images/gallery-festive.jpg" = "https://loremflickr.com/800/800/festive,necklace,jewelry/all"
    "images/gallery-bangles.jpg" = "https://loremflickr.com/800/1000/bracelets,gold,jewelry/all"
    "images/gallery-amethyst.jpg" = "https://loremflickr.com/800/1000/amethyst,ring,jewelry/all"
    "images/gallery-ethnic.jpg" = "https://loremflickr.com/800/800/ethnic,jewelry,necklace/all"
    "images/about.jpg" = "https://loremflickr.com/800/800/jewelry,artisan,craft/all"
    "images/services.jpg" = "https://loremflickr.com/1000/400/jewelry,gift,box/all"
    "images/contact.jpg" = "https://loremflickr.com/600/600/desk,stationery,gold/all"
}

foreach ($item in $images.GetEnumerator()) {
    $file = $item.Key
    $url = $item.Value
    Write-Host "Downloading $file from $url..."
    try {
        Invoke-WebRequest -Uri $url -OutFile $file -ErrorAction Stop
        Write-Host "Successfully downloaded $file"
    } catch {
        Write-Host "Failed to download $file : $_"
    }
}
