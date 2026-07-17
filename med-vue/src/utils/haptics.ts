export async function hapticFeedback(style: 'light' | 'medium' | 'heavy' | 'success' | 'warning' | 'error' = 'medium'): Promise<void> {
  try {
    if (typeof window !== 'undefined' && window.Capacitor && window.Capacitor.Plugins && window.Capacitor.Plugins.Haptics) {
      const { Haptics, HapticsImpactStyle } = window.Capacitor.Plugins
      const impactStyle =
        style === 'light'
          ? HapticsImpactStyle.Light
          : style === 'heavy'
            ? HapticsImpactStyle.Heavy
            : HapticsImpactStyle.Medium

      await Haptics.impact({ style: impactStyle })
    }
  } catch {
    // Silently ignore haptic errors (e.g., in browser or unsupported device)
  }
}

export async function hapticNotification(type: 'success' | 'warning' | 'error' = 'success'): Promise<void> {
  try {
    if (typeof window !== 'undefined' && window.Capacitor && window.Capacitor.Plugins && window.Capacitor.Plugins.Haptics) {
      const { Haptics, HapticsNotificationType } = window.Capacitor.Plugins
      const notificationType =
        type === 'success'
          ? HapticsNotificationType.Success
          : type === 'warning'
            ? HapticsNotificationType.Warning
            : HapticsNotificationType.Error

      await Haptics.notification({ type: notificationType })
    }
  } catch {
    // Silently ignore haptic errors
  }
}
