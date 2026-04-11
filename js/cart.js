// Radiance Aura - Shopping Cart System

const CartSystem = {
    cart: [],

    init() {
        const savedCart = localStorage.getItem('aura_cart');
        if (savedCart) {
            this.cart = JSON.parse(savedCart);
        }
        this.updateCartUI();
    },

    save() {
        localStorage.setItem('aura_cart', JSON.stringify(this.cart));
        this.updateCartUI();
    },

    addToCart(productId, quantity = 1, silent = false) {
        const product = window.productData.find(p => p.id === productId);
        if (!product) return;

        const existingItem = this.cart.find(item => item.id === productId);
        if (existingItem) {
            existingItem.quantity += quantity;
        } else {
            this.cart.push({
                id: product.id,
                name: product.name,
                price: product.price,
                image: product.image,
                quantity: quantity
            });
        }

        this.save();
        if (!silent) {
            this.showToast(`${product.name} added to cart!`);
        }
    },

    removeFromCart(productId) {
        this.cart = this.cart.filter(item => item.id !== productId);
        this.save();
    },

    updateQuantity(productId, delta) {
        const item = this.cart.find(item => item.id === productId);
        if (item) {
            item.quantity += delta;
            if (item.quantity <= 0) {
                this.removeFromCart(productId);
            } else {
                this.save();
            }
        }
    },

    getCartCount() {
        return this.cart.reduce((total, item) => total + item.quantity, 0);
    },

    getCartTotal() {
        return this.cart.reduce((total, item) => total + (item.price * item.quantity), 0);
    },

    clearCart() {
        this.cart = [];
        this.save();
    },

    updateCartUI() {
        const countElements = document.querySelectorAll('.cart-count');
        const count = this.getCartCount();
        countElements.forEach(el => {
            el.innerText = count;
            el.style.display = count > 0 ? 'flex' : 'none';
        });

        // If on cart page, trigger refresh
        if (window.refreshCartPage) {
            window.refreshCartPage();
        }
    },

    showToast(message) {
        let toast = document.getElementById('aura-toast');
        if (!toast) {
            toast = document.createElement('div');
            toast.id = 'aura-toast';
            toast.style.cssText = `
                position: fixed; bottom: 30px; right: 30px;
                background: var(--ink); color: var(--gold-xl);
                padding: 16px 24px; border-radius: 4px;
                font-family: 'Jost', sans-serif; font-size: 14px;
                letter-spacing: 1px; z-index: 9999;
                box-shadow: 0 10px 30px rgba(0,0,0,0.2);
                transform: translateY(100px); transition: transform 0.4s var(--ease);
                border-left: 4px solid var(--gold);
            `;
            document.body.appendChild(toast);
        }
        toast.innerText = message;
        toast.style.transform = 'translateY(0)';
        setTimeout(() => {
            toast.style.transform = 'translateY(100px)';
        }, 3000);
    }
};

// Initialize on load
window.addEventListener('DOMContentLoaded', () => {
    // If productData isn't loaded yet, it should be in products.js
    if (!window.productData) {
        // Fallback or wait - usually products.js is included before cart.js
    }
    CartSystem.init();
});
