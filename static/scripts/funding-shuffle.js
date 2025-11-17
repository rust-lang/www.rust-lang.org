// From https://stackoverflow.com/a/2450976/1107768
function shuffle(array) {
  let currentIndex = array.length;

  // While there remain elements to shuffle...
  while (currentIndex !== 0) {
    // Pick a remaining element...
    let randomIndex = Math.floor(Math.random() * currentIndex);
    currentIndex--;

    // And swap it with the current element.
    [array[currentIndex], array[randomIndex]] = [
      array[randomIndex], array[currentIndex]];
  }
}

document.addEventListener("DOMContentLoaded", () => {
  // Shuffle people to reduce ordering bias
  const wrapper = document.querySelector("#people");
  const children = Array(...wrapper.children);
  shuffle(children);
  wrapper.replaceChildren(...children);
});
