export const prefersDarkMode = () =>
  window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches

export const darkModeListener = (dark) => (light) => () => {
  const listener = (event) => {
    event.matches ? dark() : light()
  }
  window
    .matchMedia && window
      .matchMedia('(prefers-color-scheme: dark)')
      .addEventListener('change', listener)
  return () => {
    window
      .matchMedia && window
        .matchMedia('(prefers-color-scheme: dark)')
        .removeEventListener('change', listener)
  }
}
