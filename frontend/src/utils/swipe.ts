export function setupSwipeGestures(sidebarElement: HTMLElement, onOpen?: () => void, onClose?: () => void): void {
  let touchStartX = 0
  let touchStartY = 0
  let touchEndX = 0
  let touchEndY = 0

  document.addEventListener('touchstart', (e) => {
    const touch = e.changedTouches[0]
    if (touch) {
      touchStartX = touch.screenX
      touchStartY = touch.screenY
    }
  }, { passive: true })

  document.addEventListener('touchend', (e) => {
    const touch = e.changedTouches[0]
    if (touch) {
      touchEndX = touch.screenX
      touchEndY = touch.screenY
    }

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
