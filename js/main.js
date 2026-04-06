document.addEventListener('DOMContentLoaded', () => {
  // Sticky Navbar
  const nav = document.querySelector('nav');
  window.addEventListener('scroll', () => {
    if (window.scrollY > 50) {
      nav.classList.add('scrolled');
    } else {
      nav.classList.remove('scrolled');
    }
  });

  // Mobile Menu Toggle
  const menuToggle = document.getElementById('menuToggle');
  const navMenu = document.querySelector('.nav-menu');
  const navCTA = document.querySelector('.nav-cta');

  if (menuToggle) {
    menuToggle.addEventListener('click', () => {
      // Create mobile overlay if it doesn't exist
      let mobileOverlay = document.getElementById('mobileOverlay');
      if (!mobileOverlay) {
        mobileOverlay = document.createElement('div');
        mobileOverlay.id = 'mobileOverlay';
        mobileOverlay.style.cssText = `
          position: fixed;
          top: 0;
          left: 0;
          width: 100%;
          height: 100%;
          background: rgba(11, 15, 20, 0.98);
          z-index: 999;
          display: flex;
          flex-direction: column;
          align-items: center;
          justify-content: center;
          gap: 30px;
          opacity: 0;
          pointer-events: none;
          transition: all 0.3s ease;
          backdrop-filter: blur(10px);
        `;
        
        // Clone menu items
        const menuClone = navMenu.cloneNode(true);
        menuClone.style.display = 'flex';
        menuClone.style.flexDirection = 'column';
        menuClone.style.alignItems = 'center';
        menuClone.style.gap = '25px';
        mobileOverlay.appendChild(menuClone);

        // Clone CTA button
        const ctaBtn = navCTA.querySelector('.btn-primary').cloneNode(true);
        mobileOverlay.appendChild(ctaBtn);

        document.body.appendChild(mobileOverlay);
      }

      const isOpen = mobileOverlay.style.opacity === '1';
      mobileOverlay.style.opacity = isOpen ? '0' : '1';
      mobileOverlay.style.pointerEvents = isOpen ? 'none' : 'all';
      
      // Animate toggle bars
      const spans = menuToggle.querySelectorAll('span');
      if (!isOpen) {
        spans[0].style.transform = 'rotate(45deg) translate(5px, 5px)';
        spans[1].style.opacity = '0';
        spans[2].style.transform = 'rotate(-45deg) translate(6px, -6px)';
      } else {
        spans[0].style.transform = 'none';
        spans[1].style.opacity = '1';
        spans[2].style.transform = 'none';
      }
    });
  }

  // Reveal Animations on Scroll
  const revealElements = document.querySelectorAll('.reveal');
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('active');
      }
    });
  }, { threshold: 0.1 });

  revealElements.forEach(el => observer.observe(el));

  // Current page highlighting
  const currentPath = window.location.pathname;
  const navLinks = document.querySelectorAll('.nav-link');
  navLinks.forEach(link => {
    if (link.getAttribute('href') === currentPath || (currentPath === '/' && link.getAttribute('href') === 'index.html')) {
      link.classList.add('active');
    }
  });
});
