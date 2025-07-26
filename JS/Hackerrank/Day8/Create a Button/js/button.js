let btn = document.getElementById('btn');

function incrument(){
   let c = parseInt(btn.innerText);
   btn.innerText = c + 1;
}

btn.onclick = incrument;
