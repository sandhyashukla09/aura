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
  const currentPath = window.location.pathname.split('/').pop() || 'index.html';
  const navLinks = document.querySelectorAll('.nav-link');
  navLinks.forEach(link => {
    const linkPath = link.getAttribute('href');
    if (linkPath === currentPath) {
      link.classList.add('active');
    }
  });

  // Custom Cursor Logic
  const cursorDot = document.createElement('div');
  const cursorOutline = document.createElement('div');
  cursorDot.classList.add('cursor-dot');
  cursorOutline.classList.add('cursor-outline');
  document.body.appendChild(cursorDot);
  document.body.appendChild(cursorOutline);

  window.addEventListener('mousemove', (e) => {
    const posX = e.clientX;
    const posY = e.clientY;
    
    cursorDot.style.left = `${posX}px`;
    cursorDot.style.top = `${posY}px`;
    
    cursorOutline.animate({
      left: `${posX}px`,
      top: `${posY}px`
    }, { duration: 500, fill: 'forwards' });
  });

  const interactiveElements = document.querySelectorAll('a, button, .btn');
  if (interactiveElements) {
    interactiveElements.forEach(el => {
      el.addEventListener('mouseenter', () => {
        cursorDot.style.transform = 'translate(-50%, -50%) scale(1.5)';
        cursorOutline.style.transform = 'translate(-50%, -50%) scale(1.5)';
        cursorOutline.style.background = 'var(--primary-glow)';
      });
      el.addEventListener('mouseleave', () => {
        cursorDot.style.transform = 'translate(-50%, -50%) scale(1)';
        cursorOutline.style.transform = 'translate(-50%, -50%) scale(1)';
        cursorOutline.style.background = 'transparent';
      });
    });
  }

  // AI Edge Particles Logic
  const particleContainer = document.getElementById('particle-container');
  if (particleContainer) {
    const canvas = document.createElement('canvas');
    const ctx = canvas.getContext('2d');
    particleContainer.appendChild(canvas);

    let particles = [];
    const particleCount = 70;

    const resize = () => {
      canvas.width = window.innerWidth;
      canvas.height = window.innerHeight;
    };

    window.addEventListener('resize', resize);
    resize();

    class Particle {
      constructor() {
        this.init();
      }

      init() {
        this.x = Math.random() * canvas.width;
        this.y = Math.random() * canvas.height;
        this.vx = (Math.random() - 0.5) * 0.5;
        this.vy = (Math.random() - 0.5) * 0.5;
        this.size = Math.random() * 2;
      }

      update() {
        this.x += this.vx;
        this.y += this.vy;

        if (this.x < 0 || this.x > canvas.width) this.vx *= -1;
        if (this.y < 0 || this.y > canvas.height) this.vy *= -1;
      }

      draw() {
        ctx.beginPath();
        ctx.arc(this.x, this.y, this.size, 0, Math.PI * 2);
        ctx.fillStyle = 'rgba(0, 242, 234, 0.3)';
        ctx.fill();
      }
    }

    for (let i = 0; i < particleCount; i++) {
      particles.push(new Particle());
    }

    const animate = () => {
      ctx.clearRect(0, 0, canvas.width, canvas.height);
      
      particles.forEach(p => {
        p.update();
        p.draw();
        
        particles.forEach(p2 => {
          const dx = p.x - p2.x;
          const dy = p.y - p2.y;
          const dist = Math.sqrt(dx * dx + dy * dy);
          
          if (dist < 100) {
            ctx.beginPath();
            ctx.strokeStyle = `rgba(0, 242, 234, ${0.1 * (1 - dist / 100)})`;
            ctx.lineWidth = 0.5;
            ctx.moveTo(p.x, p.y);
            ctx.lineTo(p2.x, p2.y);
            ctx.stroke();
          }
        });
      });
      
      requestAnimationFrame(animate);
    };

    animate();
  }
});
