let container = document.createElement('div');
container.className = 'cont';

for (let i = 1;i <= 9; i++) {
    let btn = document.createElement('button');
    btn.innerText = i.toString();
    btn.id = "btn" + i;
    container.appendChild(btn);
}

document.body.appendChild(container);

let btn5 = document.getElementById('btn5');
let prv = document.getElementById('btn1');

function rotateClockwise() {

    const ids = ["btn1", "btn2", "btn3", "btn6", "btn9", "btn8", "btn7", "btn4"];

    let values = ids.map(id => document.getElementById(id).innerText);

    
    for (let i = 0; i < ids.length; i++) {
        let from = (i + 7) % 8;  
        document.getElementById(ids[i]).innerText = values[from];
    }
};

btn5.onclick = rotateClockwise;
