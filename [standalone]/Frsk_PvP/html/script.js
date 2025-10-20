window.addEventListener("message", function (event) {
  if (event.data.type === "updateCombatState") {
    const indicator = document.getElementById("combatIndicator");
    indicator.style.backgroundColor = event.data.combatEnabled
      ? "#ff0000"
      : "#ffffffff";
  }
});
