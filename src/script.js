// import { SVG } from '@svgdotjs/svg.js'

let hand = SVG('#hand');

const HandXOffset = -6.375;
const HandYOffset = -0.5;

function getHandPos() {
    return [hand.x() - HandXOffset, hand.y() - HandYOffset];
}

function moveHand(x, y) {
    hand.move(x + HandXOffset, y + HandYOffset);
}

function animateHand(x, y, duration) {
    let start = getHandPos();
    console.log(`start: ${start[0]}, ${start[1]}`);

    let dX = x - start[0];
    let dY = y - start[1];
    console.log(`delta: ${dX}, ${dY}`);

    hand.animate(duration, '<>').during(function (pos, morph, eased) {
        moveHand(start[0] + (pos * dX), start[1] + (pos * dY));
    });
}

// hand.animate(8000, '<>').during(function (pos, morph, eased) {
//     var p = path.pointAt(eased * length)
//     hand.center(p.x, p.y)
// });