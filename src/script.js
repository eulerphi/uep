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
    hand.show();

    let start = getHandPos();
    console.log(`start: ${start[0]}, ${start[1]}`);

    let dX = x - start[0];
    let dY = y - start[1];
    console.log(`delta: ${dX}, ${dY}`);

    hand.animate(duration, '<>')
        .during(function (pos, morph, eased) {
            moveHand(start[0] + (pos * dX), start[1] + (pos * dY));
        })
        .after(function () {
            ++step;
            runStep();
        });
}

document.querySelector('main').style.height = `${window.innerHeight}px`;

let step = 0;

let countdown = document.querySelector('#countdown');
let player = document.querySelector('#player');
let playerSource = document.querySelector('#player_source');
const controls = document.querySelector('#controls');

function clearButtons() {
    const btns = document.querySelectorAll('#controls button');
    for (let i = 0; i < btns.length; ++i) {
        btns[i].remove();
    }
}

function addButton(text, callback) {
    let el = document.createElement("button");
    el.innerHTML = text;
    el.onclick = callback;
    controls.appendChild(el);
}

function playAudio(src) {
    playerSource.setAttribute('src', `media/audio/${src}`);
    player.load();
    player.play();
}

function resetHand() {
    hand.hide();
    moveHand(5, 30);
}

function startCountdown(duration, timeoutStep) {
    const timeout_ms = 50;
    const startStepValue = step;
    let current = duration + timeout_ms;

    let fn = function () {
        current -= timeout_ms;
        let value = 100 * Math.max(0, Math.min(1, current / duration));
        countdown.style.width = `${value}%`;

        if (value > 0 && startStepValue === step) {
            setTimeout(fn, timeout_ms);
        }
        else if (value <= 0 && startStepValue === step) {
            step = timeoutStep;
            runStep();
        }
        else {
            countdown.style.width = `0%`;
        }
    };

    fn();
}

function showElement(selector) {
    let el = document.querySelector(selector);
    if (el) {
        el.style.visibility = 'visible';
    }
}

function hideElement(selector) {
    let el = document.querySelector(selector);
    if (el) {
        el.style.visibility = 'hidden';
    }
}

function runStep() {
    if (step === 0) {
        hideElement('#instruction');
        resetHand();
        addButton("start", function () {
            ++step;
            runStep();
        });
    }
    else if (step === 1) {
        clearButtons();
        showElement('#instruction');
        playAudio('S1.1.b.m4a');
    }
    else if (step === 2) {
        animateHand(50, 35, 800);
    }
    else if (step === 3) {
        playAudio('S1.1.d.m4a');
    }
    else if (step === 4) {
        resetHand();
        playAudio('S1.2.a.m4a');
    }
    else if (step === 5) {
        hand.show();
        playAudio('S1.2.c.m4a');
    }
    else if (step === 6) {
        animateHand(50, 35, 400);
    }
    else if (step === 7) {
        clearButtons();

        startCountdown(6000, 700000);

        addButton("again", function () {
            step = 700000;
            runStep();
        });
        addButton("correct", function () {
            ++step;
            runStep();
        });
    }
    else if (step === 700000) {
        clearButtons();
        resetHand();
        playAudio('S1.2.2.a-b.m4a');
    }
    else if (step === 700001) {
        step = 5;
        runStep();
    }
    else if (step === 8) {
        clearButtons();
        resetHand();
        playAudio('S1.2.1.ii.m4a');
    }
    else if (step === 9) {
        hideElement('#instruction');
        playAudio('S2.1.a.m4a');
    }
    else if (step === 10) {
        playAudio('S2.1.b.m4a');
    }
    else if (step === 11) {
        playAudio('S2.1.d.m4a');
    }
    else if (step === 12) {
        playAudio('S2.1.e.m4a');
    }
    else if (step === 13) {
        playAudio('S2.2.a.m4a');
    }
    else if (step === 14) {
        playAudio('S2.2.b.m4a');
    }
    else if (step === 15) {
        playAudio('S2.2.c.m4a');
    }
    else if (step === 16) {
        playAudio('S2.2.d.m4a');
    }
    else if (step === 17) {
        clearButtons();

        startCountdown(6000, 1700200);

        addButton("again", function () {
            step = 1700200;
            runStep();
        });
        addButton("too slow", function () {
            step = 1700300;
            runStep();
        });
        addButton("too loud", function () {
            step = 1700400;
            runStep();
        });
        addButton("correct", function () {
            ++step;
            runStep();
        });
    }
    else if (step === 1700200) {
        clearButtons();
        resetHand();
        playAudio('S2.2.2.m4a');
    }
    else if (step === 1700201) {
        step = 15;
        runStep();
    }
    else if (step === 1700300) {
        clearButtons();
        resetHand();
        playAudio('S2.2.3.m4a');
    }
    else if (step === 1700301) {
        step = 15;
        runStep();
    }
    else if (step === 1700400) {
        clearButtons();
        resetHand();
        playAudio('S2.2.4.m4a');
    }
    else if (step === 1700401) {
        step = 15;
        runStep();
    }
    else if (step === 18) {
        clearButtons();
        step = 0;
        runStep();
    }
};

player.addEventListener("ended", function () {
    player.currentTime = 0;
    ++step;
    runStep();
});

runStep();