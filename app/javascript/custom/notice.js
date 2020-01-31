
const findNotice = () => {
  setTimeout(() => {
    console.log("me")
    removeNotice();
  }, 2000)
}

const removeNotice = () => {

  const notice = document.querySelector('.notice');

  if (notice) {
    notice.classList.toggle('hidden');
  };
}

document.addEventListener("DOMContentLoaded", findNotice());