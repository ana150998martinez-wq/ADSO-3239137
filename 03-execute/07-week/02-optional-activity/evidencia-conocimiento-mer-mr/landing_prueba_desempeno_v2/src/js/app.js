const bindScroll = (buttonId, targetId) => {
  const button = document.getElementById(buttonId);
  const target = document.getElementById(targetId);

  if (!button || !target) return;

  button.addEventListener('click', () => {
    target.scrollIntoView({ behavior: 'smooth', block: 'start' });
  });
};

bindScroll('scrollToGuide', 'guide');
bindScroll('scrollToDomains', 'domains');
bindScroll('scrollToPhases', 'phases');

const topButton = document.getElementById('scrollToTop');
if (topButton) {
  topButton.addEventListener('click', () => {
    window.scrollTo({ top: 0, behavior: 'smooth' });
  });
}

const observer = new IntersectionObserver((entries) => {
  entries.forEach((entry) => {
    if (entry.isIntersecting) {
      entry.target.classList.add('visible');
    }
  });
}, { threshold: 0.12 });

const revealTargets = document.querySelectorAll(
  '.content-card, .info-panel, .timeline-item, .domain-card, .tip-card, .pending-card, .footer-content'
);

revealTargets.forEach((element) => {
  element.classList.add('reveal');
  observer.observe(element);
});
