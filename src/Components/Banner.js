export const addConfetti = async () => {
  const JSConfetti = await import('js-confetti');
  const jsConfetti = new JSConfetti.default()
  jsConfetti.addConfetti()
}