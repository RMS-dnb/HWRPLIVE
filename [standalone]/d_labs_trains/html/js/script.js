let texts = null;
let yersText = null;
let hudConfig = null;

let currentMode = "read";
let boardData = [];
let currentEditIndex = null;
let currentBoardName = "";

function editHUD() {
    const tachometerElement = document.getElementById('tachometer');
    const scale = hudConfig.trainHudScale / 100; 
    let hudPosition = hudConfig.trainHUDposition;

    tachometerElement.style.opacity = hudConfig.opacity;

    const defaultSize = 360;
    const scaledSize = defaultSize * scale ;

    tachometerElement.style.top = '';
    tachometerElement.style.bottom = '';
    tachometerElement.style.left = '';
    tachometerElement.style.right = '';
    tachometerElement.style.transform = '';
    tachometerElement.style.margin = '';

    if (hudPosition === 'bottom-middle') {
        tachometerElement.style.bottom = '2%';
        tachometerElement.style.left = '50%';
        tachometerElement.style.transform = `translateX(-50%) scale(${scale})`;
        tachometerElement.style.marginBottom = `-${(defaultSize - scaledSize) / 2}px`;
    } else if (hudPosition === 'bottom-left') {
        tachometerElement.style.bottom = '5%';
        tachometerElement.style.left = '5%';
        tachometerElement.style.transform = `translate(-5%, -5%) scale(${scale})`;
        tachometerElement.style.marginLeft = `-${(defaultSize - scaledSize) / 2}px`;
        tachometerElement.style.marginBottom = `-${(defaultSize - scaledSize) / 2}px`;
    } else if (hudPosition === 'bottom-right') {
        tachometerElement.style.bottom = '4%';
        tachometerElement.style.right = '2%';
        tachometerElement.style.transform = `translate(5%, 5%) scale(${scale})`;
        tachometerElement.style.marginBottom = `-${(defaultSize - scaledSize) / 2}px`;
        tachometerElement.style.marginRight = `-${(defaultSize - scaledSize) / 2}px`;
    } else if (hudPosition === 'middle-right') {
        tachometerElement.style.top = '50%';
        tachometerElement.style.right = '2%';
        tachometerElement.style.transform = `translateY(-50%) scale(${scale})`;
        tachometerElement.style.marginRight = `-${(defaultSize - scaledSize) / 2}px`;
    } else if (hudPosition === 'top-right') {
        tachometerElement.style.top = '2%';
        tachometerElement.style.right = '2%';
        tachometerElement.style.transform = `translate(0%, 5%) scale(${scale})`;
        tachometerElement.style.marginTop = `-${(defaultSize - scaledSize) / 2}px`;
        tachometerElement.style.marginRight = `-${(defaultSize - scaledSize) / 2}px`;
    } else if (hudPosition === 'top-middle') {
        tachometerElement.style.top = '2%';
        tachometerElement.style.left = '50%';
        tachometerElement.style.transform = `translateX(-50%) scale(${scale})`;
        tachometerElement.style.marginTop = `-${(defaultSize - scaledSize) / 2}px`;
    } else if (hudPosition === 'top-left') {
        tachometerElement.style.top = '2%';
        tachometerElement.style.left = '2%';
        tachometerElement.style.transform = `translate(0%, 5%) scale(${scale})`;
        tachometerElement.style.marginTop = `-${(defaultSize - scaledSize) / 2}px`;
        tachometerElement.style.marginLeft = `-${(defaultSize - scaledSize) / 2}px`;
    } else if (hudPosition === 'left-middle') {
        tachometerElement.style.top = '50%';
        tachometerElement.style.left = '2%';
        tachometerElement.style.transform = `translateY(-50%) scale(${scale})`;
        tachometerElement.style.marginLeft = `-${(defaultSize - scaledSize) / 2}px`;
    } else {
        tachometerElement.style.bottom = '2%';
        tachometerElement.style.left = '50%';
        tachometerElement.style.transform = `translateX(-50%) scale(${scale})`;
        tachometerElement.style.marginBottom = `-${(defaultSize - scaledSize) / 2}px`;
    }
}


function translatePage() {
    document.getElementById("emptyWatermark").innerText = texts.nui.emptyWatermark;
    document.querySelector("#boardTable th:nth-child(1)").innerText = texts.nui.date;
    document.querySelector("#boardTable th:nth-child(2)").innerText = texts.nui.time;
    document.querySelector("#boardTable th:nth-child(3)").innerText = texts.nui.content;
    document.querySelector("#boardTable th:nth-child(4)").innerText = texts.nui.price;
    document.getElementById("addRowButton").innerText = texts.nui.addRow;
    document.querySelector("#editContainer button:nth-child(2)").innerText = texts.nui.save;

    document.querySelector("#editForm h3").innerText = texts.nui.editRow;
    document.querySelector("#editForm label[for='editDate']").innerText = texts.nui.date;
    document.querySelector("#editForm label[for='editTime']").innerText = texts.nui.time;
    document.querySelector("#editForm label[for='editContent']").innerText = texts.nui.content;
    document.querySelector("#editForm label[for='editPrice']").innerText = texts.nui.price;
    document.getElementById("editDate").placeholder = texts.nui.placeholderDate;
    document.getElementById("editTime").placeholder = texts.nui.placeholderTime;
    document.getElementById("editContent").placeholder = texts.nui.placeholderContent;
    document.getElementById("editPrice").placeholder = texts.nui.placeholderPrice;
    document.getElementById("saveButton").innerText = texts.nui.save;
    document.getElementById("repeatLabel").innerText = texts.nui.repeatDaily;

    document.querySelector("#train-price").firstChild.textContent = texts.nui.trainPrice + " ";
    document.querySelector("#train-speed").firstChild.textContent = texts.nui.trainSpeed + " ";
    document.querySelector("#train-stash").firstChild.textContent = texts.nui.trainStash + " ";
    document.querySelector("#train-size").firstChild.textContent = texts.nui.trainSize + " ";

    document.getElementById("left-arrow").innerText = texts.nui.leftArrow;
    document.getElementById("right-arrow").innerText = texts.nui.rightArrow;
    document.getElementById("exit-button").innerText = texts.nui.exitButton;
    document.getElementById("buy-button").innerText = texts.nui.buyButton;
    document.getElementById("camera-button").innerText = texts.nui.cameraButton;

    document.getElementById("nui-sendButton").innerText = texts.nui.sendButton;

}

window.addEventListener('message', function(event) {
    var data = event.data;

    if (data.action === 'texts_send') {
        texts = data.text; 
        yersText = data.inform;
        hudConfig = data.hud;
        translatePage()   
        editHUD()
    } else if (data.action === 'input') {
        document.getElementById('nui-input-container').style.display = 'block';
        document.getElementById('nui-textInput').value = "";
        document.getElementById('nui-textInput').placeholder = event.data.placeholderText || "Insert Text";
    } else if (data.buy) {
        buyMenu(data);
    } else if (data.showNUI) {
        var hudElement = document.getElementById("hud-old");
        hudElement.style.display = "block";
        updateShowUI(data.showNUI);
    } else if (data.showNUI === false) {
        var hudElement = document.getElementById("hud-old");
        hudElement.style.display = "none";
    } else if (data.action === 'open_board') {
        currentMode = data.mode;
        currentTitle = data.title;
        currentBoardName = data.title;
    
        if (data.data && data.data.length > 0) {
            boardData = data.data.map(row => ({
                ...row,
                date: row.date === false ? getCurrentDate() : row.date
            }));
            document.getElementById("emptyWatermark").style.display = "none";
        } else {
            boardData = [];
            document.getElementById("emptyWatermark").style.display = "block"; 
        }
    
        renderTable(currentTitle, boardData);
    }    
});

function renderTable(title, data) {
    document.getElementById("boardTitle").innerText = title;

    const dateText = texts.nui.date;
    const timeText = texts.nui.time;
    const contentText = texts.nui.content;
    const priceText = texts.nui.price;
    const actionsText = texts.nui.actions;

    let tableHeader = `
        <tr>
            <th>${dateText}</th>
            <th>${timeText}</th>
            <th>${contentText}</th>
            <th>${priceText}</th>`;
    if (currentMode === 'edit') {
        tableHeader += `<th>${actionsText}</th>`;
    }

    tableHeader += `</tr>`;

    let tableContent = '';
    data.forEach(function(row, index) {
        tableContent += `<tr id="row-${index}">
            <td><span>${(row.date === false || row.date === "0") ? getCurrentDate() + ' ' + yersText : row.date + ' ' + yersText}</span></td>
            <td><span>${row.time}</span></td>
            <td><span>${row.content}</span></td>
            <td><span>${row.price}</span></td>`;
        
        if (currentMode === 'edit') {
            tableContent += `
            <td>
                <button class="table-action-button" onclick="openEditForm(${index})">✏️</button>
                <button class="table-action-button" onclick="deleteRow(${index})">❌</button>
            </td>`;
        }

        tableContent += `</tr>`;
    });

    document.getElementById("boardBody").innerHTML = tableContent;
    document.getElementById("boardTable").querySelector("thead").innerHTML = tableHeader;

    document.getElementById("boardContainer").style.display = "block";
    document.getElementById("editContainer").style.display = currentMode === "edit" ? "block" : "none";
}


function openEditForm(index = null) {
    currentEditIndex = index;

    if (index !== null) {
        const row = boardData[index];
        document.getElementById("editDate").value = row.date === false ? '' : row.date;
        document.getElementById("editTime").value = row.time || '';
        document.getElementById("editContent").value = row.content || '';
        document.getElementById("editPrice").value = row.price || '';
        document.getElementById("repeatTime").checked = row.date === false;
    } else {
        document.getElementById("editDate").value = '';
        document.getElementById("editTime").value = '';
        document.getElementById("editContent").value = '';
        document.getElementById("editPrice").value = '';
        document.getElementById("repeatTime").checked = false;
    }

    toggleDateInput();
    document.getElementById("editFormOverlay").style.display = "flex";
}

function validateForm() {
    const date = document.getElementById("editDate").value;
    const time = document.getElementById("editTime").value;
    const content = document.getElementById("editContent").value;
    const price = document.getElementById("editPrice").value;
    const isRepeating = document.getElementById("repeatTime").checked;

    let isValid = true;

    if (!isRepeating && date === '') {
        isValid = false;
    }

    if (time === '' || content === '' || price === '') {
        isValid = false;
    }

    const saveButton = document.getElementById("saveButton");
    if (isValid) {
        saveButton.classList.add('active');
    } else {
        saveButton.classList.remove('active');
    }
}


function validateAndSave() {
    const saveButton = document.getElementById("saveButton");
    if (!saveButton.classList.contains('active')) {
        return; 
    }

    const date = document.getElementById("editDate").value;
    const time = document.getElementById("editTime").value;
    const content = document.getElementById("editContent").value;
    const price = document.getElementById("editPrice").value;
    const isRepeating = document.getElementById("repeatTime").checked;

    if ((!isRepeating && date === '') || time === '' || content === '' || price === '') {
        alert("Please fill out all fields.");
        return;
    }

    if (currentEditIndex === null) {
        boardData.push({
            date: isRepeating ? false : date,
            time: time,
            content: content,
            price: price
        });
    } else {
        boardData[currentEditIndex] = {
            date: isRepeating ? false : date,
            time: time,
            content: content,
            price: price
        };
    }

    document.getElementById("editFormOverlay").style.display = "none";
    renderTable(currentTitle, boardData);
}

function cancelEdit() {
    document.getElementById("editFormOverlay").style.display = "none";
}

function deleteRow(index) {
    boardData.splice(index, 1);
    renderTable(currentTitle, boardData);
}

function getCurrentDate() {
    const today = new Date();
    return `${String(today.getMonth() + 1).padStart(2, '0')}-${String(today.getDate()).padStart(2, '0')}`;
}

function toggleDateInput() {
    const isChecked = document.getElementById("repeatTime").checked;
    const dateInput = document.getElementById("editDate");

    if (isChecked) {
        dateInput.value = '';  
        dateInput.disabled = true; 
    } else {
        dateInput.disabled = false; 
    }
    validateForm(); 
}

function saveBoard() {
    fetch(`https://${GetParentResourceName()}/saveBoard`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8'
        },
        body: JSON.stringify({
            boardName: currentBoardName,
            boardData: boardData
        })
    }).then(resp => resp.json()).then(resp => {
        closeBoard();
    });
}

function closeBoard() {
    fetch(`https://${GetParentResourceName()}/closeBoard`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8'
        },
        body: JSON.stringify({})
    }).then(resp => resp.json()).then(resp => {
        document.getElementById("boardContainer").style.display = "none";
    });
}


/* buy menu */ 

function buyMenu(data) {
    switch (data.action) {
        case 'display':
            handleDisplay(data);
            updateTrainInfo(data);
            break;
        case 'updateTrainInfo':
            updateTrainInfo(data);
            break;
        default:
            console.error("Received unknown action:", data.action);
    }
}

function handleDisplay(data) {
    if (data.show) {
        showNUI();
    } else {
        hideNUI();
    }
}

function updateTrainInfo(data) {
    document.getElementById('train-name').textContent = data.name || "Neznámý";
    document.getElementById('train-price').querySelector('span').textContent = data.price || 0;
    document.getElementById('train-speed').querySelector('span').textContent = data.speed || 0;
    document.getElementById('train-stash').querySelector('span').textContent = data.stash || 0;
    document.getElementById('train-size').querySelector('span').textContent = data.size || 0;
    document.getElementById('train-id').value = data.id || '';
}

let locked = false;

function debounceButton(buttonId, callback) {
    const button = document.getElementById(buttonId);
    button.addEventListener('click', function () {
        if (locked) return;
		locked = true;
		callback();
		button.disabled = true;
		setTimeout(() => {
			locked = false;
			button.disabled = false;
		}, 1000);
    });
}

debounceButton('left-arrow', () => fetchNui('left'));
debounceButton('right-arrow', () => fetchNui('right'));


document.getElementById('exit-button').addEventListener('click', function() {
    hideNUI()
    fetchNui('exit');
});

document.getElementById('camera-button').addEventListener('click', function() {
    fetchNui('camera');
});

function fetchNui(command, data = {}) {
    fetch(`https://${GetParentResourceName()}/${command}`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    }).then(response => response.json()).then(data => {
        if (data && data.action) {
            buyMenu(data);
        }
    });
}


function showNUI() {
    var nuiWrapper = document.getElementById('nui-wrapper');
    nuiWrapper.style.display = 'block';
    nuiWrapper.classList.add('visibleSlideRight');

    nuiWrapper.addEventListener('animationend', function() {
        nuiWrapper.classList.remove('visibleSlideRight'); 
    }, { once: true });
}


function hideNUI() {
    var nuiWrapper = document.getElementById('nui-wrapper');
    nuiWrapper.classList.add('hiddenSlideRight');

    nuiWrapper.addEventListener('animationend', function() {
        nuiWrapper.style.display = 'none';
        nuiWrapper.classList.remove('hiddenSlideRight'); 
    }, { once: true });
}

document.getElementById('buy-button').addEventListener('click', function() {
    const trainData = {
        name: document.getElementById('train-name').textContent,
        price: document.getElementById('train-price').querySelector('span').textContent,
        speed: document.getElementById('train-speed').querySelector('span').textContent,
        stash: document.getElementById('train-stash').querySelector('span').textContent,
        size: document.getElementById('train-size').querySelector('span').textContent,
        id: document.getElementById('train-id').value
    };
    fetchNui('buy', trainData);
    hideNUI();
});


// hud train main

function showTachometerCustom(speed, pressure, text) {
    updateShowUI({ speed: speed, pressure: pressure, text: text });
}

function updateShowUI(showNUI) {
    const minRotation = -120;
    const maxRotation = 120; 
    const maxSpeed = 120; 

    if (showNUI) {
        smoothUpdateSpeed(showNUI.speed, minRotation, maxRotation, maxSpeed);
        updatePressureBar(showNUI.pressure);
        updateTextAboveNeedle(showNUI.text);
    }
}

let currentRotation = -120;
let animationFrameId = null;
let targetRotation = 0;

function smoothUpdateSpeed(targetSpeed, minRotation, maxRotation, maxSpeed) {
    targetSpeed = Math.min(Math.max(targetSpeed, 0), maxSpeed);
    targetRotation = minRotation + (targetSpeed / maxSpeed) * (maxRotation - minRotation);

    if (animationFrameId === null) {
        animate();
    }
}

function animate() {
    const speed = 0.1;
    const diff = targetRotation - currentRotation;
    currentRotation += diff * speed;

    document.querySelector('.needle').style.transform = `rotate(${currentRotation}deg)`;

    if (Math.abs(diff) > 0.1) {
        animationFrameId = requestAnimationFrame(animate);
    } else {
        currentRotation = targetRotation;
        document.querySelector('.needle').style.transform = `rotate(${currentRotation}deg)`;
        animationFrameId = null;
    }
}


function updatePressureBar(pressure) {
    const pressureBar = document.getElementById('pressureHudBar');
    const normalizedPressure = Math.min(pressure, 200); 

    let red, green, blue;

    if (normalizedPressure <= 50) {
        red = Math.floor(169 + (normalizedPressure / 50) * (255 - 169));
        green = Math.floor(169 - (normalizedPressure / 50) * (169 - 165));
        blue = Math.floor(169 - (normalizedPressure / 50) * 169);
    } else {
        red = 255;
        green = Math.floor(165 - ((normalizedPressure - 50) / 50) * 165);
        blue = 0;
    }

    pressureBar.style.backgroundColor = `rgb(${red}, ${green}, ${blue})`;

    if (pressure > 100) {
        const shadowIntensity = Math.min((pressure - 100) / 100, 1) * 20;
        pressureBar.style.boxShadow = `0 0 ${shadowIntensity * 2}px ${shadowIntensity}px rgba(255, 0, 0, 0.3), 
                                       0 0 ${shadowIntensity * 4}px ${shadowIntensity * 2}px rgba(255, 0, 0, 0.2), 
                                       0 0 ${shadowIntensity * 6}px ${shadowIntensity * 4}px rgba(255, 0, 0, 0.1)`;
        pressureBar.classList.add('pulse');
    } else {
        pressureBar.style.boxShadow = 'none';
        pressureBar.classList.remove('pulse');
    }
}

function updateTextAboveNeedle(text) {
    const textElement = document.getElementById('textAboveNeedle');
    textElement.innerText = text;
}

/* Imput  */ 

document.getElementById('nui-sendButton').addEventListener('click', function() {
    let text = document.getElementById('nui-textInput').value;
    fetch(`https://${GetParentResourceName()}/sendText`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8'
        },
        body: JSON.stringify({
            text: text
        })
    });

    document.getElementById('nui-input-container').style.display = 'none';
});

document.getElementById('nui-closeButton').addEventListener('click', function() {
    document.getElementById('nui-input-container').style.display = 'none';
    fetch(`https://${GetParentResourceName()}/closeNUI`, { method: 'POST' });
});
