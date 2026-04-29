// Hover effect for arch-box elements
document.addEventListener('DOMContentLoaded', function() {
    // Apply hover effect to all arch-box elements
    document.querySelectorAll('.arch-box').forEach(function(box) {
        box.addEventListener('mouseenter', function() {
            this.style.background = 'rgba(0,180,216,0.25)';
            this.style.borderColor = '#00B4D8';
            this.style.transform = 'translateY(-10px) scale(1.02)';
            this.style.boxShadow = '0 20px 50px rgba(0,180,216,0.5), 0 0 20px rgba(0,180,216,0.6), 0 0 40px rgba(0,180,216,0.3)';
            this.style.transition = 'all 0.3s ease';
            
            var icon = this.querySelector('.arch-box-icon');
            if (icon) {
                icon.style.background = 'linear-gradient(135deg, #00B4D8, #0077B6)';
                icon.style.transform = 'scale(1.15)';
            }
            
            var name = this.querySelector('.arch-box-name');
            if (name) name.style.color = 'white';
            
            var desc = this.querySelector('.arch-box-desc');
            if (desc) desc.style.color = 'rgba(255,255,255,0.9)';
        });
        
        box.addEventListener('mouseleave', function() {
            this.style.background = '';
            this.style.borderColor = '';
            this.style.transform = '';
            this.style.boxShadow = '';
            this.style.transition = '';
            
            var icon = this.querySelector('.arch-box-icon');
            if (icon) {
                icon.style.background = '';
                icon.style.transform = '';
            }
            
            var name = this.querySelector('.arch-box-name');
            if (name) name.style.color = '';
            
            var desc = this.querySelector('.arch-box-desc');
            if (desc) desc.style.color = '';
        });
    });
});