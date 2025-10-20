let bet = 0;
let spinAudio;

window.addEventListener("message", (event) => {

	data = event.data

	if (data.type === "play-spin-audio") {
		spinAudio = new Audio('gear-clank.mp3');
		spinAudio.volume = 0.5
		spinAudio.play();
	}
	
	if (data.type === "stop-spin-audio") {
		spinAudio.pause();
		spinAudio.remove();
	}

	if (data.type === "play-clank-audio") {
		let clankAudio = new Audio('gear-stop.mp3');
		clankAudio.volume = 0.5
		clankAudio.play();
	}
})