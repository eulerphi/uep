// import { SVG } from '@svgdotjs/svg.js'

let hand = SVG('#hand');

function moveHand(x, y) {
    hand.move(x - 6.375, y - 0.5);
}

function animateHand(x, y, duration) {
    let startX = hand.x();
    let startY = hand.y();
    let dX = x - hand.x();
    let dY = y - hand.y();

    console.log(`delta: ${dX}, ${dY}`);

    hand.animate(duration, '<>').during(function (pos, morph, eased) {
        moveHand(startX + (pos * dX), startY + (pos * dY));
    });
}

// hand.animate(8000, '<>').during(function (pos, morph, eased) {
//     var p = path.pointAt(eased * length)
//     hand.center(p.x, p.y)
// });