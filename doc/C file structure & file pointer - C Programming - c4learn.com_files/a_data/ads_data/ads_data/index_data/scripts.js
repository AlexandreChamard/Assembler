o1 = ["a0-0.01","a1-.3","a2-2.7","a4-3","a5-3"];
window.onload = function () {
    oCreate();
    cC();
    boucle("auto");
    document.getElementById("timer").addEventListener("transitionend", cCp);
}
fonduFin = .5;
var boucle;
tempsMax=30;
o2 = new Array;
o3 = new Array;
o4 = new Array;
iC = 0;
tO = 0;
stopJs = 0;
toggleOp = 1;

function cC() {
    o2Length = o2.length;
    if (boucle == 0) {o2Length=o2Length-2;}
    if (iC < o2Length) {
        document.getElementById("pub").className = "";
        for (var i = 1; i <= iC; i++) {
            if (o1[i - 2]) {
                document.getElementById("pub").classList.add(o2[i - 2] + "ff");
            }
            document.getElementById("pub").classList.add(o2[i - 1] + "f");
            document.getElementById("pub").classList.add(o2[i]);
        }
        document.getElementById("timer").style.transitionDuration =o3[iC]+"s";
        if (stopJs == 0) {
            if (toggleOp==0) {toggleOp=1} else {toggleOp=0}
            if (tO == 0) {
                tO = 1;
                document.getElementById("timer").style.opacity = 0;                
            } else {
                tO = 0;
                document.getElementById("timer").style.opacity = 1;
            }
            document.getElementById("timer").addEventListener("transitionend", cCp);
        }
    }
    else if (boucle!=0)
        {
            iC=1;
            boucle--;
            cC();
        }
}

function cCp() {
    iC++;
    cC();
}


function oCreate() {
    o1.push("fin-.5");o1.push("clear-.01");
    for (var i = 0; i < o1.length; i++) {
        var temp;
        var temp2;
        if (o1[i].indexOf("-") >= 0) {
            temp = o1[i].substring(o1[i].lastIndexOf("-")).substring(1);
            temp2 = o1[i].substring(0, o1[i].lastIndexOf("-"));
        } else {
            temp = ".5";
            temp2 = o1[i];
        }
        o2.push(temp2);
        o3.push(temp);
        o4=o1;
    }
}
function boucle(boucleTemp) {
    if (boucleTemp=="auto") {
        boucleTemp=-1;
    somme=0;
    total=0;
    
    for (var i = 0; i < o3.length; i++)
        {somme+=parseFloat(o3[i]);}
    for(var i=0;i<10;i++)
        {
         if ((total+somme-.6)<(tempsMax))
             {total+=somme;
             boucleTemp++}
        }
    }
    boucle = boucleTemp;
}
// \\ // \\ // \\ // \\
function hop() {
    document.getElementById("pub").classList.add("trnone");
    document.body.innerHTML += '<div id="chrono"></div>';
    document.body.innerHTML += '<div id="ic"></div>';
    document.body.innerHTML += '<div id="o1"></div>';
    document.body.innerHTML += '<div id="o3"></div>';
    document.body.innerHTML += '<div id="o4"></div>';
    chronoInit();
    stopEncore();
    document.getElementById('o1').innerHTML = '["'+o1.join('","')+"]";
    document.getElementById('o4').innerHTML = '["'+o4.join('","')+"]";
    setInterval(function () {
        document.getElementById('ic').innerHTML = o1[iC];
    }, 10);

    document.onkeydown = function (event) {
        var keyCode = event.which || event.keyCode;
       document.getElementById("pub").classList.remove("trnone");
        if (keyCode == 39) {
            iC++;
            cC();
            chronoStop();
        }
        if (keyCode == 37) {
            iC--;
            cC();
            chronoStop();
            document.getElementById("pub").classList.add("trnone");
        }
        if (keyCode == 38) {
            iC = 0;
            cC();
            chronoStop();
        }
        if (keyCode == 40) {
            iC = o1.length - 1;
            cC();
            chronoStop();
        }
        if (keyCode == 32) {
            stopEncore();
            chronoStop();
        }
    }
}
    function stopEncore() {
        if (stopJs == 0) {
            document.getElementById("ic").style.backgroundColor = "red";
            stopJs = 1
        } else {
            stopJs = 0;
            document.getElementById("ic").style.backgroundColor = "black";
        }
    }
function chronoInit() {
    centi = 0;
    secondes = 0;
    chronoStart();
}

function chronoStart() {
    
    centi++;
    if (centi > 99) {
        centi = 0;
        secondes++;
    }
    chronoDisplay();
    chronoTimeout = setTimeout('chronoStart()', 10);
}

function chronoStop() {
    clearTimeout(chronoTimeout);
    if (o4[iC-1]){o4[iC-1]=o2[iC-1]+"-"+secondes+"."+centi;}
    o4[o4.length-2]="fin-"+fonduFin;
    document.getElementById("o4").innerHTML='["'+o4.join('","')+"]";
       // document.getElementById('o4').innerHTML = o4;
    chronoInit();
}

function chronoDisplay() {
    if (secondes<9) {
    document.getElementById("chrono").innerHTML = secondes;}
    else {
        document.getElementById("chrono").innerHTML = "-";
    }
}