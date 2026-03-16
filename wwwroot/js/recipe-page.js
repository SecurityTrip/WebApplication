function syncStepsHeight() {
    const left = document.querySelector('.recipe-page .left-col');
    const steps = document.querySelector('.recipe-page .steps');
    if (!left || !steps) return;
    const leftRect = left.getBoundingClientRect();
    steps.style.height = leftRect.height + 'px';
}
window.addEventListener('load', syncStepsHeight);
window.addEventListener('resize', () => { setTimeout(syncStepsHeight, 50); });
