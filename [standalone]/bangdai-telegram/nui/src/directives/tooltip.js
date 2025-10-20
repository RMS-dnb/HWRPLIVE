export const vTooltip = {
  mounted(el, binding) {
    el._tooltipHandler = () => {
      const tooltip = document.createElement('div')
      tooltip.className = `
        fixed bg-black/70 text-white px-3 py-2 rounded text-sm z-50 
        font-crock whitespace-nowrap text-[1.4vh]
      `
      tooltip.textContent = binding.value
      
      // Append dulu untuk bisa dapat ukuran
      document.body.appendChild(tooltip)
      
      const rect = el.getBoundingClientRect()
      const tooltipRect = tooltip.getBoundingClientRect()

      // Hitung posisi
      let top = rect.top - tooltipRect.height - 5 // 5px gap
      let left = rect.left + (rect.width / 2)

      // Cek overflow dan sesuaikan posisi
      if (top < 0) {
        top = rect.bottom + 5 // Tampilkan di bawah jika overflow atas
      }
      
      if (left < tooltipRect.width / 2) {
        left = 5 // Sesuaikan jika overflow kiri
      } else if (left + tooltipRect.width / 2 > window.innerWidth) {
        left = window.innerWidth - tooltipRect.width - 5 // Sesuaikan jika overflow kanan
      }

      // Terapkan posisi
      tooltip.style.top = `${top}px`
      tooltip.style.left = `${left}px`
      tooltip.style.transform = 'translateX(-50%)'
      
      el._tooltip = tooltip
    }

    el._removeTooltip = () => {
      if (el._tooltip) {
        el._tooltip.remove()
        delete el._tooltip
      }
    }

    el.addEventListener('mouseenter', el._tooltipHandler)
    el.addEventListener('mouseleave', el._removeTooltip)
  },

  unmounted(el) {
    el.removeEventListener('mouseenter', el._tooltipHandler)
    el.removeEventListener('mouseleave', el._removeTooltip)
    if (el._tooltip) {
      el._tooltip.remove()
    }
  }
}