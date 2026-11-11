const posts = [...document.querySelectorAll('[data-wall-post]')];

for (const post of posts) {
    const text = post.querySelector('[data-wall-text]');
    const button = post.querySelector('[data-wall-expand]');
    const refresh = () => {
        const limit = parseFloat(getComputedStyle(post).getPropertyValue('--wall-preview-height'));
        const long = text.scrollHeight > limit + 30;
        button.hidden = !long;
        const expanded = button.getAttribute('aria-expanded') === 'true';
        text.classList.toggle('is-collapsed', long && !expanded);
    };

    button.addEventListener('click', () => {
        const expanded = button.getAttribute('aria-expanded') === 'true';
        button.setAttribute('aria-expanded', String(!expanded));
        button.textContent = expanded ? 'Xem thêm' : 'Thu gọn';
        refresh();
        if (expanded && post.getBoundingClientRect().top < 0) {
            post.scrollIntoView({ block: 'start' });
        }
    });

    refresh();
    window.addEventListener('resize', refresh);
    for (const image of text.querySelectorAll('img')) image.addEventListener('load', refresh);
    document.fonts.ready.then(refresh);
}
