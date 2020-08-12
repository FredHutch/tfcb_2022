build() {
pandoc -t revealjs \
    --include-in-header simple-small.css \
    -V revealjs-url="https://unpkg.com/reveal.js@3.9.2" \
    -V theme=white \
    -V transition=none \
    -o slides.html \
    --standalone slides.md
}

build

while :; do inotifywait -e modify slides.md; build; done

