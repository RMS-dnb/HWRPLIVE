let bet = 0;

window.addEventListener("message", (event) => {

	data = event.data

	if (data.type === "nui-open") {
		document.getElementById("container").style.display = "flex";
	}

	if (data.type === "nui-close") {
		document.getElementById("container").style.display = "none";
		document.getElementById("betNum").innerHTML = 0;
		document.getElementById("counter").style.visibility = "hidden";
		bet = 0;
	}

	if (data.type === "update-timer") {
		document.getElementById("counter").style.visibility = "visible";
		document.getElementById("counterNum").innerHTML = data.number;
	}

	if (data.type === "hide-timer") {
		document.getElementById("counter").style.visibility = "hidden";
	}

	if (data.type === "update-bet") {
		if (data.number === 0 || data.number === "0") {
			return
		}
		bet += Number(Math.round(data.number * 100) / 100);
		document.getElementById("betNum").innerHTML = bet;
	}

	if (data.type === "play-dice-audio") {
		var audio = new Audio('dice_roll.mp3');
		audio.play();
	}

	if (data.type === "play-chip-audio") {
		var audio = new Audio('chip_sound.mp3');
		audio.play();
	}
})