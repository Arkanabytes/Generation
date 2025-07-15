// Validación del formulario
document.getElementById('contactForm').addEventListener('submit', function (e) {
    e.preventDefault();

    if (this.checkValidity()) {
        // Mostrar toast de éxito
        const toastElement = document.getElementById('liveToast');
        const toast = new bootstrap.Toast(toastElement);
        toast.show();

        // Limpiar formulario
        this.reset();
        this.classList.remove('was-validated');
    } else {
        this.classList.add('was-validated');
    }
});

// Efectos hover en las tarjetas de productos
document.querySelectorAll('.card-hover').forEach(card => {
    card.addEventListener('mouseenter', function () {
        const overlay = this.querySelector('.position-absolute.bg-dark');
        if (overlay) {
            overlay.style.opacity = '1';
        }
    });

    card.addEventListener('mouseleave', function () {
        const overlay = this.querySelector('.position-absolute.bg-dark');
        if (overlay) {
            overlay.style.opacity = '0';
        }
    });
});

// Animaciones al hacer scroll
const observerOptions = {
    threshold: 0.1,
    rootMargin: '0px 0px -50px 0px'
};

const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.classList.add('visible');
        }
    });
}, observerOptions);

document.querySelectorAll('.animate-on-scroll').forEach(el => {
    observer.observe(el);
});

// Smooth scrolling para navegación
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            target.scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        }
    });
});

// Contador de productos en el carrito (simulado)
let cartCount = 0;
document.querySelectorAll('.btn-modern').forEach(btn => {
    btn.addEventListener('click', function () {
        if (this.textContent.includes('Agregar al carrito')) {
            cartCount++;

            // Crear notificación temporal
            const notification = document.createElement('div');
            notification.className = 'alert alert-success position-fixed top-0 end-0 m-3';
            notification.style.zIndex = '9999';
            notification.innerHTML = `
                        <i class="fas fa-check-circle me-2"></i>
                        Producto agregado al carrito (${cartCount})
                    `;

            document.body.appendChild(notification);

            // Remover notificación después de 3 segundos
            setTimeout(() => {
                notification.remove();
            }, 3000);
        }
    });
});

// Funcionalidad de favoritos
document.querySelectorAll('.btn-outline-danger').forEach(btn => {
    btn.addEventListener('click', function () {
        const icon = this.querySelector('i');
        if (icon.classList.contains('fas')) {
            icon.classList.remove('fas');
            icon.classList.add('far');
            this.classList.remove('btn-outline-danger');
            this.classList.add('btn-outline-secondary');
        } else {
            icon.classList.remove('far');
            icon.classList.add('fas');
            this.classList.remove('btn-outline-secondary');
            this.classList.add('btn-outline-danger');
        }
    });
});

// Búsqueda en tiempo real (simulada)
document.querySelector('input[placeholder="Buscar productos..."]').addEventListener('input', function () {
    const searchTerm = this.value.toLowerCase();
    const productCards = document.querySelectorAll('#ejercicio3 .card');

    productCards.forEach(card => {
        const title = card.querySelector('.card-title').textContent.toLowerCase();
        const description = card.querySelector('.card-text').textContent.toLowerCase();

        if (title.includes(searchTerm) || description.includes(searchTerm)) {
            card.closest('.col-xl-4').style.display = 'block';
        } else {
            card.closest('.col-xl-4').style.display = searchTerm === '' ? 'block' : 'none';
        }
    });
});