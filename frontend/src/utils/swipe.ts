export function setupSwipeGestures(sidebarElement: HTMLElement, onOpen?: () => void, onClose?: () => void): void {
  let touchStartX = 0
  let touchStartY = 0
  let touchEndX = 0
  let touchEndY = 0

  document.addEventListener('touchstart', (e) => {
    touchStartX = e.changedTouches[0].screenX
    touchStartY = e.changedTouches[0].screenY
  }, { passive: true })

  document.addEventListener('touchend', (e) => {
    touchEndX = e.changedTouches[0].screenX
    touchEndY = e.changedTouches[0].screenY

    const diffX = touchEndX - touchStartX
    const diffY = touchEndY - touchStartY

    // Check if swipe is mostly horizontal and exceeds 40px
    if (Math.abs(diffX) > Math.abs(diffY) && Math.abs(diffX) > 40) {
      const isSidebarOpen = sidebarElement.classList.contains('open')

      if (diffX > 0) {
        // Swipe Right: Open sidebar (only if started from the left edge < 60px)
        if (!isSidebarOpen && touchStartX < 60) {
          sidebarElement.classList.add('open')
          onOpen?.()
        }
      } else {
        // Swipe Left: Close sidebar
        if (isSidebarOpen) {
          sidebarElement.classList.remove('open')
          onClose?.()
        }
      }
    }
  }, { passive: true })
}
